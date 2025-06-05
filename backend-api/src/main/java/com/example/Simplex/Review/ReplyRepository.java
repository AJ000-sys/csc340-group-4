package com.example.Simplex.Review;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

@Repository
public interface ReplyRepository extends JpaRepository<Reply, Long> {
    List<Reply> findByReviewId(Long reviewId);

    @Query("select r from Reply r where r.user.id = :userId")
    List<Reply> findByUserId(Long userId);
}
