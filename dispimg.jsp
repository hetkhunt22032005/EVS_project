<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Your Profile</title>
<style>
  body {
    font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
    background-color: #e5e5e5; /* Light gray */
    margin: 0;
    padding: 0;
  }
  .container {
    width: 80%;
    margin: 0 auto;
    padding: 20px;
    background-color: #fff; /* White */
    border-radius: 10px;
    box-shadow: 0 0 10px rgba(0, 0, 0, 0.1); /* Soft shadow */
  }
  h1 {
    text-align: center;
    color: #4CAF50; /* Green */
    margin-bottom: 20px;
  }
  table {
    width: 100%;
    border-collapse: collapse;
    margin-bottom: 20px;
  }
  table td, table th {
    border: 1px solid #ddd;
    padding: 8px;
    text-align: left;
  }
  table th {
    background-color: #f2f2f2; /* Light gray */
  }
  img {
    max-width: 200px;
    height: auto;
    display: block;
    margin: 0 auto;
  }
  p {
    margin-bottom: 10px;
    color: #555; /* Dark gray */
  }
  .button-container {
    text-align: center;
    margin-top: 20px;
  }
  .button {
    background-color: #4CAF50; /* Green */
    color: #fff;
    padding: 10px 20px;
    text-decoration: none;
    border-radius: 5px;
    margin-right: 10px;
    transition: background-color 0.3s ease; /* Smooth transition */
  }
  .button:last-child {
    margin-right: 0;
  }
  .button:hover {
    background-color: #45a049; /* Darker green on hover */
  }
</style>
</head>
<body>
<div class="container">
  <h1>Your Profile</h1>
  <table>
    <tr>
      <th>Profile Image</th>
    </tr>
    <%
      // This code will be executed when the form is submitted
      String fileName = (String) request.getAttribute("img");

      if (fileName != null && !fileName.isEmpty()) {
          // Ensure that the file path is correct
          String imagePath = "D:/workspace/GW/src/main/webapp/images/" + fileName;
    %>
        <tr>
          <td><img src="images/<%=fileName%>" alt="Profile Image"></td>
        </tr>
    <%
      }
    %>
  </table>
  <p>First Name: ${f_name}</p>
  <p>Middle Name: ${m_name}</p>
  <p>Last Name: ${l_name}</p>
  <p>Address : ${address}</p>
  <p>Email: ${email}</p>
  <p>Score: ${score}</p>
  <p>Date of Birth: ${birthdate}</p>
  <p>Phone Number: ${ph_no}</p>
  
  <div class="button-container">
    <a href="addimg.jsp" class="button">Update your Profile Image</a>
    <a href="profile.jsp" class="button">Go to front Page</a>
  </div>
</div>
</body>
</html>
