<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <title>Song Comments</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap/5.3.0/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css">
    <style>
        body {
            background: #181818;
            color: #fff;
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
        }

        .comment-card {
            background: #232323;
            border-radius: 8px;
            padding: 1.5rem;
            margin-bottom: 1.5rem;
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

        .comment-actions {
            margin-top: 1rem;
        }

        .reply-form {
            margin-top: 1rem;
            display: none;
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

    <div class="container">
        <h1>Comments for: ${song.title}</h1>

        <div class="comment-card">
            <form action="/activity/comment" method="post">
                <input type="hidden" name="songId" value="${song.songId}">
                <div class="mb-3">
                    <textarea class="form-control" name="content" placeholder="Write a comment..." required></textarea>
                </div>
                <button type="submit" class="btn btn-primary">Post Comment</button>
            </form>
        </div>

        <#if comments?? && comments?size gt 0>
            <#list comments as comment>
                <div class="comment-card">
                    <div class="comment-header">
                        <img src="${comment.user.profileImagePath!'/default-profile.jpg'}" class="comment-avatar">
                        <div>
                            <div class="comment-user">${comment.user.userName}</div>
                            <div class="comment-time">${comment.timestamp?string("MMM d, yyyy 'at' h:mm a")}</div>
                        </div>
                    </div>
                    <p>${comment.content}</p>

                    <button class="btn btn-sm btn-outline-light" onclick="toggleReplyForm('${comment.commentId}')">
                        <i class="far fa-comment"></i> Reply
                    </button>

                    <div id="reply-form-${comment.commentId}" class="reply-form">
                        <form action="/activity/reply" method="post" class="reply-form-inner">
                            <input type="hidden" name="parentCommentId" value="${comment.commentId}">
                            <input type="hidden" name="songId" value="${song.songId}">
                            <textarea class="form-control" name="content" required
                                placeholder="Write a reply..."></textarea>
                            <button type="submit" class="btn btn-primary btn-sm mt-2">Post Reply</button>
                        </form>
                    </div>

                    <#if comment.replies?? && comment.replies?size gt 0>
                        <div style="margin-left: 3rem; margin-top: 1rem;">
                            <#list comment.replies as reply>
                                <div class="comment-card" style="background: #2a2a2a;">
                                    <div class="comment-header">
                                        <img src="${reply.user.profileImagePath!'/default-profile.jpg'}"
                                            class="comment-avatar">
                                        <div>
                                            <div class="comment-user">${reply.user.userName}</div>
                                            <div class="comment-time">${reply.timestamp?datetime}</div>
                                        </div>
                                    </div>
                                    <p>${reply.content}</p>

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
            const form = document.getElementById('reply-form-' + commentId);
            form.style.display = form.style.display === 'none' ? 'block' : 'none';
            if (form.style.display === 'block') {
                form.querySelector('textarea').focus();
            }
        }
    </script>
</body>

</html>