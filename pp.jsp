<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>User Data</title>
</head>
<body>

<p>User ID: ${userID}</p>
<p>First Name: ${f_name}</p>
<p>Middle Name: ${m_name}</p>
<p>Last Name: ${l_name}</p>
<p>Address : ${address}</p>
<p>email: ${email}</p>
<p>Phone Number: ${ph_no}</p>
<p>Age: ${age}</p>
<a href="addimg.jsp">Update your Profile Image</a>
<form action="dispimg" method="post">
     
    <input type="submit" value="Display Image">
</form>
<a href="profile.jsp">Go to front Page</a>
</body>
</html>
