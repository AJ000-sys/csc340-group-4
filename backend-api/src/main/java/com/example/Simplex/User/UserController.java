package com.example.Simplex.User;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("/user")
public class UserController {

    @Autowired
    private UserService userService;

    @GetMapping
    public Object getAllUsers() {
        return userService.getAllUsers();
    }

    @GetMapping("/{id}")
    public Object getUserById(@PathVariable long id) {
        return userService.getUsersById(id);
    }

    @GetMapping("/name/{userName}")
    public Object getUserByName(@PathVariable String userName) {
        return userService.getUserByName(userName);
    }

    @PostMapping
    public Object createUser(@RequestBody User user) {
        return userService.createUser(user);
    }

    @PutMapping("/{id}")
    public User updateUser(@PathVariable Long id, @RequestBody User user) {
        userService.updateUser(id, user);
        return userService.updateUser(id, user);
    }

    @DeleteMapping("/{id}")
    public Object deleteUser(@PathVariable Long id) {
        userService.deleteUser(id);
        return userService.getAllUsers();
    }
}
