<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ page import="in.sp.backend.DatabaseUtil" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Announcements</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 20px;
            background-color: white; /* Light gray background */
            background-size: cover;
            background-repeat: no-repeat;
            background-position: center center;
        }
        .container {
            max-width: 800px;
            margin: 0 auto;
            padding: 20px;
            background-color: #e6f7ff; /* Semi-transparent light black background */
            border-radius: 10px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.2);
        }
        h2 {
            text-align: center;
            color: #013220; /* Dark green text color */
            margin-bottom: 20px;
        }
        .announcement {
            margin-bottom: 20px;
            padding: 15px;
            background-color: rgba(255, 255, 255, 0.9); /* Semi-transparent white background */
            border-radius: 5px;
            box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
        }
        .announcement-content {
            color: #013220; /* Dark green text color */
            font-size: 16px;
        }
        .delete-button {
            margin-top : 10px;
            background-color: #dc3545; /* Red delete button */
            color: white;
            border: none;
            padding: 8px 12px;
            border-radius: 3px;
            cursor: pointer;
            transition: background-color 0.3s;
        }
        .delete-button:hover {
            background-color: #c82333; /* Darker red on hover */
        }
        .go-back-button {
            text-align: right;
            margin-top: 20px;
        }
        .go-back-button a {
            display: inline-block;
            padding: 10px 20px;
            background-color: #28a745; /* Dark green background */
            color: #fff;
            text-decoration: none;
            border-radius: 5px;
            transition: background-color 0.3s;
        }
        .go-back-button a:hover {
            background-color: #006400; /* Darker green on hover */
        }
    </style>
</head>
<body>
    <div class="container">
        <div class="go-back-button">
            <a href="ad_announcement.jsp">Go Back</a>
        </div>
        <h2>Announcements</h2>

        <% 
            // Retrieve announcements from the database
            try {
                Connection conn = DatabaseUtil.getConnection();
                Statement statement = conn.createStatement();
                ResultSet rs = statement.executeQuery("SELECT * FROM announcement");

                while (rs.next()) {
                    int announcementId = rs.getInt("announcement_id");
                    String announcementText = rs.getString("announcement");
        %>
                    <div class="announcement">
                        <div class="announcement-content">
                            <%= announcementText %>
                        </div>
                        <form action="final_delete_announcement.jsp" method="post">
                            <input type="hidden" name="announcement_id" value="<%= announcementId %>">
                            <input type="submit" value="Delete" class="delete-button">
                        </form>
                    </div>
        <% 
                }
                rs.close();
                statement.close();
                conn.close();
            } catch (Exception e) {
                out.println("Error: " + e.getMessage());
            }
        %>
    </div>
</body>
</html>
