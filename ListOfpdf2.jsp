<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ page import="java.util.*, java.io.File" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="ISO-8859-1">
    <title>List of PDF Files</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 20px;
            background-color: #f4f4f4;
            color: #dc3545; /* Red color for text */
        }
        .container {
            max-width: 800px;
            margin: 0 auto;
            padding: 20px;
            background-color: #e6f7ff;
            border-radius: 10px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            position: relative; /* Make the container position relative */
        }
        h2 {
            color:  #dc3545;
            text-align: center;
        }
        .pdf-block {
            margin-bottom: 20px;
            padding: 15px;
            background-color: #ffffff;
            border: 1px solid #ccc;
            border-radius: 5px;
            position: relative;
        }
        .pdf-name {
            font-weight: bold;
            color: #006400;
        }
        .delete-btn {
            position: absolute;
            top: 10px;
            right: 10px;
            background-color: #dc3545; /* Red background */
            color: #fff;
            border: none;
            padding: 5px 10px;
            border-radius: 5px;
            cursor: pointer;
            transition: background-color 0.3s;
        }
        .delete-btn:hover {
            background-color: #c82333; /* Darker red on hover */
        }
        .go-back {
            text-align: right;
            margin-top: 2px;
            margin-bottom: 40px;
        }

        .go-back a {
            display: inline-block;
            padding: 10px 20px;
            background-color: #28a745; /* Dark green background */
            color: #fff;
            text-decoration: none;
            border-radius: 5px;
            transition: background-color 0.3s;
        }

        .go-back a:hover {
            background-color: #006400; /* Darker green on hover */
        }
    </style>
</head>
<body>
    <div class="container">
        <div class="go-back">
            <a href="ad_profile.jsp">Go back</a>
        </div>
        <h2>List Of  Daily Tasks</h2> 
        <% 
            List<String> pdfFiles = (List<String>) request.getAttribute("pdfFiles");
            List<String> names = (List<String>) request.getAttribute("names");
            for (int i = 0; i < pdfFiles.size(); i++) {
                String fileName = new File(pdfFiles.get(i)).getName();
        %>
            <div class="pdf-block" style="color: #dc3545;">
                <p class="pdf-name"><%= names.get(i) %>:</p>
                <a href="images/<%= fileName %>"><%= fileName %></a>
                 
            </div>
        <% } %>
    </div>

    <script>
        function deleteFile(filePath) {
            if (confirm("Are you sure you want to delete this file?")) {
                window.location.href = "deleteFile.jsp?filePath=" + filePath;
            }
        }
    </script>
</body>
</html>
