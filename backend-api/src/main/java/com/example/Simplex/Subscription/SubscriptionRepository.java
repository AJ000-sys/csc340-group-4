package com.example.Simplex.Subscription;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface SubscriptionRepository extends JpaRepository<Subscription, Long> {
    
    List<Subscription> findByUserId(Long userId);
    List<Subscription> findBySongId(Long songId);
    Subscription findByUserIdAndSongId(Long userId, Long songId);
}
