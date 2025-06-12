<!DOCTYPE html>
<html>
<head>
    <title>Browse Songs | Simplex</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
            background-color: #292525;
            color: white;
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
            display: flex;
            justify-content: space-between;
            align-items: center;
        }
        header a {
            color: white;
            text-decoration: none;
            text-transform: uppercase;
            font-size: 16px;
            transition: color 0.3s;
        }
        header a:hover {
            color: #d693f8;
        }
        header ul {
            margin: 0;
            padding: 0;
            display: flex;
            list-style: none;
        }
        header li {
            padding: 0 20px;
        }
        #branding h1 {
            margin: 0;
            color: #d693f8;
        }
        .welcome-message {
            margin: 20px 0;
            color: #d693f8;
        }
        .song-list {
            padding: 20px 0;
        }
        .song-item {
            background: #3a3636;
            border: 1px solid #444;
            padding: 15px;
            margin-bottom: 15px;
            border-radius: 5px;
            display: flex;
            align-items: center;
            transition: transform 0.2s, background 0.3s;
        }
        .song-item:hover {
            background: #4a4545;
            transform: translateX(5px);
        }
        .song-item img {
            width: 60px;
            height: 60px;
            margin-right: 20px;
            border-radius: 4px;
            object-fit: cover;
        }
        .song-info {
            flex-grow: 1;
        }
        .song-title {
            font-weight: bold;
            font-size: 18px;
            margin-bottom: 5px;
        }
        .song-artist {
            color: #bbb;
            font-size: 14px;
        }
        .play-button {
            color: #d693f8;
            text-decoration: none;
            font-weight: bold;
        }
    </style>
</head>
<body>
    <header>
        <div class="container">
            <div id="branding">
                <h1>Simplex</h1>
            </div>
            <nav>
                <ul>
                    <li><a href="/user/browse-song">Home</a></li>
                    <li><a href="/upload">Upload</a></li>
                    <li><a href="/user/profile">Profile</a></li>
                    <li><a href="/playlists">Playlists</a></li>
                    <li><a href="/logout">Logout</a></li>
                </ul>
            </nav>
        </div>
    </header>

    <div class="container">
        <div class="welcome-message">
            <#if currentUser??>
                Welcome, ${currentUser.userName}!
            </#if>
        </div>

        <section class="song-list">
            <#list songs as song>
                <div class="song-item">
                    <img src="${song.imageUrl}" alt="Song cover" onerror="this.src='http://localhost:8080/user'">
                    <div class="song-info">
                        <div class="song-title">${song.title}</div>
                        <div class="song-artist">${song.artist}</div>
                    </div>
                    <a href="/song/${song.id}" class="play-button">Play</a>
                </div>
            </#list>
        </section>
    </div>
</body>
</html>