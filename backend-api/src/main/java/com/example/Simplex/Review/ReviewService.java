package com.example.Simplex.Review;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.Simplex.Song.Song;
import com.example.Simplex.Song.SongService;
import com.example.Simplex.User.User;
import com.example.Simplex.User.UserService;

@Service
public class ReviewService {
    @Autowired
    private ReviewRepository reviewRepository;

    @Autowired
    private UserService userService;

    @Autowired
    private SongService songService;

    public Review createReview(Long userId, Long songId, String content, Integer rating) {
       User user = (User) userService.getUsersById(userId);
       Song song = (Song) songService.getSongsById(songId);

       Review review = new Review(user, song, content, rating);
       return reviewRepository.save(review);
    }

    public List<Review> getReviewsByUser(Long userId) {
        return reviewRepository.findByUserId(userId);
    }

    public List<Review> getReviewsBySong(Long songId) {
        return reviewRepository.findBySongId(songId);
    }

    public List<Review> getReviewsByArtist(String artist) {
        return reviewRepository.findByArtist(artist);
    }

    public List<Review> getReviewsByMinRating(Integer minRating) {
        return reviewRepository.findByMinRating(minRating);
    }

    public boolean hasUserReviewedSong(Long userId, Long songId) {
        return reviewRepository.existsByUserIdAndSongId(userId, songId);
    }

    public void deleteReview(Long reviewId) {
        reviewRepository.deleteById(reviewId);
    }
}