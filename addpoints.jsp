<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
 
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Update Score</title>
</head>
<body>
    <%
        // Get the user ID from the session
         int userID = Integer.parseInt((String) session.getAttribute("userID"));
       
        
        // Database connection parameters
        String url = "jdbc:postgresql://localhost:5432/EVS";
        String username = "postgres";
        String password = "admin";
        
        // SQL query to update the user's score
        String sql = "UPDATE users SET score = score + 5 WHERE id = ?";
        
        try {
            // Load the PostgreSQL JDBC driver
            Class.forName("org.postgresql.Driver");
            
            // Connect to the database
            try (Connection conn = DriverManager.getConnection(url, username, password);
                 PreparedStatement pstmt = conn.prepareStatement(sql)) {
                
                // Set the user ID parameter in the SQL query
                pstmt.setInt(1, userID);
                
                // Execute the SQL update
                int rowsAffected = pstmt.executeUpdate();
                
                if (rowsAffected > 0) {
                    out.println("<p>Score updated successfully!</p>");
                } else {
                    out.println("<p>Failed to update score.</p>");
                }
            } catch (SQLException e) {
                out.println("<p>Error: " + e.getMessage() + "</p>");
            }
        } catch (ClassNotFoundException e) {
            out.println("<p>Error: PostgreSQL JDBC Driver not found.</p>");
        }
    %>
</body>
</html>
