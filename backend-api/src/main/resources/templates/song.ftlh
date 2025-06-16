<!DOCTYPE html>
<html>
<head>
    <title>${song.title} by ${song.artist} | Simplex</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background: #181818;
            color: #fff;
            margin: 0;
            padding: 0;
        }
        .container {
            max-width: 800px;
            margin: 40px auto;
            background: #222;
            border-radius: 10px;
            box-shadow: 0 4px 16px rgba(0,0,0,0.4);
            padding: 32px;
        }
        .song-header {
            display: flex;
            align-items: center;
            margin-bottom: 30px;
        }
        .song-cover {
            width: 200px;
            height: 200px;
            border-radius: 8px;
            margin-right: 30px;
            object-fit: cover;
        }
        .song-info {
            flex-grow: 1;
        }
        .song-title {
            font-size: 2em;
            color: #d693f8;
            margin-bottom: 5px;
        }
        .song-artist {
            font-size: 1.3em;
            color: #90caf9;
            margin-bottom: 15px;
        }
        .song-meta {
            color: #bdbdbd;
            margin-bottom: 20px;
        }
        .audio-player {
            width: 100%;
            margin-top: 30px;
        }
        .back-button {
            display: inline-block;
            margin-top: 20px;
            padding: 10px 20px;
            background: #333;
            color: white;
            text-decoration: none;
            border-radius: 5px;
        }
        .action-buttons {
            margin-top: 20px;
            display: flex;
            gap: 10px;
        }
        .action-button {
            padding: 10px 15px;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            font-weight: bold;
        }
        .share-button {
            background: #ffb300;
            color: #222;
        }
        .download-button {
            background: #90caf9;
            color: #222;
        }
        .save-button {
            background: #43a047;
            color: #fff;
        }
    </style>
</head>
<body>
    <div class="container">
        <div class="song-header">
            <#if song.coverImagePath??>
                <img class="song-cover" src="${song.coverImagePath}" alt="Album cover">
            <#else>
                <img class="song-cover" src="https://d3544la1u8djza.cloudfront.net/APHI/Blog/2023/September/small-breeds-hero.jpg" alt="Default cover">
            </#if>
            <div class="song-info">
                <h1 class="song-title">${song.title}</h1>
                <div class="song-artist">${song.artist}</div>
                <div class="song-meta">
                    <div>Genre: ${song.genre}</div>
                </div>
                <div class="action-buttons">
                    <button class="action-button share-button">Share</button>
                    <button class="action-button download-button">Download</button>
                    <button class="action-button save-button">Save to Playlist</button>
                </div>
            </div>
        </div>
        
        <audio class="audio-player" controls autoplay>
            <source src="${song.filePath}" type="audio/mpeg">
            Your browser does not support the audio element.
        </audio>
        
        <a href="/user/browse-song" class="back-button">Back to Browse</a>
    </div>
</body>
</html>>