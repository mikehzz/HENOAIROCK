<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <title>Admin Dashboard</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.1/css/all.min.css">
    <link rel="stylesheet" type="text/css" href="/resources/css/admin/admin_dashboard.css">
</head>
<body>

<nav class="navbar navbar-expand-lg navbar-dark bg-dark">
    <div class="container">
        <a class="navbar-brand" href="/admin/dashboard">Admin Dashboard</a>
        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarNav">
            <ul class="navbar-nav ml-auto">
                <c:choose>
                    <c:when test="${empty loggedInAdmin}">
                        <li class="nav-item">
                            <a class="nav-link" href="/admin/login">Login</a>
                        </li>
                    </c:when>
                    <c:otherwise>
                        <li class="nav-item active">
                            <span class="nav-link">Welcome, ${loggedInAdmin.userId}!</span>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="/admin/logout">Logout</a>
                        </li>
                    </c:otherwise>
                </c:choose>
            </ul>
        </div>
    </div>
</nav>

<div class="container mt-4">
    <div class="row">
        <div class="col-md-4">
            <div class="card">
                <div class="card-body text-center">
                    <h5 class="card-title"><i class="fas fa-users"></i> User Management</h5>
                    <p class="card-text">Manage and ban users.</p>
                    <a href="/admin/users" class="btn btn-primary" onclick="return checkAdminLogin()">Go to User List</a>
                </div>
            </div>
        </div>
        <div class="col-md-4">
            <div class="card">
                <div class="card-body text-center">
                    <h5 class="card-title"><i class="fas fa-newspaper"></i> 게시판 관리</h5>
                    <p class="card-text">게시판</p>
                    <a href="/admin/post" class="btn btn-primary" onclick="return checkAdminLogin()">Go to GaeSiPan</a>
                </div>
            </div>
        </div>
    </div>
</div>

<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.1/dist/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
<script src="/resources/js/admin/admin_dashboard.js"></script>
</body>
</html>
