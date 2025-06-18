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

        header {
            background: #040404;
            color: #d693f8;
            padding: 20px;
            text-align: center;
            box-shadow: 0 2px 4px rgba(0, 0, 0, 0.5);
        }

        .container {
            max-width: 800px;
            margin: 40px auto;
            background: #222;
            border-radius: 10px;
            box-shadow: 0 4px 16px rgba(0, 0, 0, 0.4);
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
            margin-right: 10px;
        }

        .back-button:hover {
            background: #444;
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

        .save-button {
            background: #43a047;
            color: #fff;
        }

        .comments-section {
            margin-top: 2rem;
            padding: 1rem;
            background: #232323;
            border-radius: 8px;
        }

        .comment {
            margin: 1rem 0;
            padding: 1rem;
            background: #2a2a2a;
            border-radius: 5px;
        }

        .comment-header {
            display: flex;
            align-items: center;
            margin-bottom: 0.5rem;
        }

        .comment-header img {
            width: 40px;
            height: 40px;
            border-radius: 50%;
            margin-right: 10px;
        }

        .comment-user {
            font-weight: bold;
            color: #d693f8;
        }

        textarea {
            width: 100%;
            padding: 0.5rem;
            margin-bottom: 0.5rem;
            background: #333;
            color: white;
            border: none;
            border-radius: 4px;
        }

        .alert {
            padding: 10px;
            margin-bottom: 15px;
            border-radius: 4px;
        }

        .alert-success {
            background-color: #43a047;
            color: white;
        }

        .alert-danger {
            background-color: #e53935;
            color: white;
        }

        .reply-button {
            background: none;
            border: none;
            color: #90caf9;
            cursor: pointer;
            padding: 5px 0;
            margin-top: 5px;
        }

        .reply-button:hover {
            text-decoration: underline;
        }
    </style>
</head>

<body>
    <div class="container">
        <a href="/user/browse-song" class="back-button">← Back to Browse</a>
        <div class="song-header">
            <#if song.coverImagePath??>
                <img class="song-cover" src="${song.coverImagePath}" alt="Album cover">
                <#else>
                    <img class="song-cover"
                        src="https://cdn.pixabay.com/photo/2016/03/23/17/26/music-note-1275177_1280.png"
                        alt="Default cover">
            </#if>
            <div class="song-info">
                <h1 class="song-title">${song.title}</h1>
                <div class="song-artist">${song.artist}</div>
                <div class="song-meta">
                    <div>Genre: ${song.genre}</div>
                </div>
            </div>
        </div>

        <audio class="audio-player" controls autoplay>
            <source src="${song.filePath}" type="audio/mpeg">
            Your browser does not support the audio element.
        </audio>

        <div class="comments-section">
            <h3>Comments</h3>

            <#if success??>
                <div class="alert alert-success">${success}</div>
            </#if>
            <#if error??>
                <div class="alert alert-danger">${error}</div>
            </#if>

            <form action="/comments" method="post">
                <input type="hidden" name="songId" value="${song.songId}">
                <textarea name="content" placeholder="Add a comment..." required></textarea>
                <button type="submit" class="action-button">Post Comment</button>
            </form>

            <div class="comment-list">
                <#if comments?? && comments?size gt 0>
                    <#list comments as comment>
                        <div class="comment">
                            <div class="comment-header">
                                <img src="${comment.user.profileImagePath!'/default-profile.jpg'}" alt="User avatar">
                                <span class="comment-user">${comment.user.userName}</span>
                                <span class="comment-time">${comment.timestamp?string("MMM d, yyyy 'at' h:mm a")}</span>
                            </div>
                            <p>${comment.content}</p>

                            <button onclick="toggleReplyForm('${comment.commentId}')"
                                class="reply-button">Reply</button>
                            <form id="reply-form-${comment.commentId}" action="/comments/reply" method="post"
                                style="display: none;">
                                <input type="hidden" name="parentCommentId" value="${comment.commentId}">
                                <input type="hidden" name="songId" value="${song.songId}">
                                <textarea name="content" placeholder="Write a reply..." required></textarea>
                                <button type="submit" class="action-button">Post Reply</button>
                            </form>

                            <#if comment.replies?? && comment.replies?size gt 0>
                                <div class="replies" style="margin-left: 20px; margin-top: 10px;">
                                    <#list comment.replies as reply>
                                        <div class="reply" style="margin-top: 10px;">
                                            <div class="comment-header">
                                                <img src="${reply.user.profileImagePath!'/default-profile.jpg'}"
                                                    alt="User avatar">
                                                <span class="comment-user">${reply.user.userName}</span>
                                                <span class="comment-time">${reply.timestamp?string("MMM d, yyyy 'at'
                                                    h:mm a")}</span>
                                            </div>
                                            <p>${reply.content}</p>
                                        </div>
                                    </#list>
                                </div>
                            </#if>
                        </div>
                    </#list>
                    <#else>
                        <p>No comments yet. Be the first!</p>
                </#if>
            </div>
        </div>
    </div>

    <script>
        function toggleReplyForm(commentId) {
            const form = document.getElementById('reply-form-' + commentId);
            form.style.display = form.style.display === 'none' ? 'block' : 'none';
        }
    </script>
</body>

</html>