package com.example.Simplex.Review;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("/review")
public class ReviewController {
    @Autowired
    private ReviewService reviewService;

    @PostMapping("/{userId}/{songId}")
    public Review createReview(@PathVariable Long userId, @PathVariable Long songId, @RequestBody Review review) {
        return reviewService.createReview(userId, songId, review.getContent(), review.getRating());
    }

    @GetMapping("/user/{userId}")
    public List<Review> getReviewsByUser(@PathVariable Long userId) {
        return reviewService.getReviewsByUser(userId);
    }

    @GetMapping("/song/{songId}")
    public List<Review> getReviewsBySong(@PathVariable Long songId) {
        return reviewService.getReviewsBySong(songId);
    }

    @GetMapping("/artist/{artist}")
    public List<Review> getReviewsByArtist(@PathVariable String artist) {
        return reviewService.getReviewsByArtist(artist);
    }

    @GetMapping("/rating/{minRating}")
    public List<Review> getReviewsByMinRating(@PathVariable Integer minRating) {
        return reviewService.getReviewsByMinRating(minRating);
    }

    @GetMapping("/exists/{userId}/{songId}")
    public boolean hasUserReviewedSong(@PathVariable Long userId, @PathVariable Long songId) {
        return reviewService.hasUserReviewedSong(userId, songId);
    }

    @DeleteMapping("/{reviewId}")
    public void deleteReview(@PathVariable Long reviewId) {
        reviewService.deleteReview(reviewId);
    }
}

class ReviewRequest {
    private String content;
    private Integer rating;

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public Integer getRating() {
        return rating;
    }

    public void setRating(Integer rating) {
        this.rating = rating;
    }
}
