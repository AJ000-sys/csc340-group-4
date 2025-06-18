package com.example.Simplex;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.example.Simplex.User.User;

import jakarta.servlet.http.HttpSession;

@Controller
@RequestMapping("/comments")
public class CommentController {

    @Autowired
    private CommentService commentService;

    @PostMapping
    public String createComment(
            @RequestParam Long songId,
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

      @GetMapping("/comments")
  public String showComments(Model model) {
    model.addAttribute("comments", commentService.getAllComments());
    return "comment_form"; // Renders comment_form.ftl
  }

    @PostMapping("/post-comment")
  public String postComment(@RequestParam String commentText) {
    commentService.saveComment(commentText);
    return "redirect:/comments"; // Refreshes the page
  }

    @PostMapping("/reply")
    public String createReply(
            @RequestParam Long parentCommentId,
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

    @GetMapping("/song/{songId}")
    public String getCommentsBySong(@PathVariable Long songId, Model model) {
        model.addAttribute("comments", commentService.getTopLevelCommentsBySong(songId));
        return "fragments/comments";
    }
}