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
                background-image: linear-gradient(180deg,#000000 10%,#001a65 100%)
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
    <!-- Topbar -->
                <nav class="navbar navbar-expand navbar-light bg-white topbar mb-4 static-top shadow">

                    <!-- Sidebar Toggle (Topbar) -->
                    <button id="sidebarToggleTop" class="btn btn-link d-md-none rounded-circle mr-3">
                        <i class="fa fa-bars"></i>
                    </button>

                    <!-- Topbar Search -->
                    <form
                        class="d-none d-sm-inline-block form-inline mr-auto ml-md-3 my-2 my-md-0 mw-100 navbar-search">
                        <div class="input-group">
                            <input type="text" class="form-control bg-light border-0 small" placeholder="Search for..."
                                aria-label="Search" aria-describedby="basic-addon2">
                            <div class="input-group-append">
                                <button class="btn btn-primary" type="button">
                                    <i class="fas fa-search fa-sm"></i>
                                </button>
                            </div>
                        </div>
                    </form>

                    <!-- Topbar Navbar -->
                    <ul class="navbar-nav ml-auto">

                        <!-- Nav Item - Search Dropdown (Visible Only XS) -->
                        <li class="nav-item dropdown no-arrow d-sm-none">
                            <a class="nav-link dropdown-toggle" href="#" id="searchDropdown" role="button"
                                data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                <i class="fas fa-search fa-fw"></i>
                            </a>
                            <!-- Dropdown - Messages -->
                            <div class="dropdown-menu dropdown-menu-right p-3 shadow animated--grow-in"
                                aria-labelledby="searchDropdown">
                                <form class="form-inline mr-auto w-100 navbar-search">
                                    <div class="input-group">
                                        <input type="text" class="form-control bg-light border-0 small"
                                            placeholder="Search for..." aria-label="Search"
                                            aria-describedby="basic-addon2">
                                        <div class="input-group-append">
                                            <button class="btn btn-primary" type="button">
                                                <i class="fas fa-search fa-sm"></i>
                                            </button>
                                        </div>
                                    </div>
                                </form>
                            </div>
                        </li>

                        <!-- Nav Item - Alerts -->
                        <li class="nav-item dropdown no-arrow mx-1">
                            <a class="nav-link dropdown-toggle" href="#" id="alertsDropdown" role="button"
                                data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                <i class="fas fa-bell fa-fw"></i>
                                <!-- Counter - Alerts -->
                                <span class="badge badge-danger badge-counter">3+</span>
                            </a>
                            <!-- Dropdown - Alerts -->
                            <div class="dropdown-list dropdown-menu dropdown-menu-right shadow animated--grow-in"
                                aria-labelledby="alertsDropdown">
                                <h6 class="dropdown-header">
                                    Alerts Center
                                </h6>
                                <a class="dropdown-item d-flex align-items-center" href="#">
                                    <div class="mr-3">
                                        <div class="icon-circle bg-primary">
                                            <i class="fas fa-file-alt text-white"></i>
                                        </div>
                                    </div>
                                    <div>
                                        <div class="small text-gray-500">December 12, 2019</div>
                                        <span class="font-weight-bold">A new monthly report is ready to download!</span>
                                    </div>
                                </a>
                                <a class="dropdown-item d-flex align-items-center" href="#">
                                    <div class="mr-3">
                                        <div class="icon-circle bg-success">
                                            <i class="fas fa-donate text-white"></i>
                                        </div>
                                    </div>
                                    <div>
                                        <div class="small text-gray-500">December 7, 2019</div>
                                        $290.29 has been deposited into your account!
                                    </div>
                                </a>
                                <a class="dropdown-item d-flex align-items-center" href="#">
                                    <div class="mr-3">
                                        <div class="icon-circle bg-warning">
                                            <i class="fas fa-exclamation-triangle text-white"></i>
                                        </div>
                                    </div>
                                    <div>
                                        <div class="small text-gray-500">December 2, 2019</div>
                                        Spending Alert: We've noticed unusually high spending for your account.
                                    </div>
                                </a>
                                <a class="dropdown-item text-center small text-gray-500" href="#">Show All Alerts</a>
                            </div>
                        </li>

                        <!-- Nav Item - Messages -->
                        <li class="nav-item dropdown no-arrow mx-1">
                            <a class="nav-link dropdown-toggle" href="#" id="messagesDropdown" role="button"
                                data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                <i class="fas fa-envelope fa-fw"></i>
                                <!-- Counter - Messages -->
                                <span class="badge badge-danger badge-counter">7</span>
                            </a>
                            <!-- Dropdown - Messages -->
                            <div class="dropdown-list dropdown-menu dropdown-menu-right shadow animated--grow-in"
                                aria-labelledby="messagesDropdown">
                                <h6 class="dropdown-header">
                                    Message Center
                                </h6>
                                <a class="dropdown-item d-flex align-items-center" href="#">
                                    <div class="dropdown-list-image mr-3">
                                        <img class="rounded-circle" src="img/undraw_profile_1.svg"
                                            alt="...">
                                        <div class="status-indicator bg-success"></div>
                                    </div>
                                    <div class="font-weight-bold">
                                        <div class="text-truncate">Hi there! I am wondering if you can help me with a
                                            problem I've been having.</div>
                                        <div class="small text-gray-500">Emily Fowler · 58m</div>
                                    </div>
                                </a>
                                <a class="dropdown-item d-flex align-items-center" href="#">
                                    <div class="dropdown-list-image mr-3">
                                        <img class="rounded-circle" src="img/undraw_profile_2.svg"
                                            alt="...">
                                        <div class="status-indicator"></div>
                                    </div>
                                    <div>
                                        <div class="text-truncate">I have the photos that you ordered last month, how
                                            would you like them sent to you?</div>
                                        <div class="small text-gray-500">Jae Chun · 1d</div>
                                    </div>
                                </a>
                                <a class="dropdown-item d-flex align-items-center" href="#">
                                    <div class="dropdown-list-image mr-3">
                                        <img class="rounded-circle" src="img/undraw_profile_3.svg"
                                            alt="...">
                                        <div class="status-indicator bg-warning"></div>
                                    </div>
                                    <div>
                                        <div class="text-truncate">Last month's report looks great, I am very happy with
                                            the progress so far, keep up the good work!</div>
                                        <div class="small text-gray-500">Morgan Alvarez · 2d</div>
                                    </div>
                                </a>
                                <a class="dropdown-item d-flex align-items-center" href="#">
                                    <div class="dropdown-list-image mr-3">
                                        <img class="rounded-circle" src="https://source.unsplash.com/Mv9hjnEUHR4/60x60"
                                            alt="...">
                                        <div class="status-indicator bg-success"></div>
                                    </div>
                                    <div>
                                        <div class="text-truncate">Am I a good boy? The reason I ask is because someone
                                            told me that people say this to all dogs, even if they aren't good...</div>
                                        <div class="small text-gray-500">Chicken the Dog · 2w</div>
                                    </div>
                                </a>
                                <a class="dropdown-item text-center small text-gray-500" href="#">Read More Messages</a>
                            </div>
                        </li>

                        <div class="topbar-divider d-none d-sm-block"></div>

                        <!-- Nav Item - User Information -->
                        <li class="nav-item dropdown no-arrow">
                            <a class="nav-link dropdown-toggle" href="#" id="userDropdown" role="button"
                                data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                <span class="mr-2 d-none d-lg-inline text-gray-600 small">Douglas McGee</span>
                                <img class="img-profile rounded-circle"
                                    src="img/undraw_profile.svg">
                            </a>
                            <!-- Dropdown - User Information -->
                            <div class="dropdown-menu dropdown-menu-right shadow animated--grow-in"
                                aria-labelledby="userDropdown">
                                <a class="dropdown-item" href="#">
                                    <i class="fas fa-user fa-sm fa-fw mr-2 text-gray-400"></i>
                                    Profile
                                </a>
                                <a class="dropdown-item" href="#">
                                    <i class="fas fa-cogs fa-sm fa-fw mr-2 text-gray-400"></i>
                                    Settings
                                </a>
                                <a class="dropdown-item" href="#">
                                    <i class="fas fa-list fa-sm fa-fw mr-2 text-gray-400"></i>
                                    Activity Log
                                </a>
                                <div class="dropdown-divider"></div>
                                <a class="dropdown-item" href="#" data-toggle="modal" data-target="#logoutModal">
                                    <i class="fas fa-sign-out-alt fa-sm fa-fw mr-2 text-gray-400"></i>
                                    Logout
                                </a>
                            </div>
                        </li>

                    </ul>

                </nav>
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