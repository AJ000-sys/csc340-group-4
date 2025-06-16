package com.example.Simplex.Song;

import java.io.IOException;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.example.Simplex.User.User;

import jakarta.servlet.http.HttpSession;

@Controller
@RequestMapping("/song")
public class SongController {

    @Autowired
    private SongService songService;

    @GetMapping
    public Object getAllSongs() {
        return songService.getAllSongs();
    }

    @GetMapping("/title/{title}")
    public Object getSongsByTitle(@PathVariable String title) {
        return songService.getSongsByTitle(title);
    }

    @GetMapping("/artist/{artist}")
    public Object getSongsByArtist(@PathVariable String artist) {
        return songService.getSongsByArtist(artist);
    }

    @GetMapping("/genre/{genre}")
    public Object getSongsByGenre(@PathVariable String genre) {
        return songService.getSongsByGenre(genre);
    }

    @GetMapping("/{songId}")
    public String getSongById(@PathVariable long songId, Model model, HttpSession session) {
        User user = (User) session.getAttribute("currentUser");
        if (user == null)
            return "redirect:/user/login";

        Object songObj = songService.getSongsById(songId);
        if (!(songObj instanceof Song))
            return "redirect:/user/browse-song";

        Song song = (Song) songObj;
        if (song.getTitle() == null || song.getArtist() == null || song.getFilePath() == null) {
            return "redirect:/user/browse-song";
        }

        model.addAttribute("song", songObj);
        model.addAttribute("currentUser", user);
        return "song";
    }

    @PostMapping("/upload")
    public String handleUpload(@RequestParam String title,
            @RequestParam String artist,
            @RequestParam String genre,
            @RequestParam("audioFile") MultipartFile audioFile,
            @RequestParam(value = "coverImage", required = false) MultipartFile coverImage,
            HttpSession session, Model model) throws IOException {

        User user = (User) session.getAttribute("currentUser");
        if (user == null) {
            model.addAttribute("error", "You must be logged in to upload a song");
            return "redirect:/user/login";
        }

        try {
            Song song = new Song(title, user.getUserName(), genre);
            songService.createSong(song, audioFile, coverImage);
            return "redirect:/user/browse-song";
        } catch (Exception e) {
            model.addAttribute("error", "Upload failed: " + e.getMessage());
            return "upload-song";
        }
    }

    @PutMapping("/{songId}")
    public Object updateSong(@PathVariable Long songId, @RequestBody Song song) {
        songService.updateSong(songId, song);
        return "redirect:/user/browse-song";
    }

    @DeleteMapping("/{songId}")
    public Object deleteSong(@PathVariable Long songId) {
        songService.deleteSong(songId);
        return "redirect:/user/browse-song";
    }
}
