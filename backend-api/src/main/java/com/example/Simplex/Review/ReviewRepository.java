package com.example.Simplex.Review;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

@Repository
public interface ReviewRepository extends JpaRepository<Review, Long> {
    @Query("SELECT r FROM Review r WHERE r.user.id = :userId")
    List<Review> findByUserId(Long userId);

    @Query("SELECT r FROM Review r WHERE r.song.id = :songId")
    List<Review> findBySongId(Long songId);

    @Query("SELECT r FROM Review r WHERE r.song.artist = :artist")
    List<Review> findByArtist(@Param("artist") String artist);
    
    @Query("SELECT r FROM Review r WHERE r.rating >= :minRating")
    List<Review> findByMinRating(@Param("minRating") Integer minRating);

    @Query("SELECT CASE WHEN COUNT(r) > 0 THEN true ELSE false END FROM Review r WHERE r.user.id = :userId AND r.song.id = :songId")
    boolean existsByUserIdAndSongId(Long userId, Long songId);
}
