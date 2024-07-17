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
                    document.getElementById("district").innerHTML = xhr.responseText;
                }
            };
            xhr.send();
        }
    </script>
</head>
<body>

<h2>Select State and District</h2>

<form action="processSelection.jsp" method="post">
    <label for="state">Select State:</label>
    <select name="state" id="state" onchange="getDistricts()">
        <option value="">Select State</option>
        <% 
            try {
                Class.forName("org.postgresql.Driver");
                Connection con = DriverManager.getConnection("jdbc:postgresql://localhost:5432/VYOM");
                Statement stmt = con.createStatement();
                ResultSet rs = stmt.executeQuery("SELECT state_name FROM State");
                while(rs.next()) {
                    String stateName = rs.getString("state_name");
        %>
                    <option value="<%= stateName %>"><%= stateName %></option>
        <%
                }
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
    <select name="district" id="district">
        <option value="">Select District</option>
    </select>
    <br><br>

    <input type="submit" value="Submit">
</form>

</body>
</html>
