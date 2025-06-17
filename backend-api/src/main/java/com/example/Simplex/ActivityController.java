package com.example.Simplex;

import java.time.LocalDateTime;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.example.Simplex.Song.Song;
import com.example.Simplex.Song.SongRepository;
import com.example.Simplex.User.User;

import jakarta.servlet.http.HttpSession;

@Controller
@RequestMapping("/activity")
public class ActivityController {

    @Autowired
    private SongRepository songRepository;

    @GetMapping
    public String getActivityFeed(@RequestParam Long songId, Model model, HttpSession session) {
        User currentUser = (User) session.getAttribute("currentUser");
        if (currentUser == null)
            return "redirect:/user/login";

        Song song = songRepository.findById(songId).orElseThrow();
        model.addAttribute("song", song);
        model.addAttribute("currentUser", currentUser);
        return "activity";
    }
}