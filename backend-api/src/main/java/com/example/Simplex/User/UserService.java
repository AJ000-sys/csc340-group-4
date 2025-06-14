package com.example.Simplex.User;

import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.bind.annotation.PathVariable;

@Service
public class UserService {
    
    @Autowired
    private UserRepository userRepository;

    public Optional<User> findUserForAuthentication(String username) {
        return userRepository.findUserForAuthentication(username);
    }

    public boolean existsByUsernameOrEmail(String username, String email) {
        return userRepository.existsByUsernameOrEmail(username, email);
    }

    public User createUser(User user) throws IllegalArgumentException {
        if (existsByUsernameOrEmail(user.getUserName(), user.getEmail())) {
            throw new IllegalArgumentException("Username or email already exists");
        }
        return userRepository.save(user);
    }

    public int updatePassword(Long userId, String encodedPassword) {
        return userRepository.updatePassword(userId, encodedPassword);
    }

    public Object getAllUsers() {
        return userRepository.findAll();
    }   

    public Object getUsersById(@PathVariable long userId) {
        return userRepository.findById(userId).orElse(null);
    }

    public Object getUserByName(String userName) {
        return userRepository.findByUserName(userName);
    }

    public User updateUser(Long userId, User user) {
        user.setUserId(userId);
        return userRepository.save(user);
    }

    public void deleteUser(Long userId) {
        userRepository.deleteById(userId);
    }
}
