package com.example.Simplex.Song;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.bind.annotation.PathVariable;

@Service
public class SongService {

    @Autowired
    private SongRepository songRepository;

    public Object getAllSongs() {
        return songRepository.findAll();
    }

    public Object getSongsById(@PathVariable long songId) {
        return songRepository.findById(songId).orElse(null);
    }

    public Object getSongsByTitle(String title) {
        return songRepository.findByTitle(title);
    }

    public Object getSongsByArtist(String artist) {
        return songRepository.findByArtist(artist);
    }

    public Object getSongsByGenre(String genre) {
        return songRepository.findByGenre(genre);
    }

    public Song createSong(Song song) {
        return songRepository.save(song);
    }

    public Song updateSong(Long songId, Song song) {
        song.setSongId(songId);
        return songRepository.save(song);
    }

    public void deleteSong(Long songId) {
        songRepository.deleteById(songId);
    }
}
