package com.example.Simplex;

import java.time.LocalDateTime;
import java.util.List;

import com.example.Simplex.Song.Song;
import com.example.Simplex.User.User;

import jakarta.persistence.CascadeType;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.Id;
import jakarta.persistence.ManyToOne;
import jakarta.persistence.OneToMany;
import jakarta.persistence.Table;

@Entity
@Table(name = "comments")
public class Comment {

    @Id
    @GeneratedValue
    private Long commentId;

    @ManyToOne
    private User user;

    @ManyToOne
    private Song song;

    private String content;
    private LocalDateTime timestamp;

    @OneToMany(mappedBy = "parentComment", cascade = CascadeType.ALL)
    private List<Comment> replies;

    public Comment() {
    }

    public Comment(Long commentId, User user, Song song, String content, LocalDateTime timestamp) {
        this.commentId = commentId;
        this.user = user;
        this.song = song;
        this.content = content;
        this.timestamp = timestamp;
    }

    public Comment(User user, Song song, String comment, LocalDateTime timestamp) {
        this.user = user;
        this.song = song;
        this.content = content;
        this.timestamp = timestamp;
    }

    public Long getCommentId() {
        return commentId;
    }

    
    public void setCommentId(Long commentId) {
        this.commentId = commentId;
    }

    public User getUser() {
        return user;
    }

     public void setUser(User user) {
        this.user = user;
    }

    public Song getSong() {
        return song;
    }

       public void setSong(Song song) {
        this.song = song;
    }

    public String getContent() {
        return content;
    }

    public LocalDateTime getTimestamp() {
        return timestamp;
    }

    public Comment getParentComment() {
        return parentComment;
    }

    public List<Comment> getReplies() {
        return replies;
    }


   

 

    public void setContent(String content) {
        this.content = content;
    }

    public void setTimestamp(LocalDateTime timestamp) {
        this.timestamp = timestamp;
    }

    public void setParentComment(Comment parentComment) {
        this.parentComment = parentComment;
    }

    public void setReplies(List<Comment> replies) {
        this.replies = replies;
    }

    public void addReply(Comment reply) {
        reply.setParentComment(this);
        this.replies.add(reply);
    }
}
