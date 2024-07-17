<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<style>
    body {
        font-family: Arial, sans-serif;
        margin: 0;
        padding: 0;
        background-image: url('images/sp_day.jpg');
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
        background-color: rgba(255, 255, 255, 0.5);
        padding: 40px;
        border-radius: 10px;
        box-shadow: 0 0 20px rgba(0, 0, 0, 0.2);
        text-align: center;
    }
    .button-container a,
    .button-container input[type="submit"] {
                 display: block;
            margin: 10px auto;
            padding: 15px 30px;
            background-color: #013220; /* Green */
            color: #fff;
            text-decoration: none;
            border-radius: 5px;
            transition: background-color 0.3s;
            font-size: 15px;
         
        
    }
    .button-container a:hover,
    .button-container input[type="submit"]:hover {
        background-color: #006400; /* Darker Green */
    }
</style>
</head>
<body>
<div class="container">
    <div class="button-container">
        <a href="ad_set_daily_task.jsp">Add Toady's Task</a>
        <form action="DisplayPdfServlet1" method="post">
            <input type="submit" value="Display Daily Task">
        </form>
        <a href="ad_profile.jsp">Go Back</a>
    </div>
</div>
</body>
</html>
