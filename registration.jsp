<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Welcome to GreenWhale</title>
<style>
    body {
        font-family: Arial, sans-serif;
        background-image: url('images/forest.jpg'); /* Replace 'your_background_image.jpg' with the path to your image */
        background-size: cover; /* Cover the entire background */
        background-position: center; /* Center the background image */
        background-repeat: no-repeat; /* Prevent the background image from repeating */
        margin: 0;
        padding: 0;
    }
    h2 {
        text-align: center;
        color: #333;
    }
    form {
        width: 400px;
        margin: 20px auto;
        background-color: rgba(255, 255, 255, 0.2); /* Light background color with slight transparency */
        padding: 20px;
        border-radius: 5px;
        box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1);
         float: left;
    }
    label {
        font-weight: bold;
        color: #333;
    }
    input[type="text"],
    input[type="email"],
    input[type="password"],
    input[type="date"] {
        width: 100%;
        padding: 10px;
        margin-bottom: 20px;
        border: 1px solid #ccc;
        border-radius: 4px;
        box-sizing: border-box;
    }
    input[type="submit"] {
        width: 100%;
        background-color: #013220;
        color: #fff;
        padding: 10px;
        border: none;
        border-radius: 4px;
        cursor: pointer;
        font-size: 16px;
    }
    input[type="submit"]:hover {
        background-color: #006400;
    }
</style>
</head>
<body>
 
    <form action="regForm" method="post">
        <div class="form-section">
             <input type="text" id="f_name" name="f_name" placeholder="First Name" required>
        </div>
        <div class="form-section">
             <input type="text" id="m_name" name="m_name" placeholder="Middle Name" required>
        </div>
        <div class="form-section">
             <input type="text" id="l_name" name="l_name" placeholder="Last Name" required>
        </div>
        <div class="form-section">
             <input type="email" id="email" name="email" placeholder="Email" required>
        </div>
        <div class="form-section">
             <input type="text" id="ph_no" name="ph_no" placeholder="Phone Number" required>
        </div>
        <div class="form-section">
             <input type="text" id="address" name="address" placeholder="Address" required>
        </div>
        <div class="form-section">
             <input type="date" id="birthdate" name="birthdate" placeholder="Date Of Birth" required>
        </div>
        <div class="form-section">
             <input type="text" id="username" name="username" placeholder="Username" required>
        </div>
        <div class="form-section">
             <input type="password" id="password" name="password" placeholder="Password" required>
        </div>
        <div class="form-section">
             <input type="password" id="c_password" name="c_password" placeholder="Confirm Password" required>
        </div>
        <input type="submit" value="Register">
    </form>
</body>
</html>
