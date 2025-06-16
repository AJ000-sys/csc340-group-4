package com.example.Simplex.Song;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

@Repository
public interface SongRepository extends JpaRepository<Song, Long> {

    @Query(value = "select * from song s where s.title = ?1", nativeQuery = true)
    List<Song> findByTitle(String title);

    @Query(value = "select * from song s where s.artist = ?1", nativeQuery = true)
    List<Song> findByArtist(String artist);

    @Query(value = "select * from song s where s.genre = ?1", nativeQuery = true)
    List<Song> findByGenre(String genre);

    List<Song> findByTitleContainingIgnoreCase(String titlePart);
    List<Song> findByArtistContainingIgnoreCase(String artist);
}
