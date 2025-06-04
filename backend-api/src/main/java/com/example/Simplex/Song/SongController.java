package com.example.Simplex.Song;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("/song")
public class SongController {

    @Autowired
    private SongService songService;

    @GetMapping
    public Object getAllSongs() {
        return songService.getAllSongs();
    }

    @GetMapping("/{songId}")
    public Object getSongById(@PathVariable long songId) {
        return songService.getSongsById(songId);
    }

    @GetMapping("/title/{title}")
    public Object getSongsByTitle(@PathVariable String title) {
        return songService.getSongsByTitle(title);
    }

    @GetMapping("/artist/{artist}")
    public Object getSongsByArtist(@PathVariable String artist) {
        return songService.getSongsByArtist(artist);
    }

    @GetMapping("/genre/{genre}")
    public Object getSongsByGenre(@PathVariable String genre) {
        return songService.getSongsByGenre(genre);
    }

    @PostMapping
    public Object createSong(@RequestBody Song song) {
        return songService.createSong(song);
    }

    @PutMapping("/{songId}")
    public Song updateSong(@PathVariable Long songId, @RequestBody Song song) {
        return songService.updateSong(songId, song);
    }

    @DeleteMapping("/{songId}")
    public Object deleteSong(@PathVariable Long songId) {
        songService.deleteSong(songId);
        return songService.getAllSongs();
    }
}
