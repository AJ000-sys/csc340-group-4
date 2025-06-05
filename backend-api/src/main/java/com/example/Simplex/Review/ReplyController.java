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

import com.example.Simplex.Review.Reply;

@RestController
@RequestMapping("/replies")
public class ReplyController {
    @Autowired
    private ReplyService replyService;

    @PostMapping("/{reviewId}/{userId}")
    public Reply createReply(@PathVariable Long reviewId,  @PathVariable Long userId,  @RequestBody ReplyRequest replyRequest) {
        return replyService.createReply(reviewId, userId, replyRequest.getContent());
    }

    @GetMapping("/review/{reviewId}")
    public List<Reply> getRepliesByReview(@PathVariable Long reviewId) {
        return replyService.getRepliesByReview(reviewId);
    }

    @GetMapping("/user/{userId}")
    public List<Reply> getRepliesByUser(@PathVariable Long userId) {
        return replyService.getRepliesByUser(userId);
    }

    @DeleteMapping("/{replyId}")
    public void deleteReply(@PathVariable Long replyId) {
        replyService.deleteReply(replyId);
    }
}

class ReplyRequest {
    private String content;

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }
}