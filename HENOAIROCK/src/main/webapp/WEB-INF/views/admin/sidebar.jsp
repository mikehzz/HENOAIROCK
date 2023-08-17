<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%
    // Assuming you have a mechanism to retrieve user information
    String userImageUrl = "https://cdn.class101.net/images/42c9cf0f-97aa-4a07-8833-8ee146daa2a0/1920xauto.webp"; // Replace with the actual image URL
    String username = "JohnDoe"; // Replace with the actual username

    // ... (other code) ...
%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Sidebar</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
    <style>
        body2 {
            margin: 0;
            padding: 0;
            display: flex;
            font-family: Arial, sans-serif;
        }

        .sidebar {
            height: 100%;
            width: 250px;
            position: fixed;
    display: flex;
    flex-direction: column;
    justify-content: space-between;
            top: 0;
            left: 0;
            background-color: #343a40;
            padding-top: 20px;
            transition: width 0.3s ease-in-out; /* Add smooth width transition */
        }
        .user-profile {
            display: flex;
            flex-direction: column;
            align-items: center;
            padding: 10px;
            background-color: #495057;
            width: 100%; /* Set the width to 100% */
        }

        .user-profile img {
            width: 50px;
            height: 50px;
            border-radius: 10px; /* Change border-radius to create a square shape */
            margin-bottom: 5px;
        }

.user-profile span {
    color: #f8f9fa;
    font-size: 14px;
}
        .content {
            margin-left: 250px;
            padding: 20px;
        }

        .sidebar ul {
            list-style: none;
            padding: 0;
        }

        .sidebar li {
            margin-bottom: 10px;
        }

        .sidebar a {
            color: #f8f9fa;
            text-decoration: none;
            padding: 10px;
            display: block;
            transition: background-color 0.2s ease; /* Add smooth background color transition */
        }

        .sidebar a:hover {
            background-color: #495057;
        }

        .sidebar .material-icons {
            font-size: 24px;
            vertical-align: middle;
            margin-right: 8px;
        }

        .toggle-btn {
            background-color: #343a40;
            border: none;
            color: #f8f9fa;
            padding: 10px;
            cursor: pointer;
            font-size: 16px;
            display: none; /* Hide on large screens */
        }

@media screen and (max-width:1023px) {
    .sidebar {
        width: 60px;
    }
}
@media screen and (max-width:560px) {
    .sidebar #expand-menu:not(:checked) ~ ul {
        display: none;
    }
}
    </style>
</head>

<body class="body2">

<div class="sidebar">
    <button class="toggle-btn" onclick="toggleSidebar()">
        <i class="material-icons">&#xe5d2;</i>
    </button>
    <ul>
        <li><a href="#"><i class="material-icons">home</i> 홈</a></li>
        <li><a href="/mypage"><i class="material-icons">person</i> 마이페이지</a></li>
        <li><a href="/post"><i class="material-icons">forum</i> 게시판</a></li>
        <li><a href="#"><i class="material-icons">&#128295;</i> 설정</a></li>
        <!-- Additional menu items can be added here -->
    </ul>
    <!-- User profile section -->
    <div class="user-profile">
        <img src="<%= userImageUrl %>" alt="User Profile Image">
        <span >${sessionScope.user.userId}</span>
    </div>
</div>
    <div class="content">
</div>

</body>

</html>