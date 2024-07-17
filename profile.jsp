<%@ page import="java.time.LocalDate, java.time.format.DateTimeFormatter" %>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Welcome Page</title>
<style>
    body {
        background-image: url('background.jpg'); /* Background image */
        background-size: cover; /* Cover the entire viewport */
        font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
        margin: 0;
        padding: 0;
    }
    .container {
        max-width: 600px;
        margin: 50px auto;
        padding: 20px;
        background-color: rgba(224, 204, 179, 0.7); /* Light tan background with transparency */
        border-radius: 10px;
        box-shadow: 0 0 15px rgba(0, 0, 0, 0.2); /* Soft shadow */
        text-align: center;
        position: relative;
    }
    .welcome-message {
        font-size: 32px;
        font-weight: bold;
        color: #3d2800; /* Dark brown color */
        margin-bottom: 20px;
    }
    .profile-link {
        background-color: #704214; /* Dark brown background */
        color: #ffffff; /* White text color */
        border: none;
        padding: 12px 24px;
        border-radius: 25px;
        text-decoration: none;
        transition: background-color 0.3s ease; /* Smooth transition */
        margin: 10px;
        width: 200px; /* Set button width */
    }
    .profile-link:hover {
        background-color: #956d47; /* Darker brown on hover */
    }
    .logout-button {
        position: fixed;
        top: 20px;
        right: 20px;
        background-color: #704214; /* Dark brown background */
        color: #ffffff; /* White text color */
        border: none;
        padding: 12px 24px;
        border-radius: 25px;
        cursor: pointer;
        transition: background-color 0.3s ease; /* Smooth transition */
        width: 200px; /* Set button width */
    }
    .logout-button:hover {
        background-color: #956d47; /* Darker brown on hover */
    }
    .task-box {
        margin-top: 70px;
        position: fixed;
        top: 20px;
        right: 20px;
        width: 200px; /* Adjust width as needed */
        height: 80px; /* Adjust height as needed */
        background-color: #e6f7ff;
        border-radius: 10px;
        padding: 10px;
        box-shadow: 0 0 10px rgba(0, 0, 0, 0.2); /* Soft shadow */
        text-align: center;
        overflow: hidden;
        width: 300px; /* Set box width */
    }
</style>
</head>
<body>

<%
    LocalDate currentDate = LocalDate.now();
    DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd");
    String todayDate = currentDate.format(formatter);
    
    boolean ans = false;
    Integer id1 = null; // Initialize id variable outside try block

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
                int taskId = rs.getInt("taskid");
                if (taskDate.equalsIgnoreCase(todayDate)) {
                    ans = true;
                    // Store the matched task ID in a variable accessible outside the try block
                    id1 = taskId;
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

    if (ans && id1 != null) {
        try {
            Class.forName("org.postgresql.Driver");
            try (Connection conn = DriverManager.getConnection(url, username, password);
                 PreparedStatement pstmt = conn.prepareStatement("SELECT task, day_name FROM special_day_tasks WHERE taskid = ?");
            ) {
                pstmt.setInt(1, id1);
                ResultSet rs = pstmt.executeQuery();
                while (rs.next()) {
                    String fileName = rs.getString("task");
                    String dayName = rs.getString("day_name");
%>                    

                     <div class="task-box">
                        <% out.println("Happy " + dayName); %><br> 
                        <a href='xyz.jsp'>Complete <%= dayName %> task</a><br>
                    </div>
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
    } else {
        
    }
%>

<%
      currentDate = LocalDate.now();
      formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd");
      todayDate = currentDate.format(formatter);
    
      ans = false;
      id1 = null; // Initialize id variable outside try block

      url = "jdbc:postgresql://localhost:5432/EVS";
      username = "postgres";
      password = "admin";
      sql = "SELECT taskid, task_date FROM daily_tasks";

    try {
        Class.forName("org.postgresql.Driver");
        try (Connection conn = DriverManager.getConnection(url, username, password);
             PreparedStatement pstmt = conn.prepareStatement(sql);
             ResultSet rs = pstmt.executeQuery()) {
            
            // Iterate over the result set and display task dates
            while (rs.next()) {
                String taskDate = rs.getString("task_date");
                int taskId = rs.getInt("taskid");
                if (taskDate.equalsIgnoreCase(todayDate)) {
                    ans = true;
                    // Store the matched task ID in a variable accessible outside the try block
                    id1 = taskId;
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

    if (ans && id1 != null) {
        try {
            Class.forName("org.postgresql.Driver");
            try (Connection conn = DriverManager.getConnection(url, username, password);
                 PreparedStatement pstmt = conn.prepareStatement("SELECT task, day_name FROM daily_tasks WHERE taskid = ?");
            ) {
                pstmt.setInt(1, id1);
                ResultSet rs = pstmt.executeQuery();
                while (rs.next()) {
                    String fileName = rs.getString("task");
                    String dayName = rs.getString("day_name");
%>
                     <div style="margin-top: 300px;" class="task-box">
                        <% out.println("Happy A Good Day...!!" ); %><br> 
                        <a href='xyzp.jsp'>Complete <%= dayName %> task</a><br>
                    </div>
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
    } else {
        
    }
%>

<%
 
%>
<%-- Retrieve user ID from session or request --%>
<%
    int id = Integer.parseInt(request.getSession().getAttribute("userID").toString()); // Assuming userID is stored in session
     String Name = request.getSession().getAttribute("f_name").toString();
%>
<% 
      ans = false;
      url = "jdbc:postgresql://localhost:5432/EVS";
         username = "postgres";
      password = "admin";
      sql = "SELECT birthdate FROM users WHERE id = ?";
    
    try {
        Class.forName("org.postgresql.Driver");
        try (Connection conn = DriverManager.getConnection(url, username, password);
             PreparedStatement pstmt = conn.prepareStatement(sql)) {
                
            pstmt.setInt(1, id);
            try (ResultSet rs = pstmt.executeQuery()) {
                // Iterate over the result set and check if the birthdate matches today's date
                while (rs.next()) {
                    String bdate = rs.getString("birthdate");
                    if (bdate.substring(5, 10).equalsIgnoreCase(todayDate.substring(5,10))) {

                        ans = true;
                    }
                }
            }
        }
        catch (SQLException e) {
            // Handle database errors
            e.printStackTrace();
        }
    }
    catch (ClassNotFoundException e) {
        // Handle class not found exception
        e.printStackTrace();
    }
%>


<ul class="task-list">
    <% if (ans) { %>
        <div style="margin-top: 187px;" class="task-box">
            <li><%= "Happy birthday Mr. " + Name %></li>
            <a href='bday.jsp'>Complete Birthday task</a><br>
        </div>
    
</ul>

        
    <% }  %>
 
</ul>

<div class="container">
    <div class="welcome-message">Welcome paryavarn-premi...!!</div>
    <div>
        <p>${f_name} ${m_name} ${l_name}</p>
        <form action="dispimg" method="post">
            <input type="submit" class="profile-link" value="Show Your Profile">
        </form>
        <form action="delprofile.jsp" method="post">
            <input type="submit" class="profile-link" value="Delete Your Account">
        </form>
        <form action="announcement.jsp" method="post">
            <input type="submit" class="profile-link" value="Announcement">
        </form>
        <form action="contactus.jsp" method="post">
            <input type="submit" class="profile-link" value="Contact Us">
        </form>
        
    </div>
</div>
<button class="logout-button" onclick="logout()">Logout</button>

<script>
    function logout() {
        window.location.href = "index.jsp";
    }
</script>

</body>
</html>
