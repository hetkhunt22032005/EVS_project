<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ page import="in.sp.backend.DatabaseUtil" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Add Announcement</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background: url('images/ann_bg.jpg') no-repeat center center fixed;
            background-size: cover;
            margin: 0;
            padding: 0;
        }
        .container {
            max-width: 800px;
            margin: 10px auto;
            padding: 20px;
            background-color: rgba(255, 255, 255, 0.5); /* Semi-transparent white background */
            border-radius: 10px;
            box-shadow: 0 0 20px rgba(0, 0, 0, 0.2);
        }
        h1 {
            text-align: center;
            color: #013220;
        }
        form {
            margin-top: 20px;
        }
        label {
            display: block;
            margin-bottom: 10px;
            font-weight: bold;
            color: #013220;
        }
        textarea {
            width: calc(100% - 22px); /* Adjusted width to accommodate border and padding */
            padding: 10px;
            border: 1px solid #ccc;
            border-radius: 5px;
            font-size: 16px;
            height: 200px; /* Adjust the height of the textarea */
            resize: none; /* Prevent resizing */
            color: #013220;
        }
        input[type="submit"] {
            width: 100%;
            padding: 10px;
            border: none;
            border-radius: 5px;
            background-color: #013220;
            color: #fff;
            font-size: 16px;
            cursor: pointer;
        }
        input[type="submit"]:hover {
            background-color: #006400;
        }
        .message {
            margin-top: 20px;
            padding: 10px;
            background-color:#013220;
            border: 1px solid #c3e6cb;
            border-radius: 5px;
            color: white;
        }
        .error-message {
            background-color: #f8d7da;
            border-color: #f5c6cb;
            color: #721c24;
        }
.go-back-button {
    text-align: center;
    margin-top: 20px; /* Adjust the top margin as needed */
}

.go-back-button a {
    display: inline-block;
    padding: 10px 20px;
    background-color: #013220;
    color: #fff;
    text-decoration: none;
    border-radius: 5px;
    transition: background-color 0.3s;
    border: 1px solid #013220; /* Add border */
    box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1); /* Add box shadow */
}

.go-back-button a:hover {
    background-color: #006400;
}

        
    </style>
</head>
<body>
    <div class="container">
 
        <form action="make_announcement.jsp" method="post">
            <label for="announcement">Announcement:</label>
            <textarea name="announcement" id="announcement" required></textarea>
            <input type="submit" value="Make Announcement">
            
        </form>

        <%
            if (request.getMethod().equals("POST")) {
                String announcementText = request.getParameter("announcement");
                if (announcementText != null && !announcementText.isEmpty()) {
                    try {
                        // Establish connection to the database
                        Connection conn = DatabaseUtil.getConnection();
                        
                        // Prepare SQL statement to insert announcement
                        String sql = "INSERT INTO announcement (announcement) VALUES (?)";
                        PreparedStatement statement = conn.prepareStatement(sql);
                        statement.setString(1, announcementText);
                        
                        // Execute the SQL statement
                        int rowsInserted = statement.executeUpdate();
                        if (rowsInserted > 0) {
                            out.println("<div style='background-color: #006400; color: #fff;' class='message'>Announcement added successfully!</div>");
        %>
                            <script>
                                setTimeout(function() {
                                    var announcementDiv = document.querySelector('.message');
                                    announcementDiv.parentNode.removeChild(announcementDiv);
                                }, 2000); // 2 seconds
                            </script>
        <%
                        } else {
                            out.println("<div class='message error-message'>Failed to add announcement.</div>");
                        }
                        
                        // Close resources
                        statement.close();
                        conn.close();
                    } catch (Exception e) {
                        out.println("<div  class='message error-message'>Error: " + e.getMessage() + "</div>");
                    }
                } else {
                    out.println("<div class='message error-message'>Please provide an announcement.</div>");
                }
            }
        %>
                <div class="go-back-button">
            <a href="ad_announcement.jsp">Go Back</a>
        </div>

        
    </div>
</body>
</html>
