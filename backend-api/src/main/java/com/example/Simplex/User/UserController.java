package com.example.Simplex.User;

import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.List;
import java.util.Optional;
import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.example.Simplex.Song.Song;
import com.example.Simplex.Song.SongRepository;
import com.example.Simplex.Song.SongService;

import jakarta.servlet.http.HttpSession;

@Controller
@RequestMapping("/user")
public class UserController {

    @Autowired
    private UserService userService;

    @Autowired
    private UserRepository userRepository;

    @Autowired
    private SongService songService;

    @Autowired
    private SongRepository songRepository;

    @Value("${upload.directory}")
    private String uploadDirectory;

    @GetMapping("/register")
    public String showRegistrationForm(Model model) {
        model.addAttribute("user", new User());
        return "register";
    }

    @PostMapping("/register")
    public String registerUser(@ModelAttribute User user, Model model) {
        try {
            userService.createUser(user);
            return "redirect:/user/browse-song";
        } catch (Exception e) {
            model.addAttribute("error", "Registration failed: " + e.getMessage());
            return "register";
        }
    }

    @GetMapping({ "/", "/login" })
    public String showLoginForm(@RequestParam(required = false) String error, Model model) {
        if (error != null) {
            model.addAttribute("error", "Invalid username or password");
        }
        return "sign-in";
    }

    @PostMapping("/login")
    public String loginUser(@RequestParam String userName, @RequestParam String password, HttpSession session,
            Model model) {
        Optional<User> user = userService.findUserForAuthentication(userName);
        if (user.isPresent() && user.get().getPassword().equals(password)) {
            session.setAttribute("currentUser", user.get());
            return "redirect:/user/browse-song";
        }
        return "redirect:/user/login?error=true";
    }

    @GetMapping("/logout")
    public String logout(HttpSession session) {
        session.invalidate();
        return "redirect:/user/login";
    }

    @GetMapping("/browse-song")
    public String showBrowsePage(HttpSession session, Model model) {
        User user = (User) session.getAttribute("currentUser");
        if (user == null) {
            return "redirect:/user/login";
        }
        model.addAttribute("currentUser", user);

        List<Song> songs = (List<Song>) songService.getAllSongs();
        model.addAttribute("songs", songs);
        model.addAttribute("currentUser", user);

        return "browse-song";
    }

    @GetMapping("/upload")
    public String showUploadPage(HttpSession session, Model model) {
        User user = (User) session.getAttribute("currentUser");
        if (user == null) {
            return "redirect:/user/login";
        }
        model.addAttribute("currentUser", user);
        return "upload-song";
    }

    @GetMapping("/profile")
    public String showProfilePage(HttpSession session, Model model) {
        User sessionUser = (User) session.getAttribute("currentUser");
        if (sessionUser == null) {
            return "redirect:/user/login";
        }

        User currentUser = userRepository.findById(sessionUser.getUserId()).orElse(null);
        if (currentUser == null)
            return "redirect:/user/login";

        List<Song> userSong = songRepository.findByArtistContainingIgnoreCase(currentUser.getUserName());

        model.addAttribute("currentUser", sessionUser);
        model.addAttribute("songs", userSong);
        return "profile";
    }

    @GetMapping("/profile/edit")
    public String showEditProfileForm(HttpSession session, Model model) {
        User user = (User) session.getAttribute("currentUser");
        if (user == null) {
            return "redirect:/user/login";
        }
        model.addAttribute("user", user);
        return "profile-edit";
    }

    @PostMapping("/profile/update")
    public String updateProfile(@ModelAttribute User updatedUser,
            @RequestParam(value = "profileImage", required = false) MultipartFile profileImage,
            HttpSession session) throws IOException {
        User currentUser = (User) session.getAttribute("currentUser");
        if (currentUser == null) {
            return "redirect:/user/login";
        }

        currentUser.setUserName(updatedUser.getUserName());
        currentUser.setEmail(updatedUser.getEmail());
        currentUser.setBio(updatedUser.getBio());

        if (profileImage != null && !profileImage.isEmpty()) {
            String imageFileName = UUID.randomUUID() + "_" + profileImage.getOriginalFilename();
            Path uploadPath = Paths.get(uploadDirectory);
            if (!Files.exists(uploadPath)) {
                Files.createDirectories(uploadPath);
            }
            Files.copy(profileImage.getInputStream(), uploadPath.resolve(imageFileName));
            currentUser.setProfileImagePath("/uploads/" + imageFileName);
        }

        userService.updateUser(currentUser.getUserId(), currentUser);
        return "redirect:/user/profile";
    }
}