package com.example.Simplex;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;

import com.example.Simplex.Song.Song;

public interface CommentRepository extends JpaRepository<Comment, Long>{
    List<Comment> findBySong(Song song);
    List<Comment> findByParentCommentIsNull(); 
    List<Comment> findByParentComment(Comment parent);
}
