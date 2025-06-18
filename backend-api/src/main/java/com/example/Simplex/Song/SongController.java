package com.example.Simplex.Song;

import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
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
import com.example.Simplex.User.UserRepository;

import jakarta.servlet.http.HttpSession;

@Controller
@RequestMapping("/song")
public class SongController {

    @Autowired
    private SongService songService;

    @Autowired
    private SongRepository songRepository;

    @Autowired
    private UserRepository userRepository;

    @Value("${upload.directory}")
    private String uploadDirectory;

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

        Song song = songRepository.findById(songId).orElse(null);
        if (song == null || song.getTitle() == null || song.getArtist() == null || song.getFilePath() == null) {
            return "redirect:/user/browse-song";
        }

        model.addAttribute("song", song);
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

    @GetMapping("/{songId}/edit")
    public String showEditForm(@PathVariable Long songId, Model model, HttpSession session) {
        User currentUser = (User) session.getAttribute("currentUser");
        if (currentUser == null) {
            return "redirect:/user/login";
        }

        Song song = songRepository.findById(songId).orElse(null);
        if (song == null || !song.getArtist().equals(currentUser.getUserName())) {
            return "redirect:/user/profile";
        }

        model.addAttribute("song", song);
        return "edit-song";
    }

    @PostMapping("/{songId}/edit")
    public String updateSong(
            @PathVariable Long songId,
            @RequestParam String title,
            @RequestParam String genre,
            @RequestParam(required = false) MultipartFile coverImage,
            HttpSession session) throws IOException {

        User currentUser = (User) session.getAttribute("currentUser");
        if (currentUser == null) {
            return "redirect:/user/login";
        }

        Song song = songRepository.findById(songId).orElse(null);
        if (song == null || !song.getArtist().equals(currentUser.getUserName())) {
            return "redirect:/user/profile";
        }

        song.setTitle(title);
        song.setGenre(genre);

        if (coverImage != null && !coverImage.isEmpty()) {
            String imageFileName = UUID.randomUUID() + "_" + coverImage.getOriginalFilename();
            Path uploadPath = Paths.get(uploadDirectory);
            if (!Files.exists(uploadPath)) {
                Files.createDirectories(uploadPath);
            }
            Files.copy(coverImage.getInputStream(), uploadPath.resolve(imageFileName));
            song.setCoverImagePath("/uploads/" + imageFileName);
        }

        songRepository.save(song);
        return "redirect:/user/profile";
    }

    @GetMapping("/{songId}/delete")
    public String deleteSong(@PathVariable Long songId, HttpSession session) {
        User currentUser = (User) session.getAttribute("currentUser");
        if (currentUser == null) {
            return "redirect:/user/login";
        }

        Song song = songRepository.findById(songId).orElse(null);
        if (song == null || !song.getArtist().equals(currentUser.getUserName())) {
            return "redirect:/user/profile";
        }

        songRepository.deleteById(songId);
        return "redirect:/user/profile";
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