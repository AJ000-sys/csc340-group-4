package com.example.Simplex.User;

import org.springframework.stereotype.Service;
import org.springframework.web.bind.annotation.PathVariable;

@Service
public class UserService {
    
    private UserRepository userRepository;

    public Object getAllUsers() {
        return userRepository.findAll();
    }   

    public Object getUsersById(@PathVariable long userId) {
        return userRepository.findById(userId).orElse(null);
    }

    public Object getUserByName(String userName) {
        return userRepository.findByUserName(userName);
    }

    public User createUser(User user) {
        return userRepository.save(user);
    }

    public User updateUser(Long userId, User user) {
        return userRepository.save(user);
    }

    public void deleteUser(Long userId) {
        userRepository.deleteById(userId);
    }
}
