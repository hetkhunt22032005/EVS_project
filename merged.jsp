 <%@ page import="java.sql.*" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Select State and District</title>
    <script>
        function getDistricts() {
            var stateName = document.getElementById("state").value;
            var xhr = new XMLHttpRequest();
            xhr.open("GET", "getDistricts.jsp?stateName=" + stateName, true);
            xhr.onreadystatechange = function () {
                if (xhr.readyState == 4 && xhr.status == 200) {
                    document.getElementById("districtOptions").innerHTML = xhr.responseText;
                }
            };
            xhr.send();
        }
    </script>
</head>
<body>

<h2>Select State and District</h2>

<form action="processDistrict.jsp" method="post">
    <label for="state">Select State:</label>
    <select name="state" id="state" onchange="getDistricts()">
        <option value="">Select State</option>
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
                
                // Close the result set and statement
                rs.close();
                stmt.close();
                con.close();
                
            } catch(Exception e) {
                e.printStackTrace();
            }
        %>
    </select>
    <br><br>

    <label for="district">Select District:</label>
    <div id="districtOptions"></div>
    <br><br>
    
    <label for="purpose">Select Purpose:</label>
    <select name="purpose" id="purpose">
        <option value="">Select Purpose</option>
        <% 
            try {
                // Load the PostgreSQL JDBC driver
                Class.forName("org.postgresql.Driver");
                
                // Establish a connection to the database
                Connection con = DriverManager.getConnection("jdbc:postgresql://localhost:5432/VYOM", "postgres", "admin");
                
                // Create a statement
                Statement stmt = con.createStatement();
                
                // Execute a query to retrieve purposes from the Purpose table
                ResultSet rs = stmt.executeQuery("SELECT purpose FROM Purpose");
                
                // Iterate through the result set and populate the dropdown menu
                while(rs.next()) {
                    String purpose = rs.getString("purpose");
        %>
                    <option value="<%= purpose %>"><%= purpose %></option>
        <%
                }
                
                // Close the result set and statement
                rs.close();
                stmt.close();
                con.close();
                
            } catch(Exception e) {
                e.printStackTrace();
            }
        %>
    </select>
    <br><br>

    <input type="submit" value="Submit">
</form>

</body>
</html>
 