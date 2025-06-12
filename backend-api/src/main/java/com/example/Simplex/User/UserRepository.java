package com.example.Simplex.User;

import java.util.List;
import java.util.Optional;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import jakarta.transaction.Transactional;

@Repository
public interface UserRepository extends JpaRepository<User, Long> {

    // Existing query with parameter binding improvement
    @Query(value = "SELECT * FROM users WHERE userName = :username", nativeQuery = true)
    List<User> findByUserName(@Param("username") String userName);

    // Derived query method (no need for @Query)
    Optional<User> findByEmail(String email);

    // Combined username/email check for registration validation
    @Query("SELECT CASE WHEN COUNT(u) > 0 THEN true ELSE false END " +
           "FROM User u WHERE u.userName = :username OR u.email = :email")
    boolean existsByUsernameOrEmail(@Param("username") String username, 
                                  @Param("email") String email);

    // For login authentication
    @Query("SELECT u FROM User u WHERE u.userName = :username")
    Optional<User> findUserForAuthentication(@Param("username") String username);

    // For profile updates - selective update
    @Modifying
    @Transactional
    @Query("UPDATE User u SET u.userName = :username, u.email = :email WHERE u.userId = :userId")
    int updateUserProfile(@Param("userId") Long userId, 
                        @Param("username") String username,
                        @Param("email") String email);

    // For password updates
    @Modifying
    @Transactional
    @Query("UPDATE User u SET u.password = :password WHERE u.userId = :userId")
    int updatePassword(@Param("userId") Long userId, 
                      @Param("password") String encodedPassword);

    // For admin functionality - find all users with pagination
    @Query(value = "SELECT * FROM users ORDER BY userName",
           countQuery = "SELECT COUNT(*) FROM users",
           nativeQuery = true)
    Page<User> findAllUsers(Pageable pageable);
}
