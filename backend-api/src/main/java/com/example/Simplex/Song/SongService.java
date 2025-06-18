package com.example.Simplex.Song;

import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.multipart.MultipartFile;

@Service
public class SongService {

    @Autowired
    private SongRepository songRepository;

    @Value("${upload.directory}")
    private String uploadDirectory;

    public Song createSong(Song song, MultipartFile audioFile, MultipartFile coverImage) throws IOException {

        Path uploadPath = Paths.get(uploadDirectory);
        if (!Files.exists(uploadPath)) {
            Files.createDirectories(uploadPath);
        }

        String audioFileName = UUID.randomUUID() + "_" + audioFile.getOriginalFilename();
        Files.copy(audioFile.getInputStream(), uploadPath.resolve(audioFileName));
        song.setFilePath("/uploads/" + audioFileName);

        if (coverImage != null && !coverImage.isEmpty()) {
            String imageFileName = UUID.randomUUID() + "_" + coverImage.getOriginalFilename();
            Files.copy(coverImage.getInputStream(), uploadPath.resolve(imageFileName));
            song.setCoverImagePath("/uploads/" + imageFileName);
        }

        return songRepository.save(song);
    }

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

    public Song updateSong(Long songId, Song song) {
        song.setSongId(songId);
        return songRepository.save(song);
    }

    public void deleteSong(Long songId) {
        songRepository.deleteById(songId);
    }
}