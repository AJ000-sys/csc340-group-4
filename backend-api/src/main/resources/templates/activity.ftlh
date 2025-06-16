<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <title>Activity Feed</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap/5.3.0/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css">
    <style>
        body {
            background: #181818;
            color: #fff;
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
        }

        .activity-container {
            max-width: 800px;
            margin: 2rem auto;
            padding: 1rem;
        }

        .comment-card {
            background: #232323;
            border-radius: 8px;
            padding: 1.5rem;
            margin-bottom: 1.5rem;
            box-shadow: 0 2px 8px rgba(0, 0, 0, 0.3);
        }

        .comment-header {
            display: flex;
            align-items: center;
            margin-bottom: 1rem;
        }

        .comment-avatar {
            width: 50px;
            height: 50px;
            border-radius: 50%;
            object-fit: cover;
            margin-right: 1rem;
        }

        .comment-user {
            font-weight: bold;
            color: #d693f8;
        }

        .comment-time {
            color: #b3b3b3;
            font-size: 0.9rem;
        }

        .comment-content {
            margin: 1rem 0;
            line-height: 1.5;
        }

        .reply-form {
            margin-top: 1rem;
            display: none;
        }

        .reply-btn,
        .like-btn {
            background: none;
            border: none;
            color: #b3b3b3;
            cursor: pointer;
            margin-right: 1rem;
        }

        .reply-btn:hover,
        .like-btn:hover {
            color: #d693f8;
        }

        .replies {
            margin-left: 2rem;
            border-left: 2px solid #333;
            padding-left: 1rem;
        }

        .new-comment-form {
            background: #232323;
            padding: 1.5rem;
            border-radius: 8px;
            margin-bottom: 2rem;
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
                    <li><a href="/user/profile">Profile</a></li>
                    <li><a href="/user/logout">Logout</a></li>
                </ul>
            </nav>
        </div>
    </header>

    <div class="activity-container">
        <div class="new-comment-form">
            <h3>Post a Comment</h3>
            <form action="/activity/comment" method="post">
                <input type="hidden" name="songId" value="${song.songId}">
                <div class="mb-3">
                    <textarea class="form-control" name="content" rows="3" placeholder="Write your comment..."
                        required></textarea>
                </div>
                <button type="submit" class="btn btn-primary">Post Comment</button>
            </form>
        </div>

        <h2>Activity Feed</h2>

        <#if comments?? && comments?size gt 0>
            <#list comments as comment>
                <div class="comment-card">
                    <div class="comment-header">
                        <img src="${comment.user.profileImagePath!'https://d3544la1u8djza.cloudfront.net/APHI/Blog/2023/September/small-breeds-hero.jpg'}"
                            alt="Profile" class="comment-avatar">
                        <div>
                            <div class="comment-user">${comment.user.userName}</div>
                            <div class="comment-time">${comment.timestamp?datetime}</div>
                        </div>
                    </div>
                    <div class="comment-content">
                        ${comment.content}
                    </div>
                    <div class="comment-actions">
                        <button class="like-btn" onclick="likeComment(${comment.commentId})">
                            <i class="far fa-thumbs-up"></i> Like
                        </button>
                        <button class="reply-btn" onclick="toggleReplyForm(${comment.commentId})">
                            <i class="far fa-comment"></i> Reply
                        </button>
                    </div>

                    <div class="reply-form" id="reply-form-${comment.commentId}">
                        <form action="/activity/reply" method="post">
                            <input type="hidden" name="parentCommentId" value="${comment.commentId}">
                            <input type="hidden" name="songId" value="${song.songId}">
                            <div class="mb-2">
                                <textarea class="form-control" name="content" rows="2" placeholder="Write a reply..."
                                    required></textarea>
                            </div>
                            <button type="submit" class="btn btn-sm btn-outline-primary">Post Reply</button>
                        </form>
                    </div>

                    <#if comment.replies?? && comment.replies?size gt 0>
                        <div class="replies">
                            <#list comment.replies as reply>
                                <div class="comment-card" style="margin-bottom: 1rem;">
                                    <div class="comment-header">
                                        <img src="${reply.user.profileImagePath!'https://d3544la1u8djza.cloudfront.net/APHI/Blog/2023/September/small-breeds-hero.jpg'}"
                                            alt="Profile" class="comment-avatar" style="width: 40px; height: 40px;">
                                        <div>
                                            <div class="comment-user">${reply.user.userName}</div>
                                            <div class="comment-time">${reply.timestamp?datetime}</div>
                                        </div>
                                    </div>
                                    <div class="comment-content">
                                        ${reply.content}
                                    </div>
                                    <div class="comment-actions">
                                        <button class="like-btn" onclick="likeComment(${reply.commentId})">
                                            <i class="far fa-thumbs-up"></i> Like
                                        </button>
                                    </div>
                                </div>
                            </#list>
                        </div>
                    </#if>
                </div>
            </#list>
            <#else>
                <p>No comments yet. Be the first to comment!</p>
        </#if>
    </div>

    <script>
        function toggleReplyForm(commentId) {
            const form = document.getElementById(`reply-form-${commentId}`);
            form.style.display = form.style.display === 'none' ? 'block' : 'none';
        }

        function likeComment(commentId) {
            fetch(`/activity/like/${commentId}`, { method: 'POST' })
                .then(response => {
                    if (response.ok) {
                        location.reload();
                    }
                });
        }
    </script>
</body>

</html>