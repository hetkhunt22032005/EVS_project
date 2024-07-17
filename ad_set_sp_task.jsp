<%@ page contentType="text/html; charset=UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Upload PDF and Enter String</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
            background-image: url('images/img1.jpg'); /* Add your background image URL here */
            background-size: cover;
            background-repeat: no-repeat;
            background-position: center;
            height: 100vh;
            display: flex;
            justify-content: center;
            align-items: center;
        }

        .container {
            background-color: rgba(255, 255, 255, 0.8);
            padding: 40px;
            border-radius: 10px;
            box-shadow: 0 0 20px rgba(0, 0, 0, 0.2);
            text-align: center;
            max-width: 500px; /* Set maximum width */
            width: 90%; /* Set width to 90% of container */
        }

        h2 {
            color: #013220; /* Change header color */
        }

        label {
            font-weight: bold;
            color: #013220; /* Change label color */
        }

        input[type="date"],
        input[type="text"],
        input[type="file"],
        input[type="submit"] {
            margin: 10px 0;
            padding: 10px;
            border-radius: 5px;
            border: 1px solid #ccc;
            width: 100%; /* Set width to 100% */
            box-sizing: border-box; /* Include padding and border in width calculation */
        }

        input[type="submit"] {
            background-color: #013220; /* Change button background color */
            color: #fff;
            cursor: pointer;
        }

        input[type="submit"]:hover {
            background-color: #006400; /* Change button hover background color */
        }
        
    </style>
    <style>
    .white-background {
        background-color: white; /* Set background color of input box to white */
    }
</style>
    
</head>
<body>
    <div class="container">
        <h2>Add Special Day Task</h2>
        <form action="ProcessFormDataServlet" method="post" enctype="multipart/form-data">
            <label for="date">Select Date:</label><br>
            <input type="date" id="date" name="date"><br>
            
           <label for="pdf">Upload Task PDF:</label><br>
<input type="file" id="pdf" name="pdf" class="white-background"><br>

            
            <label for="day_name">Enter Day Name:</label><br>
            <input type="text" id="day_name" name="day_name"><br>
            
            <input type="submit" value="Submit">
            
        </form>
    </div>
</body>
</html>
