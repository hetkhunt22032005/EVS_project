<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Announcement Management</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
            background-image: url(' images/da_bg.jpg');
            background-size: cover;
            background-repeat: no-repeat;
            background-position: center;
        }
        .container {
        
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
        }
        .button-container {
            background-color: rgba(255, 255, 255, 0.8);
            padding: 40px;
            border-radius: 10px;
            box-shadow: 0 0 20px rgba(0, 0, 0, 0.2);
            text-align: center;
        }
        .button-container a {
            display: block;
            margin: 10px auto;
            padding: 15px 30px;
            background-color: #013220; /* Green */
            color: #fff;
            text-decoration: none;
            border-radius: 5px;
            transition: background-color 0.3s;
        }
        .button-container a:hover {
            background-color:#006400; /* Darker Green */
        }
    </style>
</head>
<body>
    <div class="container">
        <div class="button-container">
            <a href="make_announcement.jsp">Make Announcement</a>
            <a href="delete_announcement.jsp">Delete Announcement</a>
             <a href="ad_profile.jsp">Go Back</a>
        </div>
    </div>
</body>
</html>
