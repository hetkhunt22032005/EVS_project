<%@ page import="java.sql.*" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Tree Selection</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            color: #333; /* Text color */
            margin: 0; /* Remove default margin */
            padding: 20px; /* Add padding for better readability */
        }
        .container {
            max-width: 800px;
            margin: 0 auto;
        }
        h2 {
            text-align: center;
            margin-bottom: 20px;
        }
        table {
            width: 100%;
            border-collapse: collapse;
            margin-bottom: 20px;
        }
        th, td {
            border: 1px solid #ddd;
            padding: 8px;
            text-align: left;
        }
        th {
            background-color: #f2f2f2;
        }
    </style>
</head>
<body>

<div class="container">
    <h2>Selected Trees</h2>

    <%
        try {
            // Step 1: Establish a connection to the database
            Connection con = DriverManager.getConnection("jdbc:postgresql://localhost:5432/VYOM", "postgres", "admin");

            // Step 2: Define the SQL query
            String sql = "WITH Trees_By_Soil AS (\n" +
                         "    SELECT stt.scientific_name\n" +
                         "    FROM Soil_To_Tree stt\n" +
                         "    JOIN Soil_By_District sbd ON stt.soil_name = sbd.soil_name\n" +
                         "    WHERE sbd.district_name = 'Los Angeles'\n" +
                         "),\n" +
                         "Ornamental_Properties AS (\n" +
                         "    SELECT height_range_lower, height_range_upper, spread_range_lower, spread_range_upper\n" +
                         "    FROM tree_properties\n" +
                         "    WHERE purpose = 'Ornamental'\n" +
                         "),\n" +
                         "Height_Filtered_Trees AS (\n" +
                         "    SELECT hht.scientific_name\n" +
                         "    FROM Has_height hht, Ornamental_Properties op\n" +
                         "    WHERE hht.height_range_lower >= op.height_range_lower AND \n" +
                         "          hht.height_range_upper <= op.height_range_upper\n" +
                         "),\n" +
                         "Spread_Filtered_Trees AS (\n" +
                         "    SELECT hst.scientific_name\n" +
                         "    FROM Has_spread hst, Ornamental_Properties op\n" +
                         "    WHERE hst.spread_range_lower >= op.spread_range_lower AND \n" +
                         "          hst.spread_range_upper <= op.spread_range_upper\n" +
                         "),\n" +
                         "Intersection_Trees AS (\n" +
                         "    SELECT scientific_name\n" +
                         "    FROM Height_Filtered_Trees\n" +
                         "    INTERSECT\n" +
                         "    SELECT scientific_name\n" +
                         "    FROM Spread_Filtered_Trees\n" +
                         "),\n" +
                         "Final_Trees AS (\n" +
                         "    SELECT scientific_name\n" +
                         "    FROM Intersection_Trees\n" +
                         "    INTERSECT\n" +
                         "    SELECT scientific_name\n" +
                         "    FROM Trees_By_Soil\n" +
                         ")\n" +
                         "SELECT t.scientific_name, t.common_name, t.environmental_benifites, t.aesthetic_values, t.water_requirements, tr.temperature_range\n" +
                         "FROM Tree t\n" +
                         "JOIN Final_Trees ft ON t.scientific_name = ft.scientific_name\n" +
                         "LEFT JOIN requires_temperature tr ON t.scientific_name = tr.scientific_name;";

            // Step 3: Execute the query
            Statement stmt = con.createStatement();
            ResultSet rs = stmt.executeQuery(sql);
    %>

    <table>
        <thead>
            <tr>
                <th>Scientific Name</th>
                <th>Common Name</th>
                <th>Environmental Benefits</th>
                <th>Aesthetic Values</th>
                <th>Water Requirements</th>
                <th>Temperature Range</th>
            </tr>
        </thead>
        <tbody>
            <% while (rs.next()) { %>
            <tr>
                <td><%= rs.getString("scientific_name") %></td>
                <td><%= rs.getString("common_name") %></td>
                <td><%= rs.getString("environmental_benifites") %></td>
                <td><%= rs.getString("aesthetic_values") %></td>
                <td><%= rs.getString("water_requirements") %></td>
                <td><%= rs.getString("temperature_range") %></td>
            </tr>
            <% } %>
        </tbody>
    </table>

    <%
            // Step 4: Close the result set, statement, and connection
            rs.close();
            stmt.close();
            con.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
    %>

</div>

</body>
</html>
