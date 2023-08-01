<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="author" content="User">
    <title>로그인</title>
    <link rel="stylesheet" type="text/css" href="/resources/css/login.css">
 <script src="/resources/js/jquery-3.7.0.js"></script>
</head>
<body>
	<div id="con">
	    <div id="login">
	        <div id="login_form">
	            <!--로그인 폼-->
	            <form action="/member/login" method="post">
	                <h2>로그인</h2>
	
	                <p class="find">
						<span><a href="/member/passwd">비밀번호 찾기</a></span> 
						<span><a href="/member/register">회원가입</a></span>
					       </p>
	
	                <!-- Email -->
	                <p class="input-title">Email</p>
	                <label>
	                    <input type="text" placeholder="아이디" class="size line-input" id="user_id" name="user_id">
	                </label>
	
	                <!-- Password -->
	                <p class="input-title">Password</p>
	                <label>
	                    <input type="password" placeholder="비밀번호" class="size line-input" id="password">
	                </label>
	
	                <!-- Changed input type from text to password for password field -->
	
	                <input type="submit" value="로그인" class="btn" id="fn_email" name="fn_email">
	                <div class="hr-sect">또는</div>
	                <hr>
	
	                <!-- Connect with Google -->
	                <a href="#" class="social-button" id="google-connect">
	                    <span>Connect with Google</span>
	                </a>
	            </form>
	        </div>
	    </div>
</div>
  <script src="/resources/js/login.js"></script>
</body>
</html>
