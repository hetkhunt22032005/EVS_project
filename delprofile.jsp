<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Login Page</title>
    <style>
        body {
            font-family: 'Arial', sans-serif;
            background-color: #f5f5f5; /* Light gray background */
            margin: 0;
            display: flex;
            align-items: center;
            justify-content: center;
            height: 100vh;
        }

        form {
            background-color: #ffffff;
            padding: 20px;
            border-radius: 8px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            width: 300px;
            text-align: center;
            border: 2px solid #8db596; /* Light green border */
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
            background-color: #4caf50; /* Green button */
            color: #fff;
            padding: 10px 15px;
            border: none;
            border-radius: 4px;
            cursor: pointer;
            transition: background-color 0.3s ease; /* Smooth transition */
        }

        input[type="submit"]:hover {
            background-color: #45a049; /* Darker green on hover */
        }
    </style>
</head>
<body>
    <form action="delete" method="post">
        <h2>Delete Account</h2>
        <label for="username">Username:</label>
        <input type="text" id="username" name="username" required/><br/>

        <label for="password">Password:</label>
        <input type="password" id="password" name="password" required/><br/>

        <input type="submit" value="Delete Your Account"/>
    </form>
</body>
</html>
