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
        .song-item img {
            width: 50px;
            height: 50px;
            margin-right: 10px;
            vertical-align: middle;
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
                    <li><a href="/user/upload">Upload</a></li>
                    <li><a href="/user/profile">Profile</a></li>
                    <li><a href="/playlists">Playlists</a></li>
                    <li><a href="/user/logout">Logout</a></li>
                </ul>
            </nav>
        </div>
    </header>

    <section class="song-list">
        <div class="container">
            <a href="/song" class="song-item">
                <img src="https://i1.sndcdn.com/artworks-wcNhNqxpy9yHoYtK-PNSFCA-t500x500.jpg" alt="Song Image">
                <span>jaded - Defsharp</span>
            </a>
            <a href="/song" class="song-item">
                <img src="https://i1.sndcdn.com/artworks-P8Mhxk2QaMM9-0-t500x500.jpg" alt="Song Image">
                <span>Run It - Jelly Roll</span>
            </a>
            <a href="/song" class="song-item">
                <img src="https://i1.sndcdn.com/artworks-y6WaHzlvp7PbwkLT-JlZicw-t500x500.png" alt="Song Image">
                <span>luther - Kendrick Lamar</span>
            </a>
        </div>
    </section>
</body>
</html>