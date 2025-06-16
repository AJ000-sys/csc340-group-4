<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <title>Artist Profile</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap/5.3.0/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css">
    <style>
        body {
            background: #181818;
            color: #fff;
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
        }

        .profile-card {
            background: #232323;
            border-radius: 16px;
            box-shadow: 0 4px 24px rgba(0, 0, 0, 0.5);
            padding: 2rem;
            margin-top: 3rem;
            position: relative;
        }

        .profile-img {
            width: 220px;
            height: 220px;
            object-fit: cover;
            border-radius: 50%;
            border: 5px solid #282828;
            margin-bottom: 1rem;
        }

        .artist-name {
            font-size: 2.2rem;
            font-weight: 700;
            color: #d693f8;
        }

        .artist-bio {
            color: #b3b3b3;
            font-size: 1.1rem;
            margin-bottom: 1.5rem;
        }

        .social-links a {
            color: #b3b3b3;
            margin-right: 18px;
            transition: color 0.2s;
        }

        .social-links a:hover {
            color: #d693f8;
        }

        .songs-section {
            margin-top: 3rem;
        }

        .song-card {
            background: #232323;
            border-radius: 12px;
            box-shadow: 0 2px 12px rgba(0, 0, 0, 0.3);
            margin-bottom: 1.5rem;
            display: flex;
            align-items: center;
            padding: 1.2rem 1.5rem;
        }

        .song-icon {
            font-size: 2.5rem;
            color: #ffffff;
            margin-right: 1.5rem;
        }

        .song-details h5 {
            color: #d693f8;
            margin-bottom: 0.3rem;
        }

        .song-details p {
            color: #b3b3b3;
            margin-bottom: 0.2rem;
        }

        .edit-btn,
        .delete-btn {
            border: none;
            background: none;
            color: #b3b3b3;
            margin-left: 10px;
            font-size: 1.2rem;
            cursor: pointer;
            transition: color 0.2s;
        }

        .edit-btn:hover {
            color: #1db954;
        }

        .delete-btn:hover {
            color: #e74c3c;
        }

        .delete-profile-btn {
            position: absolute;
            top: 18px;
            right: 18px;
            z-index: 2;
            font-size: 1.5rem;
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
        .container {
            width: 80%;
            margin: auto;
            overflow: hidden;
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
                    <li><a href="/playlists">Playlists</a></li>
                    <li><a href="/user/logout">Logout</a></li>
                </ul>
            </nav>
        </div>
    </header>

    <div class="container">
        <div class="profile-card text-center">
            <button class="delete-btn delete-profile-btn" title="Delete Profile"><i class="fas fa-trash-alt"></i></button>
            <img src="${currentUser.profileImagePath!'https://d3544la1u8djza.cloudfront.net/APHI/Blog/2023/September/small-breeds-hero.jpg'}" alt="Profile Image" class="profile-img">
            <div class="artist-name">${currentUser.userName}</div>
            <div class="artist-bio">
                <#if currentUser.bio??>${currentUser.bio}<#else>No bio yet.</#if>
            </div>
            <div class="social-links mb-3">
                <a href="#" target="_blank" title="Facebook"><i class="fab fa-facebook fa-2x"></i></a>
                <a href="#" target="_blank" title="Twitter"><i class="fab fa-twitter fa-2x"></i></a>
                <a href="#" target="_blank" title="Instagram"><i class="fab fa-instagram fa-2x"></i></a>
                <a href="#" target="_blank" title="YouTube"><i class="fab fa-youtube fa-2x"></i></a>
            </div>
            <button class="edit-btn" title="Edit Profile" onclick="window.location.href='/user/profile/edit'"><i class="fas fa-edit"></i></button>
        </div>

        <div class="songs-section">
            <h3 class="mb-4" style="color:#ffc400; font-weight:700;">Uploaded Songs</h3>
            <#if songs?? && songs?size gt 0>
                <#list songs as song>
                    <div class="song-card">
                        <span class="song-icon"><i class="fas fa-music"></i></span>
                        <div class="song-details flex-grow-1">
                            <h5 class="mb-1">${song.title}</h5>
                            <p><strong>Genre:</strong> ${song.genre}</p>
                        </div>
                        <button class="edit-btn" title="Edit Song"><i class="fas fa-edit"></i></button>
                        <button class="delete-btn" title="Delete Song"><i class="fas fa-trash-alt"></i></button>
                    </div>
                </#list>
            <#else>
                <p>No songs uploaded yet.</p>
            </#if>
        </div>
    </div>
</body>

</html>