<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.Connection, java.sql.DriverManager, java.sql.PreparedStatement, java.sql.ResultSet, java.sql.SQLException" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Announcement List</title>
<style>
    body {
        font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
        background-color: #f0ece1; /* Light beige background */
        margin: 0;
        padding: 0;
    }
    .container {
        max-width: 800px;
        margin: 20px auto;
        padding: 20px;
        background-color: #fff; /* White background */
        border-radius: 8px;
        box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
    }
    .announcement {
        padding: 20px;
        margin-bottom: 20px;
        background-color: #d4c4a7; /* Light brown background */
        border-radius: 8px;
        box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
    }
    h1 {
        color: #4d4d4d; /* Dark gray heading */
        text-align: center;
    }
    p {
        color: #333; /* Dark text */
        margin: 0;
    }
    .goback-button {
        position: fixed;
        top: 20px;
        right: 20px;
        background-color: #d4c4a7; /* Use the same background color as the announcements */
        color: #4d4d4d; /* Use the same text color as the headings */
        border: none;
        padding: 10px 20px;
        border-radius: 5px;
        text-decoration: none;
        transition: background-color 0.3s ease; /* Smooth transition */
    }
    .goback-button:hover {
        background-color: #c2b09a; /* Darken the button color on hover */
    }
</style>
</head>
<body>
<a href="profile.jsp" class="goback-button">Go back</a>
<div class="container">
    <h1>Announcement List</h1>
    <%
        Connection con = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        try {
            Class.forName("org.postgresql.Driver");
            con = DriverManager.getConnection("jdbc:postgresql://localhost:5432/EVS", "postgres", "admin");

            String query = "SELECT * FROM announcement";
            ps = con.prepareStatement(query);
            rs = ps.executeQuery();

            // Iterate over the result set and display the announcements
            while (rs.next()) {
    %>
                <div class="announcement">
                    <p><strong>Announcement:</strong> <%= rs.getString("announcement") %></p>
                </div>
    <%
            }
        } catch (Exception e) {
            e.printStackTrace();
            out.println("<div>Error occurred: " + e.getMessage() + "</div>");
        } finally {
            // Close resources
            if (rs != null) {
                try {
                    rs.close();
                } catch (SQLException e) {
                    e.printStackTrace();
                }
            }
            if (ps != null) {
                try {
                    ps.close();
                } catch (SQLException e) {
                    e.printStackTrace();
                }
            }
            if (con != null) {
                try {
                    con.close();
                } catch (SQLException e) {
                    e.printStackTrace();
                }
            }
        }
    %>
</div>
</body>
</html>
