<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Login Page</title>
    <style>
        body {
            font-family: 'Arial', sans-serif;
            margin: 0;
            display: flex;
            align-items: center;
            justify-content: center;
            height: 100vh;
            /* Background image */
            background-image: url('images/homepage.jpg');
            background-size: 100% auto; /* Cover the entire width of the screen while maintaining aspect ratio */
            background-size: cover; /* Cover the entire screen */
            background-position: center; /* Center the background image */
            background-repeat: no-repeat; /* Do not repeat the background image */
        }

        form {
            background-color: #ffffff;
            padding: 20px;
            border-radius: 8px;
            
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            width: 300px;
            text-align: center;
            border: 2px solid #8db596; /* Light green border */
            background-color: rgba(255, 255, 255, 0.4); /* Semi
        }

        h2 {
            color: #4caf50; /* Green heading */
        }

        label {
            display: block;
            margin: 10px 0;
            color: #333333; /* Dark gray text */
            font-weight: bold;
        }

        input[type="text"],
        input[type="password"] {
            width: 100%;
            padding: 10px;
            margin: 8px 0;
            box-sizing: border-box;
            border: 1px solid #ccc;
            border-radius: 4px;
            background-color: #f9f9f9; /* Light gray input background */
        }

        input[type="submit"] {
            background-color: #013220; /* Green button */
            color: #fff;
            padding: 10px 15px;
            border: none;
            border-radius: 4px;
            cursor: pointer;
            transition: background-color 0.3s ease; /* Smooth transition */
        }

        input[type="submit"]:hover {
            background-color: #006400; /* Darker green on hover */
        }
    </style>
</head>
<body>
    <form action="login" method="post">
       
        
        <input type="text" id="username" name="username"  placeholder="Username" required required/><br/>

        
        <input type="password" id="password" name="password"  placeholder="Password" required required/><br/>

        <input type="submit" value="Login"/>
    </form>
</body>
</html>
