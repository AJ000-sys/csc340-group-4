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

        .content {
            padding: 20px;
            color: white;
            text-align: center;
            margin-top: 50px;
        }

        .cta-button {
            background: #d693f8;
            border: none;
            color: white;
            padding: 12px 25px;
            border-radius: 5px;
            cursor: pointer;
            font-size: 1.1em;
            text-decoration: none;
            display: inline-block;
            margin-top: 20px;
        }

        .cta-button:hover {
            background: #c47de8;
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
                    <li><a href="/user/login">Login</a></li>
                </ul>
            </nav>
        </div>
    </header>

    <div class="container">
        <section class="content">
            <h2>Welcome to Simplex</h2>
            <p>Upload your songs here!</p>
            <a href="/user/register" class="cta-button">Get Started</a>
        </section>
    </div>
</body>

</html>