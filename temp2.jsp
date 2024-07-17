<%@ page import="java.sql.*" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Select State</title>
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

    <h2>Select State</h2>

    <form action="processSelection.jsp" method="post">
       
        <select name="state" id="state">
            <% 
                try {
                    // Load the PostgreSQL JDBC driver
                    Class.forName("org.postgresql.Driver");
                    
                    // Establish a connection to the database
                    Connection con = DriverManager.getConnection("jdbc:postgresql://localhost:5432/VYOM", "postgres", "admin");
                    
                    // Create a statement
                    Statement stmt = con.createStatement();
                    
                    // Execute a query to retrieve state names from the State table
                    ResultSet rs = stmt.executeQuery("SELECT state_name FROM State");
                    
                    // Iterate through the result set and populate the dropdown menu
                    while(rs.next()) {
                        String stateName = rs.getString("state_name");
            %>
                        <option value="<%= stateName %>"><%= stateName %></option>
            <%
                    }
                    
                    // Close the result set, statement, and connection
                    rs.close();
                    stmt.close();
                    con.close();
                    
                } catch(Exception e) {
                    e.printStackTrace();
                }
            %>
        </select>
        
        <input type="submit" value="Submit">
    </form>

</div>

</body>
</html>
