<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Edit Song</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
            background-color: #292525;
            color: #fff;
        }

        .container {
            width: 80%;
            margin: 2rem auto;
        }

        header {
            background: #040404;
            color: #d693f8;
            padding: 1rem 0;
            border-bottom: 1px solid #bbb;
        }

        header h1 {
            margin: 0;
            padding: 0 2rem;
        }

        .edit-form {
            background: #232323;
            padding: 2rem;
            border-radius: 8px;
            margin-top: 2rem;
        }

        .form-group {
            margin-bottom: 1.5rem;
        }

        label {
            display: block;
            margin-bottom: 0.5rem;
            color: #d693f8;
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

        input[type="text"],
        input[type="file"] {
            width: 100%;
            padding: 0.75rem;
            background: #333;
            border: 1px solid #444;
            border-radius: 4px;
            color: #fff;
        }

        button {
            background: #d693f8;
            color: #000;
            border: none;
            padding: 0.75rem 1.5rem;
            border-radius: 4px;
            cursor: pointer;
            font-weight: bold;
        }

        button:hover {
            background: #c47df5;
        }
        
        .current-cover {
            max-width: 200px;
            margin-bottom: 1rem;
            border-radius: 4px;
        }
    </style>
</head>

<body>
    <header>
        <h1>Simplex</h1>

        <div class="container">
            <nav>
                <ul>
                    <li><a href="/">Home</a></li>
                    <li><a href="/user/browse-song">Browse</a></li>
                    <li><a href="/user/upload">Upload</a></li>
                    <li><a href="/user/logout">Logout</a></li>
                </ul>
            </nav>
        </div>
    </header>

    <div class="container">
        <form action="/song/${song.songId}/edit" method="post" enctype="multipart/form-data">
            <div class="form-group">
                <label for="title">Song Title</label>
                <input type="text" id="title" name="title" value="${song.title}" required>
            </div>

            <div class="form-group">
                <label for="genre">Genre</label>
                <input type="text" id="genre" name="genre" value="${song.genre}" required>
            </div>

            <div class="form-group">
                <labal fot="artist">Artist</labal>
                <input type="text" id="artist" name="artist" value="${song.artist}">
            </div>

            <div class="form-group">
                <#if song.coverImagePath??>
                    <label>Current Cover Image</label>
                    <img src="${song.coverImagePath}" class="current-cover" alt="Current cover">
                </#if>
                <label for="coverImage">New Cover Image (Optional)</label>
                <input type="file" id="coverImage" name="coverImage" accept="image/*">
            </div>

            <button type="submit">Save Changes</button>
            <a href="/user/profile" class="action-button" style="margin-left: 10px;">Cancel</a>
        </form>
    </div>
</body>

</html>