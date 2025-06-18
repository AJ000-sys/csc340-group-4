<!DOCTYPE html>
<html>

<head>
    <title>Sign Up | Simplex</title>
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

        .signup-container {
            background: #333;
            padding: 2rem;
            border-radius: 12px;
            margin: 50px auto;
            width: 100%;
            max-width: 400px;
            color: white;
        }

        h2 {
            margin-bottom: 1.5rem;
            text-align: center;
            color: #d693f8;
        }

        input[type="text"],
        input[type="email"],
        input[type="password"] {
            width: 100%;
            padding: 0.75rem;
            margin-bottom: 1rem;
            border: 1px solid #555;
            border-radius: 8px;
            font-size: 1rem;
            background: #444;
            color: white;
        }

        button {
            width: 100%;
            padding: 0.75rem;
            background-color: #d693f8;
            color: white;
            border: none;
            border-radius: 8px;
            font-size: 1rem;
            cursor: pointer;
            transition: background-color 0.3s ease;
        }

        button:hover {
            background-color: #c47de8;
        }

        .footer-text {
            margin-top: 1rem;
            font-size: 0.9rem;
            text-align: center;
            color: #aaa;
        }

        .footer-text a {
            color: #d693f8;
            text-decoration: none;
        }

        .footer-text a:hover {
            text-decoration: underline;
        }

        .error-message {
            color: #ff6b6b;
            margin-top: 1rem;
            text-align: center;
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
                </ul>
            </nav>
        </div>
    </header>

    <div class="container">
        <div class="signup-container">
            <h2>Sign Up</h2>
            <form action="/user/register" method="post">
                <input type="text" name="userName" placeholder="Username" required>
                <input type="email" name="email" placeholder="Email" required>
                <input type="password" name="password" placeholder="Password" required>

                <button type="submit">Sign Up</button>
            </form>
            <div class="footer-text">
                Already have an account? <a href="/user/login">Sign in</a>
            </div>
            <#if error??>
                <div class="error-message">${error}</div>
            </#if>
        </div>
    </div>
</body>

</html>