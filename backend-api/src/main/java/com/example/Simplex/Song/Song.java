package com.example.Simplex.Song;

import java.util.ArrayList;
import java.util.List;

import com.example.Simplex.Comment;

import jakarta.persistence.CascadeType;
import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.Id;
import jakarta.persistence.OneToMany;
import jakarta.persistence.Table;

@Entity
@Table(name = "songs")
public class Song {
    @Id
    @GeneratedValue(strategy = jakarta.persistence.GenerationType.IDENTITY)
    private Long songId;

    @Column(nullable = false)
    private String title;

    @Column(nullable = false)
    private String artist;

    @Column(nullable = false)
    private String genre;

    @Column(nullable = false)
    private String filePath;

    @Column
    private String coverImagePath;

    @OneToMany(mappedBy = "song", cascade = CascadeType.ALL)
    private List<Comment> comments = new ArrayList<>();

    public Song() {
    }

    public Song(Long songId, String title, String artist, String genre) {
        this.songId = songId;
        this.title = title;
        this.artist = artist;
        this.genre = genre;
    }

    public Song(String title, String artist, String genre) {
        this.title = title;
        this.artist = artist;
        this.genre = genre;
    }

    public Long getSongId() {
        return songId;
    }

    public void setSongId(Long songId) {
        this.songId = songId;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getArtist() {
        return artist;
    }

    public void setArtist(String artist) {
        this.artist = artist;
    }

    public String getGenre() {
        return genre;
    }

    public void setGenre(String genre) {
        this.genre = genre;
    }

    public String getFilePath() {
        return filePath;
    }

    public void setFilePath(String filePath) {
        this.filePath = filePath;
    }

    public String getCoverImagePath() {
        return coverImagePath;
    }

    public void setCoverImagePath(String coverImagePath) {
        this.coverImagePath = coverImagePath;
    }

    public List<Comment> getComments() {
        return comments;
    }

    public void setComments(List<Comment> comments) {
        this.comments = comments;
    }

    public void addComment(Comment comment) {
        comments.add(comment);
        comment.setSong(this);
    }
}
