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
    <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Nunito:wght@300;400;600;700&display=swap">
    <link href="https://fonts.googleapis.com/css2?family=Bagel+Fat+One&display=swap" rel="stylesheet">
    <style>
        body {
            margin: 0;
            padding: 0;
            display: flex;

            
        }

        .sidebar {
            width: 200px;
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
                background-image: linear-gradient(180deg,#4e73df 10%,#224abe 100%);
        }

        .user-profile {
            display: flex;
            flex-direction: column;
            align-items: center;
            padding: 10px;
            background-color: #4e73df;
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
    font-size: 14px; /* Adjust the font size as needed */
    color: #f8f9fa;
    text-decoration: none;
    padding: 8px 10px; /* Adjust the padding as needed */
    display: block;
    transition: background-color 0.2s ease;
}

        .sidebar a:hover {
            background-color: #4e73df;
        }

        .sidebar .material-icons {
            font-size: 16px;
            vertical-align: middle;
            margin-right: 8px;
        }

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

    .sidebar-closed {
        width: 0;
    }

    .content-expanded {
        margin-left: 60px;
    }

.menu-items {
    margin-top: 0px; /* Adjust the margin-top value as needed */
    padding-left: 0; /* Reset the default padding for the list */
}

.sidebar-closed .menu-items {
    display: none; /* Hide menu items when sidebar is closed */
}
    .menu-items li {
        margin-bottom: 10px;
    }

    .menu-items a {
        padding: 10px;
        display: block;
        transition: background-color 0.2s ease;
    }
    /* Styling for the close sidebar button */
.toggle-btn-close {
    position: absolute;
    top: 50%; /* 위치 중앙에 맞추기 위해 top 값을 조정 */
    left: 50%; /* 위치 중앙에 맞추기 위해 left 값을 조정 */
    transform: translate(-50%, -50%); /* 중앙 정렬 */
    border: 0px solid #f8f9fa; /* 테두리 추가 */
    
    border-radius: 50%; /* 원 모양의 버튼을 위한 테두리 반경 설정 */
        background-color: rgba(255,255,255,.2);
    color: #f8f9fa;
    padding: 10px;
    font-size: 16px;
    cursor: pointer;
} 

    .sidebar-open {
        position: fixed; /* "absolute" 대신 "fixed"로 변경합니다 */

    }

    .toggle-btn-open {
        background-color: #fff0;
        border: none;
        color: #black;
        padding: 10px;
        font-size: 16px;
        cursor: pointer;

    }
    .sidebar-content-wrapper {
    display: flex;
    transition: margin-left 0.3s ease-in-out;
    font-family: 'Bagel Fat One', cursive;
}

.sidebar-closed .sidebar {
    width: 0;
}

.sidebar-closed .content {
    margin-left: 0;
}
/* Styling for separator lines */
.menu-items .separator {
  border: 0;

    border-top: 1px solid rgba(255,255,255,.15);
  /* background-image: linear-gradient(to right, rgba(0, 0, 0, 0), rgba(0, 0, 0, 0.75), rgba(0, 0, 0, 0)); */
}
.separator{
  border: 0;

    border-top: 1px solid rgba(255,255,255,.15);
  /* background-image: linear-gradient(to right, rgba(0, 0, 0, 0), rgba(0, 0, 0, 0.75), rgba(0, 0, 0, 0)); */
}
.sidebar-brand {
    display: flex;
    align-items: center;
    justify-content: center;
    padding: 20px 15px; /* Adjust the padding as needed */

    color: #f8f9fa;
    text-decoration: none;
    font-weight: bold;
}
.sidebar .sidebar-heading {
    text-align: left;
    padding: 0 1rem;
    font-weight: 800;
    font-size: .65rem;
    color: #ffffff9e;
    font-family: 'Nunito', sans-serif;
}
.logout{
font-family: 'Nunito', sans-serif;
}
/* Styling for the logo emoji */
.logo-emoji {
    font-size: 24px; /* Adjust the font size as needed */
    margin-right: 10px; /* Adjust the margin as needed */
}

/* Adjusted font size for the logo text */
.sidebar-brand div:nth-child(2) {
    font-size: 18px; /* Adjust the font size as needed */
                font-family: 'Nunito', sans-serif;
}

    </style>
</head>

<body class="body2">
<div class="sidebar-content-wrapper">
<div class="sidebar">


<ul class="menu-items">

<li>
    <a class="sidebar-brand d-flex align-items-center justify-content-center" href="/main">
        <div>
            <span class="logo-emoji">👻</span> <!-- Replace with the emoji you want to use -->
        </div>
        <div>HeNoAIRock</div>
    </a>
    </li>
    <li class="separator"><a href="/main"><i class="material-icons">home</i> 홈</a></li>
    <li></li> <!-- Separator line -->
    <li><a href="/mypage"><i class="material-icons">person</i> 마이페이지</a></li>
    <li></li> <!-- Separator line -->
    <li><a href="/music/music_rank"><i class="material-icons">&#xE01D;</i> 음악 순위</a></li>
    <li></li> <!-- Separator line -->
    <li><a href="/post"><i class="material-icons">forum</i> 게시판</a></li>
    <li class="separator"></li> <!-- Separator line -->
                <div class="sidebar-heading">
                SETTING
            </div>
    <li><a href="/setting"><i class="material-icons">&#xE8B8;</i> 설정</a></li>
    <!-- Additional menu items can be added here -->
</br></br></br>    
    
    <li>
    <button class="toggle-btn toggle-btn-close" onclick="toggleSidebar()">
        <i class="material-icons" id="toggleIconClose">chevron_left</i>
    </button>
</li>

    
</ul>

    <!-- User profile section -->
<div class="user-profile" id="userProfileSection">
    <% if (userLoggedIn) { %>
        <img src="<%= userImageUrl %>" alt="User Profile Image">
        <span>${sessionScope.user.userId}</span>
        <!-- Show Logout button when user is logged in -->
        <a class="nav-link separator logout" data-toggle="modal" data-target="#logoutModal" style="cursor: pointer;">Logout
        <i class="material-icons">logout</i>
        </a>
    <% } else { %>
        <a class="nav-link" href="/member/login">Login
        <i class="material-icons">login</i>
        </a>
    <% } %>
</div>
</div>
    <div class="content">
</div>
</div>
<div class="sidebar-open">
    <button class="toggle-btn toggle-btn-open" onclick="toggleSidebar()">
        <i class="material-icons" id="toggleIconOpen">arrow_forward_ios</i>
    </button>
</div>

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

<script>
    const sidebar = document.querySelector('.sidebar');
    const content = document.querySelector('.content');
    const menuItems = document.querySelector('.menu-items');
    const userProfileSection = document.getElementById('userProfileSection');
    const toggleIconClose = document.getElementById('toggleIconClose');
    const toggleIconOpen = document.getElementById('toggleIconOpen');

    function openSidebar() {
        sidebar.classList.remove('sidebar-closed');
        content.classList.remove('content-expanded');
        userProfileSection.style.display = 'block';
        menuItems.style.display = 'block';
        toggleIconClose.textContent = 'arrow_back_ios';
        sidebar.style.width = '223px';
        toggleIconOpen.style.display = 'none';

        sidebar.classList.add('sidebar-open');

        document.body.style.overflow = 'auto';
    }

    function closeSidebar() {
        sidebar.classList.add('sidebar-closed');
        content.classList.add('content-expanded');
        userProfileSection.style.display = 'none';
        menuItems.style.display = 'none';
        toggleIconClose.textContent = '';
        sidebar.style.width = '0';
        toggleIconOpen.style.display = 'block';

        document.body.style.overflow = 'auto';
    }

    function toggleSidebar() {
        if (sidebar.classList.contains('sidebar-closed')) {
            openSidebar();
        } else {
            closeSidebar();
        }
    }
    
    function checkScreenWidth() {
        if (window.innerWidth <= 767) {
            closeSidebar();
        } else {
            openSidebar();
        }
    }
    
    checkScreenWidth();

    window.addEventListener('resize', checkScreenWidth);
</script>

<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.3/dist/umd/popper.min.js"></script>
</body>

</html>