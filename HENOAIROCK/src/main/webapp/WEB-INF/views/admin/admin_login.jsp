<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib  prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ include file="/WEB-INF/views/admin/admin_dashboard.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<!-- CSS only -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
<!-- JavaScript Bundle with Popper -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4" crossorigin="anonymous"></script>
<script src="/resources/js/jquery-3.7.0.js"></script>
<script src="/resources/js/util.js"></script>
</head>
<body>

	<div id="con">
	    <div id="login">
	        <div id="login_form">
	            <!--로그인 폼-->
	            <form action="/admin/login" method="post">
	                <h2>관리자 로그인</h2>
	                
	                <!-- Email -->
	                <p class="input-title">Email</p>
	                <label>
	                    <input type="text" placeholder="아이디" class="size line-input" id="userId" name="userId">
	                </label>
	
	                <!-- Password -->
	                <p class="input-title">Password</p>
	                <label>
	                    <input type="password" placeholder="비밀번호" class="size line-input" id="password">
	                </label>
	
	                <!-- Changed input type from text to password for password field -->
	
	                <input type="submit" value="로그인" class="btn" id="fn_email" name="fn_email">

	            </form>
	        </div>
	    </div>
</div>
  <script src="/resources/js/admin_login.js"></script>
</body>
</html>
