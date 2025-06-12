<!DOCTYPE html>
<html>
<head>
    <title>Register | Simplex</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #292525;
            color: white;
            margin: 0;
            padding: 0;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
        }
        .register-container {
            background-color: #3a3636;
            padding: 30px;
            border-radius: 8px;
            width: 350px;
            box-shadow: 0 4px 8px rgba(0,0,0,0.2);
        }
        h2 {
            color: #d693f8;
            text-align: center;
            margin-bottom: 25px;
        }
        .form-group {
            margin-bottom: 20px;
        }
        label {
            display: block;
            margin-bottom: 8px;
        }
        input {
            width: 100%;
            padding: 10px;
            border-radius: 4px;
            border: 1px solid #444;
            background-color: #292525;
            color: white;
        }
        button {
            background-color: #d693f8;
            color: black;
            border: none;
            padding: 12px;
            width: 100%;
            border-radius: 4px;
            cursor: pointer;
            font-weight: bold;
            transition: background-color 0.3s;
        }
        button:hover {
            background-color: #c47df5;
        }
        .login-link {
            text-align: center;
            margin-top: 20px;
        }
        .login-link a {
            color: #d693f8;
            text-decoration: none;
        }
        .error {
            color: #ff6b6b;
            margin-bottom: 15px;
            text-align: center;
        }
    </style>
</head>
<body>
    <div class="register-container">
        <h2>Create Your Account</h2>
        
        <#if error??>
            <div class="error">${error}</div>
        </#if>
        
        <form action="/user/register" method="post">
            <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
            
            <div class="form-group">
                <label for="userName">Username</label>
                <input type="text" id="userName" name="userName" required>
            </div>
            
            <div class="form-group">
                <label for="email">Email</label>
                <input type="email" id="email" name="email" required>
            </div>
            
            <div class="form-group">
                <label for="password">Password</label>
                <input type="password" id="password" name="password" required>
            </div>
            
            <div class="form-group">
                <label for="confirmPassword">Confirm Password</label>
                <input type="password" id="confirmPassword" name="confirmPassword" required>
            </div>
            
            <button type="submit">Register</button>
            
            <div class="login-link">
                Already have an account? <a href="/user/login">Sign in</a>
            </div>
        </form>
    </div>
</body>
</html