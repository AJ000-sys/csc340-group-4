<!DOCTYPE html>
<html>

<head>
    <title>Simplex</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
            background-color: #292525;
        }

        .container {
            width: 80%;
            margin: auto;
            overflow: hidden;
        }

        header {
            background: #040404;
            color: #d693f8;
            padding-top: 30px;
            min-height: 70px;
            border-bottom: #bbb 1px solid;
        }

        header a {
            color: #fff;
            text-decoration: none;
            text-transform: uppercase;
            font-size: 16px;
        }

        header ul {
            margin: 0;
            padding: 0;
        }

        header li {
            float: left;
            display: inline;
            padding: 0 20px 0 20px;
        }

        header #branding {
            float: left;
        }

        header #branding h1 {
            margin: 0;
        }

        header nav {
            float: right;
            margin-top: 10px;
        }

        .song-list {
            padding: 20px;
        }

        .song-item {
            background: #fefefe;
            border: 1px solid #f3f1f1;
            padding: 10px;
            margin-bottom: 10px;
            display: flex;
            align-items: center;
            text-decoration: none;
            color: #000000;
        }

        a.song-item {
            text-decoration: none;
        }

        .song-item img {
            width: 50px;
            height: 50px;
            margin-right: 10px;
            vertical-align: middle;
        }

        .song-info {
            flex-grow: 1;
        }

        .song-title {
            font-weight: bold;
        }

        .song-artist {
            color: #666;
            font-size: 0.9em;
        }

        .play-button {
            background: #d693f8;
            border: none;
            color: white;
            padding: 8px 15px;
            border-radius: 5px;
            cursor: pointer;
            margin-left: 10px;
        }

        .play-button:hover {
            background: #c47de8;
        }

        audio {
            display: none;
        }

        .now-playing {
            position: fixed;
            bottom: 0;
            left: 0;
            right: 0;
            background: #333;
            color: white;
            padding: 15px;
            display: flex;
            align-items: center;
            z-index: 1000;
        }

        .now-playing-info {
            margin-left: 15px;
            flex-grow: 1;
        }

        .now-playing-title {
            font-weight: bold;
            font-size: 1.1em;
        }

        .now-playing-artist {
            font-size: 0.9em;
            color: #ccc;
        }

        .audio-controls {
            width: 100%;
            margin-top: 10px;
        }

        .active-song {
            background-color: #f0f0f0;
            border-left: 4px solid #d693f8;
        }
    </style>
</head>

<body>
    <header>
        <div class="container">
            <div id="branding">
                <h1><span class="highlight">Simplex</span></h1>
            </div>
            <nav>
                <ul>
                    <li><a href="/">Home</a></li>
                    <li><a href="/user/browse-song">Browse</a></li>
                    <li><a href="/user/upload">Upload</a></li>
                    <li><a href="/user/profile">Profile</a></li>
                    <li><a href="/user/logout">Logout</a></li>
                </ul>
            </nav>
        </div>
    </header>

    <section class="song-list">
        <div class="container">

            <#list songs as song>
                <a href="/song/${song.songId}" class="song-item" id="song-${song.songId}">
                    <#if song.coverImagePath??>
                        <img src="${song.coverImagePath}" alt="Song Cover">
                        <#else>
                            <img src="https://cdn.pixabay.com/photo/2016/03/23/17/26/music-note-1275177_1280.png"
                                alt="Default Cover">
                    </#if>
                    <div class="song-info">
                        <div class="song-title">${song.title}</div>
                        <div class="song-artist">${song.artist} • ${song.genre}</div>
                    </div>
                    <button class="play-button"
                        onclick="event.stopPropagation(); playSong('${song.songId}', '${song.filePath}', '${song.title}', '${song.artist}')">
                        Play
                    </button>
                </a>
            </#list>
        </div>
    </section>

    <div class="now-playing" id="nowPlaying" style="display: none;">
        <img id="nowPlayingCover" src="" width="50" height="50">
        <div class="now-playing-info">
            <div class="now-playing-title" id="nowPlayingTitle"></div>
            <div class="now-playing-artist" id="nowPlayingArtist"></div>
            <audio id="audioPlayer" controls class="audio-controls">
                Your browser does not support the audio element.
            </audio>
        </div>
    </div>

    <script>
        let currentSongId = null;

        function playSong(songId, filePath, title, artist) {
            const audioPlayer = document.getElementById('audioPlayer');
            const nowPlayingElement = document.getElementById('nowPlaying');
            const nowPlayingTitle = document.getElementById('nowPlayingTitle');
            const nowPlayingArtist = document.getElementById('nowPlayingArtist');
            const nowPlayingCover = document.getElementById('nowPlayingCover');
            const songElement = document.getElementById('song-' + songId);

            nowPlayingTitle.textContent = title;
            nowPlayingArtist.textContent = artist;

            const coverImg = songElement.querySelector('img');
            nowPlayingCover.src = coverImg.src;

            audioPlayer.src = filePath;

            nowPlayingElement.style.display = 'block';

            if (currentSongId) {
                document.getElementById('song-' + currentSongId).classList.remove('active-song');
            }
            songElement.classList.add('active-song');
            currentSongId = songId;

            audioPlayer.play().catch(e => {
                console.error("Error playing audio:", e);
                alert("Error playing audio. Please make sure you're using a supported browser and the file is accessible.");
            });
        }

        document.getElementById('audioPlayer').addEventListener('ended', function () {
            if (currentSongId) {
                document.getElementById('song-' + currentSongId).classList.remove('active-song');
            }
        });
    </script>
</body>

</html>