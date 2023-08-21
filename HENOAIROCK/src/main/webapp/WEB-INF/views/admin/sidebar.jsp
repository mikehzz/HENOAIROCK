<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%
    // Assuming you have a mechanism to retrieve user information
    String userImageUrl = "https://cdn.class101.net/images/42c9cf0f-97aa-4a07-8833-8ee146daa2a0/1920xauto.webp"; // Replace with the actual image URL
    String username = "JohnDoe"; // Replace with the actual username

    boolean userLoggedIn = session.getAttribute("userLoggedIn") != null && (Boolean) session.getAttribute("userLoggedIn");
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
        body {
            margin: 0;
            padding: 0;
            display: flex;
            font-family: Arial, sans-serif;
        }

        .sidebar {
            width: 250px;
            position: fixed;
            display: flex;
            flex-direction: column;
            justify-content: space-between;
            top: 0;
            left: 0;
            height: 100%;
            background-color: #343a40;
            padding-top: 20px;
            transition: width 0.3s ease-in-out;
            z-index: 1;
        }

        .user-profile {
            display: flex;
            flex-direction: column;
            align-items: center;
            padding: 10px;
            background-color: #495057;
            width: 100%;
        }

        .user-profile img {
            width: 50px;
            height: 50px;
            border-radius: 10px;
            margin-bottom: 5px;
        }

        .user-profile span {
            color: #f8f9fa;
            font-size: 14px;
        }

        .content {

            padding: 20px;
            margin-left: 250px;
            transition: margin-left 0.3s ease-in-out;
        }

        /* 작은 화면에서의 스타일 조정 */
        @media screen and (max-width: 767px) {
            .sidebar {
                width: 60px;
            }

            .content {
                margin-left: 60px;
            }
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
            transition: background-color 0.2s ease;
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
            display: none;
        }
        /* Styling for the logout button */
.logout-button {
    padding: 8px 16px;
    background-color: #dc3545;
    color: #fff;
    border: none;
    border-radius: 5px;
    transition: background-color 0.2s ease;
    cursor: pointer;
    text-decoration: none;
}

.logout-button:hover {
    background-color: #c82333;
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
        <li><a href="/music/music_rank"><i class="material-icons">&#xE01D;</i> 음악 순위</a></li>
        <li><a href="/post"><i class="material-icons">forum</i> 게시판</a></li>
        <li><a href="/setting"><i class="material-icons">&#xE8B8;</i> 설정</a></li>
        <!-- Additional menu items can be added here -->
    </ul>
    <!-- User profile section -->
<div class="user-profile" id="userProfileSection">
    <% if (userLoggedIn) { %>
        <img src="<%= userImageUrl %>" alt="User Profile Image">
        <span>${sessionScope.user.userId}</span>
        <!-- Show Logout button when user is logged in -->
        <a class="nav-link" data-toggle="modal" data-target="#logoutModal" style="cursor: pointer;">Logout</a>
    <% } else { %>
        <a class="nav-link" href="/member/login">Login</a>
    <% } %>
</div>
</div>
    <div class="content">
</div>

<!-- Logout Confirmation Modal -->
<div class="modal fade" id="logoutModal" tabindex="-1" role="dialog" aria-labelledby="logoutModalLabel" aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered" role="document">
        <div class="modal-content">
            <div class="modal-header bg-secondary text-white">
                <h5 class="modal-title" id="logoutModalLabel" style="font-family: Arial, sans-serif; font-size: 18px;">로그아웃 확인</h5>
                <button type="button" class="close text-white" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
                <p class="lead" style="font-size: 16px;">로그아웃 하시겠습니까?</p>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-dismiss="modal" style="font-size: 14px;">취소</button>
                <a class="btn btn-danger" href="/member/logout" style="font-size: 14px;">로그아웃</a>
            </div>
        </div>
    </div>
</div>



<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.3/dist/umd/popper.min.js"></script>
</body>

</html>