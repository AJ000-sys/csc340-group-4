<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Edit Profile</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap/5.3.0/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css">
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
            background-color: #292525;
        }

        header {
            background: #040404;
            color: #fff;
            padding: 1rem;
            text-align: center;
        }

        .container {
            width: 80%;
            margin: 2rem auto;
        }

        .edit-form {
            background: #232323;
            padding: 2rem;
            border-radius: 8px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.3);
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
        input[type="email"],
        textarea {
            width: 100%;
            padding: 0.75rem;
            background: #333;
            border: 1px solid #444;
            border-radius: 4px;
            color: #fff;
        }

        textarea {
            min-height: 100px;
            resize: vertical;
        }

        .profile-preview {
            width: 150px;
            height: 150px;
            border-radius: 50%;
            object-fit: cover;
            display: block;
            margin: 0 auto 1rem;
            border: 3px solid #d693f8;
        }

        .file-upload {
            text-align: center;
            margin-bottom: 1.5rem;
        }

        .file-upload-label {
            display: inline-block;
            padding: 0.5rem 1rem;
            background: #d693f8;
            color: #000;
            border-radius: 4px;
            cursor: pointer;
            transition: background 0.3s;
        }

        .file-upload-label:hover {
            background: #c47de8;
        }

        #profileImage {
            display: none;
        }

        .button-group {
            display: flex;
            justify-content: space-between;
            margin-top: 2rem;
        }

        .btn {
            padding: 0.75rem 1.5rem;
            border: none;
            border-radius: 4px;
            cursor: pointer;
            font-weight: bold;
            transition: background 0.3s;
        }

        .btn-save {
            background: #d693f8;
            color: #000;
        }

        .btn-save:hover {
            background: #c47de8;
        }

        .btn-cancel {
            background: #555;
            color: #fff;
        }

        .btn-cancel:hover {
            background: #666;
        }

        /* NEW: Delete button styles */
        .btn-delete {
            background: #ff4d4d;
            color: white;
            padding: 0.75rem;
            margin-left: 1rem;
        }

        .btn-delete:hover {
            background: #e60000;
        }

        /* NEW: Modal styles */
        .modal-content {
            background-color: #232323;
            color: white;
        }

        .modal-header, .modal-footer {
            border-color: #444;
        }

        nav ul {
            list-style: none;
            padding: 0;
            display: flex;
            gap: 1rem;
            margin-bottom: 1.5rem;
        }

        nav ul li a {
            color: #d693f8;
            text-decoration: none;
        }

        nav ul li a:hover {
            text-decoration: underline;
        }
    </style>
</head>

<body>
    <header>
        <div class="container">
            <h1>Edit Profile</h1>
        </div>
    </header>

    <div class="container">
        <nav>
            <ul>
                <li><a href="/user/profile">← Back to Profile</a></li>
            </ul>
        </nav>

        <div class="edit-form">
            <form action="/user/profile/update" method="post" enctype="multipart/form-data">
                <div class="file-upload">
                    <img id="profilePreview"
                        src="<#if user.profileImagePath??>${user.profileImagePath}<#else>https://d3544la1u8djza.cloudfront.net/APHI/Blog/2023/September/small-breeds-hero.jpg</#if>"
                        class="profile-preview" alt="Profile Preview">
                    <label for="profileImage" class="file-upload-label">
                        Change Profile Picture
                    </label>
                    <input type="file" id="profileImage" name="profileImage" accept="image/*">
                </div>

                <div class="form-group">
                    <label for="userName">Username</label>
                    <input type="text" id="userName" name="userName" value="${user.userName}" required>
                </div>

                <div class="form-group">
                    <label for="email">Email</label>
                    <input type="email" id="email" name="email" value="${user.email}" required>
                </div>

                <div class="form-group">
                    <label for="bio">Bio</label>
                    <textarea id="bio" name="bio"><#if user.bio??>${user.bio}</#if></textarea>
                </div>

                <!-- MODIFIED: Button group with delete button -->
                <div class="button-group">
                    <a href="/user/profile" class="btn btn-cancel">Cancel</a>
                    <div>
                        <button type="submit" class="btn btn-save">Save Changes</button>
                        <button type="button" class="btn btn-delete" id="deleteProfileBtn" title="Delete Profile">
                            <i class="fas fa-trash"></i>
                        </button>
                    </div>
                </div>
            </form>
        </div>
    </div>

    <!-- NEW: Delete confirmation modal -->
    <div class="modal fade" id="deleteConfirmModal" tabindex="-1" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content" style="background-color: #232323; color: white;">
                <div class="modal-header">
                    <h5 class="modal-title">Confirm Deletion</h5>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close" style="filter: invert(1);"></button>
                </div>
                <div class="modal-body">
                    <p>Are you sure you want to delete your profile? This action cannot be undone.</p>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Cancel</button>
                    <form action="/user/profile/delete" method="post" style="display: inline;">
                        <button type="submit" class="btn btn-danger">Delete Permanently</button>
                    </form>
                </div>
            </div>
        </div>
    </div>

    <script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap/5.3.0/js/bootstrap.bundle.min.js"></script>
    <script>
        document.addEventListener('DOMContentLoaded', function() {
            // NEW: Delete button functionality
            const deleteBtn = document.getElementById('deleteProfileBtn');
            if (deleteBtn) {
                deleteBtn.addEventListener('click', function() {
                    const modal = new bootstrap.Modal(document.getElementById('deleteConfirmModal'));
                    modal.show();
                });
            }

            document.getElementById('profileImage').addEventListener('change', function (e) {
                const file = e.target.files[0];
                if (file) {
                    const reader = new FileReader();
                    reader.onload = function (event) {
                        document.getElementById('profilePreview').src = event.target.result;
                    };
                    reader.readAsDataURL(file);
                }
            });
        });
    </script>

    <footer>
        <p>&copy; 2024 Your Company</p>
    </footer>
</body>
</html>