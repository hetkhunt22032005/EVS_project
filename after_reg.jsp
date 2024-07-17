<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>after_reg</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            background-image: url('images/after_reg.jpg'); /* Replace 'your_background_image.jpg' with your image path */
            background-size: cover; /* Ensure the background image covers the entire viewport */
            background-position: center; /* Center the background image */
            background-repeat: no-repeat; /* Prevent the background image from repeating */
        }

        .container {
            text-align: center;
            background-color: rgba(255, 255, 255, 0.8); /* Light background color with slight transparency */
            padding: 20px;
            border-radius: 10px;
            box-shadow: 0 2px 5px rgba(0, 0, 0, 0.5);
        }

        h1 {
            color:#013220; /* Dark green color for heading */
            margin-bottom: 20px;
        }

        p {
            color: #333; /* Dark gray color for paragraph */
            margin-bottom: 30px;
        }

        ul {
            list-style-type: none;
            padding: 0;
        }

        li {
            margin-bottom: 10px;
        }

        a.button {
            text-decoration: none;
            color: #fff; /* White text color */
            background-color: #013220; /* Dark green button background color */
            font-weight: bold;
            padding: 10px 20px;
            border: 2px solid #013220; /* Dark green border */
            border-radius: 5px;
            display: inline-block;
            transition: background-color 0.3s ease, color 0.3s ease;
        }

        a.button:hover {
            background-color: #006400; /* Darker green button background color on hover */
            border-color: #006400; /* Darker green border color on hover */
        }
    </style>
</head>
<body>
    <div class="container">
        <h1>Registration Successful</h1>
         Your registration has been successfully completed...!!
        <ul>
            <li><a href="index.jsp" class="button">Go To Front Page</a></li>
        </ul>
    </div>
</body>
</html>
