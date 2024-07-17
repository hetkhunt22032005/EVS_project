<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ page import="in.sp.backend.DatabaseUtil" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Delete Announcement</title>
    <style>
        body {
    font-family: Arial, sans-serif;
    margin: 0;
    padding: 20px;
    background-color: #f0f6f9; /* Light and cool background color */
}

.container {
    max-width: 600px;
    margin: 20px auto;
    padding: 20px;
    background-color: rgba(255, 255, 255, 0.8); /* Semi-transparent white background */
    border-radius: 10px;
    box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
}

        h2 {
            color: #333;
            text-align: center;
            margin-bottom: 20px;
        }
        .message {
            margin-bottom: 20px;
            padding: 10px;
            border-radius: 5px;
        }
        .success-message {
            background-color: #d4edda;
            border: 1px solid #c3e6cb;
            color: #155724;
        }
        .error-message {
            background-color: #f8d7da;
            border: 1px solid #f5c6cb;
            color: #721c24;
        }
        .go-back-button {
            text-align: center;
            margin-top: 20px; /* Adjust the top margin as needed */
        }
        .go-back-button a.button {
            display: inline-block;
            padding: 10px 20px;
            background-color: #28a745; /* Green background color */
            color: #fff;
            text-decoration: none;
            border-radius: 5px;
            transition: background-color 0.3s;
        }
        .go-back-button a.button:hover {
            background-color: #218838; /* Darker green on hover */
        }
    </style>
</head>
<body>
    <div class="container">
        <h2>Deletion Successful</h2>
        <%
            // Get the announcement ID from the request
            String announcementIdStr = request.getParameter("announcement_id");
            if (announcementIdStr != null) {
                int announcementId = Integer.parseInt(announcementIdStr);

                // Delete the announcement from the database
                try {
                    Connection conn = DatabaseUtil.getConnection();
                    String sql = "DELETE FROM announcement WHERE announcement_id = ?";
                    PreparedStatement statement = conn.prepareStatement(sql);
                    statement.setInt(1, announcementId);
                    int rowsDeleted = statement.executeUpdate();

                    if (rowsDeleted > 0) {
        %>
                        <div class="message success-message">Announcement with ID <%= announcementId %> deleted successfully.</div>
        <%
                    } else {
        %>
                        <div class="message error-message">No announcement found with ID <%= announcementId %>.</div>
        <%
                    }

                    statement.close();
                    conn.close();
                } catch (Exception e) {
        %>
                    <div class="message error-message">Error deleting announcement: <%= e.getMessage() %></div>
        <%
                }
            } else {
        %>
                <div class="message error-message">No announcement ID provided.</div>
        <%
            }
        %>
        <div class="go-back-button">
            <a href="delete_announcement.jsp" class="button">Go Back</a>
        </div>
    </div>
</body>
</html>
