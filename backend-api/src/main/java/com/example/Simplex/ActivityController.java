package com.example.Simplex;

import java.time.LocalDateTime;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.example.Simplex.Song.Song;
import com.example.Simplex.Song.SongRepository;
import com.example.Simplex.User.User;

import jakarta.servlet.http.HttpSession;

@Controller
@RequestMapping("/activity")
public class ActivityController {

    @Autowired
    private CommentRepository commentRepository;

    @Autowired
    private CommentService commentService;

    @Autowired
    private SongRepository songRepository;

    @GetMapping
    public String getActivityFeed(@RequestParam Long songId, Model model, HttpSession session) {
        User currentUser = (User) session.getAttribute("currentUser");
        if (currentUser == null)
            return "redirect:/user/login";

        Song song = songRepository.findById(songId).orElseThrow();
        List<Comment> comments = commentRepository.findTopLevelCommentsBySong(song);

        model.addAttribute("song", song);
        model.addAttribute("comments", comments);
        model.addAttribute("currentUser", currentUser);
        return "activity";
    }

    @PostMapping("/comment")
    public String postComment(@RequestParam Long songId,
            @RequestParam String content,
            HttpSession session,
            RedirectAttributes redirectAttributes) {
        User user = (User) session.getAttribute("currentUser");
        if (user == null) {
            redirectAttributes.addFlashAttribute("error", "You must be logged in to post comments");
            return "redirect:/user/login";
        }

        try {
            commentService.createComment(user.getUserId(), songId, content);
            redirectAttributes.addFlashAttribute("success", "Comment posted successfully");
        } catch (Exception e) {
            redirectAttributes.addFlashAttribute("error", "Failed to post comment: " + e.getMessage());
        }
        return "redirect:/song/" + songId;
    }

    @PostMapping("/reply")
    public String postReply(@RequestParam Long parentCommentId,
            @RequestParam Long songId,
            @RequestParam String content,
            HttpSession session,
            RedirectAttributes redirectAttributes) {
        User user = (User) session.getAttribute("currentUser");
        if (user == null) {
            redirectAttributes.addFlashAttribute("error", "You must be logged in to post replies");
            return "redirect:/user/login";
        }

        try {
            commentService.createReply(user.getUserId(), parentCommentId, content);
            redirectAttributes.addFlashAttribute("success", "Reply posted successfully");
        } catch (Exception e) {
            redirectAttributes.addFlashAttribute("error", "Failed to post reply: " + e.getMessage());
        }
        return "redirect:/song/" + songId;
    }
}