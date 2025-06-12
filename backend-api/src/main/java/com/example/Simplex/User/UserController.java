package com.example.Simplex.User;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import jakarta.servlet.http.HttpSession;

@Controller
@RequestMapping("/user")
public class UserController {

    @Autowired
    private UserService userService;

    @Autowired
    private UserRepository userRepository;

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

    @GetMapping("/login")
    public String showLoginForm() {
        return "sign-in";
    }

    @PostMapping("/login")
    public String loginUser(@RequestParam String userName, 
                          @RequestParam String password,
                          HttpSession session,
                          Model model) {
        List<User> users = userRepository.findByUserName(userName);
        if (!users.isEmpty() && users.get(0).getPassword().equals(password)) {
            session.setAttribute("currentUser", users.get(0));
            return "redirect:/user/browse-song";
        }
        model.addAttribute("error", "Invalid credentials");
        return "sign-in";
    }

    @GetMapping("/browse-song")
    public String showBrowsePage(HttpSession session, Model model) {
        User user = (User) session.getAttribute("currentUser");
        if (user == null) {
            return "redirect:/user/login";
        }
        model.addAttribute("user", user);
        return "browse-song";
    }
}