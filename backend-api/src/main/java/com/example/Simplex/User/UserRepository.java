package com.example.Simplex.User;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

@Repository
public interface UserRepository extends JpaRepository<User, Long> {

    @Query(value = "Select * from users where userName = ?1", nativeQuery = true)
    List<User> findByUserName(String userName);
}
