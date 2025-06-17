package com.example.Simplex;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import com.example.Simplex.Song.Song;

public interface CommentRepository extends JpaRepository<Comment, Long>{
    List<Comment> findBySong(Song song);

    @Query("SELECT c FROM Comment c WHERE c.song = :song AND c.parentComment IS NULL ORDER BY c.timestamp DESC")
    List<Comment> findTopLevelCommentsBySong(Song song);

    List<Comment> findByParentCommentIsNull();

    List<Comment> findByParentComment(Comment parent);
}
