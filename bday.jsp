<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.time.LocalDate" %>
<%@ page import="java.time.format.DateTimeFormatter" %>
<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.DriverManager" %>
<%@ page import="java.sql.PreparedStatement" %>
<%@ page import="java.sql.ResultSet" %>
<%@ page import="java.sql.SQLException" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Current Date and Task Date</title>
    <style>
        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            margin: 0;
            padding: 20px;
            background-color: #f5f5f5;
        }
        .container {
            max-width: 800px;
            margin: 0 auto;
            background-color: #ffffff;
            padding: 20px;
            border-radius: 8px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        }
        h1 {
            text-align: center;
            color: #333333;
            margin-bottom: 30px;
        }
        .task-list {
            list-style-type: none;
            padding: 0;
            margin-top: 20px;
        }
        .task-list li {
            margin-bottom: 15px;
        }
        .task-list li a {
            color: #007bff;
            text-decoration: none;
            transition: color 0.3s ease;
        }
        .task-list li a:hover {
            color: #0056b3;
            text-decoration: underline;
        }
        .no-task {
            text-align: center;
            color: #888888;
        }
        .cta-button {
            display: block;
            width: 100%;
            max-width: 400px;
            margin: 20px auto;
            padding: 12px 24px;
            border: none;
            border-radius: 4px;
            background-color:  #013220;
            color: #ffffff;
            font-size: 16px;
            font-weight: bold;
            text-align: center;
            text-decoration: none;
            cursor: pointer;
            transition: background-color 0.3s ease;
        }
        .cta-button:hover {
            background-color: #006400;
        }
    </style>
</head>
<body>
    <div class="container">
        <h1>Celebrating Special Moments</h1>
        
        <a href="images/birthday_task.pdf">Birthday Special Task</a>
        
        <form action="addpoints.jsp" method="post">
            <button type="submit" class="cta-button">I have Completed My Task Honestly</button>
        </form>
    </div>
</body>
</html>
