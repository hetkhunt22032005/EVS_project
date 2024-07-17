<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="ISO-8859-1">
    <title>Admin Profile</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-image: url('images/adp_bg.jpg'); /* Background image */
            background-size: cover; /* Cover the entire viewport */
            background-position: center center; /* Center the background image */
            background-attachment: fixed; /* Fixed background */
            margin: 0;
            padding: 0;
        }

        .container {
            max-width: 400px;
            margin: 50px auto;
            padding: 20px;
            background-color: rgba(255, 255, 255, 0.8); /* White background with opacity */
            border-radius: 10px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        }

        form {
            margin-bottom: 20px;
            text-align: center;
        }

        .profile-link {
            width: 100%; /* Set width to 100% */
            max-width: 200px; /* Maximum width for the buttons */
            background-color: #013220; /* Blue color for the buttons */
            color: #fff; /* White text color */
            border: none;
            padding: 10px 20px;
            border-radius: 5px;
            cursor: pointer;
            transition: background-color 0.3s ease; /* Smooth transition */
        }

        .profile-link:hover {
            background-color:  #006400; /* Darker blue on hover */
        }
    </style>
</head>
<body>
    <div class="container">
        <form action="ad_announcement.jsp" method="post">
            <input type="submit" class="profile-link" value="Announceements">
        </form>
        <form action="ad_view_users.jsp" method="post">
            <input type="submit" class="profile-link" value="View Users">
        </form>
        
         <form action="sp_day.jsp" method="post">
            <input type="submit" class="profile-link" value="Special Day Tasks">
        </form>
        
        <form action="daily.jsp" method="post">
            <input type="submit" class="profile-link" value= "Daily Tasks">
        </form>
        
        
        
        <form action="ad_login.jsp" method="post">
            <input type="submit" class="profile-link" value="Logout">
        </form>
        
    </div>
</body>
</html>
