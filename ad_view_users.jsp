<%@ page import="java.io.PrintWriter" %>
<%@ page import="java.sql.ResultSet" %>
<%@ page import="java.sql.Statement" %>
<%@ page import="java.sql.DriverManager" %>
<%@ page import="java.sql.Connection" %>

<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Center Details</title>
    <style>
        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background-color: #e6f7ff;
            margin: 20px;
            color: #495057;
        }

        .center-details {
            max-width: 1200px;
            margin: 0 auto;
            border: 1px solid #ced4da;
            padding: 20px;
            margin-bottom: 20px;
            background-color: #fff;
            border-radius: 8px;
            box-shadow: 0 0 20px rgba(0, 0, 0, 0.1);
            display: flex;
            align-items: center;
        }

        .center-details img {
            margin-left: auto;
            max-width: 150px; /* Adjust as needed */
            max-height: 150px; /* Adjust as needed */
        }

        h2 {
            text-align: center; /* Align the text to the center */
            margin-top: 10px; /* Add margin on top */
            color: #007bff; /* Keep the specified color */
        }

        .property {
            font-weight: bold;
            margin-right: 10px;
        }

        .go-back {
            margin-top: -5px;
            position: fixed;
            top: 20px;
            right: 20px;
        }

        .go-back button {
            background-color: #28a745; /* Green color */
            color: white;
            border: none;
            padding: 10px 20px;
            border-radius: 5px;
            cursor: pointer;
        }

        .go-back button:hover {
            background-color: #006400; /* Darker green on hover */
        }

    </style>
</head>
<body>
    <h2>Users Details</h2>
    <div class="go-back">
        <button onclick="window.location.href='ad_profile.jsp'">Go Back</button>
    </div>

    <%
    Connection con = null;
    try {
        Class.forName("org.postgresql.Driver");
        con = DriverManager.getConnection("jdbc:postgresql://localhost:5432/EVS", "postgres", "admin");
        Statement st = con.createStatement();
        ResultSet rs = st.executeQuery("SELECT * FROM users");
        while (rs.next()) {
    %>
            <div class="center-details">
                <div>
                    <p><span class="property">Full Name:</span><%= rs.getString("f_name") + " " + rs.getString("m_name") + " " + rs.getString("l_name") %></p>
                    <p><span class="property">E-mail:</span><%= rs.getString("email") %></p>
                    <p><span class="property">Date Of Birth:</span><%= rs.getString("birthdate") %></p>
                    <p><span class="property">Address:</span><%= rs.getString("address") %></p>
                    <p><span class="property">Username:</span><%= rs.getString("username") %></p>
                    <p><span class="property">Password:</span><%= rs.getString("password") %></p>
                </div>
                <img src="images/<%= rs.getString("profile_img") %>" alt="Profile Image">
            </div>
    <%
        }
    } catch (Exception e) {
        e.printStackTrace();
    } finally {
        try {
            if (con != null) {
                con.close();
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
    %>
</body>
</html>
