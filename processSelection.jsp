<%@ page import="java.sql.*" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Select District</title>
    <style>
        body {
            background-image: url('images/tree1.jpg'); /* Replace 'background_image.jpg' with the path to your background image */
            background-size: cover;
            background-position: center;
            font-family: Arial, sans-serif;
            color: #ffffff; /* Text color */
        }
        .container {
            max-width: 600px;
            margin: 0 auto;
            padding: 20px;
            background-color: rgba(0, 0, 0, 0.7); /* Semi-transparent black background for better readability */
            border-radius: 10px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.3); /* Box shadow for depth effect */
        }
        h2 {
            text-align: center;
        }
        label {
            display: block;
            margin-bottom: 10px;
        }
        select {
            width: 100%;
            padding: 8px;
            margin-bottom: 20px;
            border: none;
            border-radius: 5px;
            background-color: rgba(255, 255, 255, 0.8); /* Semi-transparent white background for better visibility */
        }
        input[type="submit"] {
            width: 100%;
            padding: 10px;
            border: none;
            border-radius: 5px;
            background-color: #4CAF50; /* Green submit button */
            color: white;
            font-weight: bold;
            cursor: pointer;
        }
        input[type="submit"]:hover {
            background-color: #45a049; /* Darker green hover effect */
        }
        p {
            text-align: center;
            margin-top: 20px;
        }
    </style>
</head>
<body>

<div class="container">

    <h2>Select District</h2>

    <%
        // Retrieve the selected state from the previous page
        String selectedState = request.getParameter("state");

        if (selectedState != null && !selectedState.isEmpty()) {
            // If a state is selected, retrieve its corresponding districts from the database
            try {
                // Load the PostgreSQL JDBC driver
                Class.forName("org.postgresql.Driver");
                
                // Establish a connection to the database
                Connection con = DriverManager.getConnection("jdbc:postgresql://localhost:5432/VYOM", "postgres", "admin");
                
                // Create a prepared statement to retrieve districts based on the selected state
                String query = "SELECT district_name FROM district_by_state WHERE state_name = ?";
                PreparedStatement pstmt = con.prepareStatement(query);
                pstmt.setString(1, selectedState);
                
                // Execute the query
                ResultSet rs = pstmt.executeQuery();
                
                // Output the district options
                out.println("<form action='processDistrict.jsp' method='post'>");
                out.println("<label for='district'>Select District:</label>");
                out.println("<select name='district' id='district'>");
                while (rs.next()) {
                    String districtName = rs.getString("district_name");
                    out.println("<option value='" + districtName + "'>" + districtName + "</option>");
                }
                out.println("</select>");
                out.println("<br>");

                // Retrieve purposes from the database
                Statement stmt = con.createStatement();
                ResultSet purposeRs = stmt.executeQuery("SELECT purpose FROM purpose");

                // Output the purpose options
                out.println("<label for='purpose'>Select Purpose:</label>");
                out.println("<select name='purpose' id='purpose'>");
                while (purposeRs.next()) {
                    String purpose = purposeRs.getString("purpose");
                    out.println("<option value='" + purpose + "'>" + purpose + "</option>");
                }
                out.println("</select>");
                out.println("<br>");
                
                out.println("<input type='submit' value='Submit'>");
                out.println("</form>");
                
                // Close the result sets, statements, and connection
                purposeRs.close();
                stmt.close();
                rs.close();
                pstmt.close();
                con.close();
                
            } catch (Exception e) {
                e.printStackTrace();
            }
        } else {
            // If no state is selected, display a message
            out.println("<p>Please select a state first.</p>");
        }
    %>

</div>

</body>
</html>
