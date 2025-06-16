<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Upload Song</title>
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

        .upload-form {
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
    </style>
</head>

<body>
    <header>
        <h1>Upload Song</h1>
    </header>

    <div class="container">
        <form action="/song/upload" method="post" enctype="multipart/form-data">
            <div class="form-group">
                <label for="title">Song Title</label>
                <input type="text" id="title" name="title" required>
            </div>

            <div class="form-group">
                <label for="duration">Duration (in seconds)</label>
                <input type="text" id="duration" name="duration" required>
            </div>

            <div class="form-group">
                <label for="artist">Artist</label>
                <input type="text" id="artist" name="artist" required>
            </div>

            <div class="form-group">
                <label for="genre">Genre</label>
                <input type="text" id="genre" name="genre" required>
            </div>

            <div class="form-group">
                <label for="audioFile">Audio File</label>
                <input type="file" id="audioFile" name="audioFile" accept="audio/*" required>
            </div>

            <div class="form-group">
                <label for="coverImage">Cover Image (Optional)</label>
                <input type="file" id="coverImage" name="coverImage" accept="image/*">
            </div>

            <button type="submit">Upload Song</button>
        </form>
    </div>
</body>

</html>