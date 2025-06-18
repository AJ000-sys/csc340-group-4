package com.example.Simplex;

import java.time.LocalDateTime;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.Simplex.Song.Song;
import com.example.Simplex.Song.SongRepository;
import com.example.Simplex.User.User;
import com.example.Simplex.User.UserRepository;

@Service
public class CommentService {

    @Autowired
    private CommentRepository commentRepository;

    @Autowired
    private UserRepository userRepository;

    @Autowired
    private SongRepository songRepository;

    public Comment createComment(Long userId, Long songId, String content) {
        User user = userRepository.findById(userId).orElseThrow(() -> new IllegalArgumentException("User not found"));
        Song song = songRepository.findById(songId).orElseThrow(() -> new IllegalArgumentException("Song not found"));

        Comment comment = new Comment();
        comment.setUser(user);
        comment.setSong(song);
        comment.setContent(content);
        comment.setTimestamp(LocalDateTime.now());

        return commentRepository.save(comment);
    }

    public Comment createReply(Long userId, Long parentCommentId, String content) {
        User user = userRepository.findById(userId).orElseThrow(() -> new IllegalArgumentException("User not found"));
        Comment parent = commentRepository.findById(parentCommentId)
                .orElseThrow(() -> new IllegalArgumentException("Parent comment not found"));

        Comment reply = new Comment();
        reply.setUser(user);
        reply.setSong(parent.getSong());
        reply.setContent(content);
        reply.setParentComment(parent);
        reply.setTimestamp(LocalDateTime.now());

        return commentRepository.save(reply);
    }

    public List<Comment> getCommentsBySong(Long songId) {
        Song song = songRepository.findById(songId).orElseThrow(() -> new IllegalArgumentException("Song not found"));
        return commentRepository.findBySong(song);
    }

    public List<Comment> getTopLevelCommentsBySong(Long songId) {
        Song song = songRepository.findById(songId).orElseThrow(() -> new IllegalArgumentException("Song not found"));
        return commentRepository.findTopLevelCommentsBySong(song);
    }

    public List<Comment> getReplies(Long parentCommentId) {
        Comment parent = commentRepository.findById(parentCommentId)
                .orElseThrow(() -> new IllegalArgumentException("Parent comment not found"));
        return commentRepository.findByParentComment(parent);
    }

    Object getAllComments() {
        throw new UnsupportedOperationException("Not supported yet.");
    }

    public Comment saveComment(String content) {
        Comment comment = new Comment();
        comment.setContent(content);
        comment.setTimestamp(LocalDateTime.now());
        return commentRepository.save(comment);
    }
}