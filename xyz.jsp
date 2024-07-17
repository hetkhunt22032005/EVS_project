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
    <title>Today's Special Task</title>
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
        <h1>Today's Special Task</h1>
        
        <%-- Java code to get the current date and format it --%>
        <% 
            LocalDate currentDate = LocalDate.now();
            DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd");
            String todayDate = currentDate.format(formatter);
        %>
        
        <% 
            boolean taskFound = false;
            Integer taskId = null; // Initialize task ID variable outside try block 
            
            String url = "jdbc:postgresql://localhost:5432/EVS";
            String username = "postgres";
            String password = "admin";
            String sql = "SELECT taskid, task_date FROM special_day_tasks";
            
            try {
                Class.forName("org.postgresql.Driver");
                try (Connection conn = DriverManager.getConnection(url, username, password);
                     PreparedStatement pstmt = conn.prepareStatement(sql);
                     ResultSet rs = pstmt.executeQuery()) {
                    
                    // Iterate over the result set and display task dates
                    while (rs.next()) {
                        String taskDate = rs.getString("task_date");
                        int id = rs.getInt("taskid");
                        if (taskDate.equalsIgnoreCase(todayDate)) {
                            taskFound = true;
                            // Store the matched task ID in a variable accessible outside the try block
                            taskId = id;
                        }
                    }
                } catch (SQLException e) {
                    // Handle database errors
                    e.printStackTrace();
                }
            } catch (ClassNotFoundException e) {
                // Handle class not found exception
                e.printStackTrace();
            }
        %>
        
        <ul class="task-list">
            <% if (taskFound && taskId != null) { %>
                <%-- Java code to retrieve task details and construct links --%>
                <% 
                    try {
                        Class.forName("org.postgresql.Driver");
                        try (Connection conn = DriverManager.getConnection(url, username, password);
                             PreparedStatement pstmt = conn.prepareStatement("SELECT task, day_name FROM special_day_tasks WHERE taskid = ?");
                             ) {
                            pstmt.setInt(1, taskId);
                            ResultSet rs = pstmt.executeQuery();
                            while (rs.next()) {
                                String fileName = rs.getString("task");
                                String dayName = rs.getString("day_name");
                %>               
                               <li>Task: <a href="images/<%= fileName %>"><%= fileName %></a></li>
                <%
                            }
                        } catch (SQLException e) {
                            // Handle database errors
                            e.printStackTrace();
                        }
                    } catch (ClassNotFoundException e) {
                        // Handle class not found exception
                        e.printStackTrace();
                    }
                %>
            <% } else { %>
                <p class="no-task">No task scheduled for today.</p>
            <% } %>
        </ul>
        
        <%-- Form to submit --%>
        <form action="addpoints.jsp" method="post">
            <button type="submit" class="cta-button">I have Completed My Task Honestly</button>
        </form>
    </div>
</body>
</html>
