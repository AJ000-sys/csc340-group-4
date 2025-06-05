package com.example.Simplex.Review;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.Simplex.User.User;
import com.example.Simplex.User.UserService;

@Service
public class ReplyService {
    @Autowired
    private ReplyRepository replyRepository;

    @Autowired
    private ReviewRepository reviewRepository;

    @Autowired
    private UserService userService;

    public Reply createReply(Long reviewId, Long userId, String content) {
        Review review = reviewRepository.findById(reviewId).orElseThrow();
        User user = (User) userService.getUsersById(userId);
        
        Reply reply = new Reply(review, user, content);
        return replyRepository.save(reply);
    }

    public List<Reply> getRepliesByReview(Long reviewId) {
        return replyRepository.findByReviewId(reviewId);
    }

    public List<Reply> getRepliesByUser(Long userId) {
        return replyRepository.findByUserId(userId);
    }

    public void deleteReply(Long replyId) {
        replyRepository.deleteById(replyId);
    }
}
