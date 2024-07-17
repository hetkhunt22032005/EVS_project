<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Contact Us</title>
<style>
    body {
        font-family: Arial, sans-serif;
        background-color: #f0f9e8; /* Light green background */
        margin: 0;
        padding: 0;
    }
    .container {
        max-width: 800px;
        margin: 20px auto;
        padding: 20px;
        background-color: #ffffff; /* White background */
        border-radius: 8px;
        box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
    }
    h1 {
        color: #006400; /* Dark green heading */
        text-align: center;
    }
    p {
        color: #333; /* Dark text */
        margin: 10px 0;
    }
    .contact-info {
        background-color: #eaf5dc; /* Light green background for contact info */
        padding: 20px;
        border-radius: 8px;
        box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
    }
    .contact-info h2 {
        color: #006400; /* Dark green heading */
    }
    .contact-info p {
        color: #333; /* Dark text */
    }
    .footer {
        text-align: center;
        margin-top: 20px;
    }
    .goback-button {
        background-color: #4CAF50; /* Slightly light green background */
        color: #ffffff; /* White text color */
        border: none;
        padding: 10px 20px;
        border-radius: 5px;
        text-decoration: none;
        transition: background-color 0.3s ease; /* Smooth transition */
    }
    .goback-button:hover {
        background-color: #45a049; /* Darker green on hover */
    }
</style>
</head>
<body>
<div class="container">
    <h1>Contact Us</h1>
    <div class="contact-info">
        <h2>Our Office</h2>
        <p>Daiict college, Reliance Cross Rd,</p>
        <p>Gandhinagar, Gujarat 382007,India.</p>
         
        <h2>Contact Details</h2>
        <p>Email: radadiyadarshil9@gmail.com</p>
        <p>Phone: 9328162327</p>
    </div>
</div>
<div class="footer">
    <a href="profile.jsp" class="goback-button">Go back</a>
</div>
</body>
</html>
