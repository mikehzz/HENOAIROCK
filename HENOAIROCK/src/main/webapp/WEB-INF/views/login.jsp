<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib  prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="CP" value="${pageContext.request.contextPath }"/>  
<!DOCTYPE html>
<html>
<head>
<meta charset="${encoding}">
<meta name="viewport" content="width=device-width, initial-scale=1">
<!-- CSS only -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
<!-- JavaScript Bundle with Popper -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4" crossorigin="anonymous"></script>
<script src="${CP}/resources/js/jquery-3.7.0.js"></script>
<script src="${CP}/resources/js/util.js"></script>
<script src="${CP}/resources/js/login.js"></script>
<title>로그인</title>
<link rel="stylesheet" type="text/css" href="/resources/css/login.css">
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
          <label> <input type="text" placeholder="아이디" class="size" id="email" name="email">
          
          </label>

          <!-- Password -->
          <p class="input-title">Password</p>
          <label> <input type="text" placeholder="비밀번호" class="size" id="passwd" name="passwd">
            <!-- <input type="submit" value="확인"> -->
          </label>


        
        <input type="submit" value="로그인" class="btn" id="fn_email" name="fn_email">
          <div class="hr-sect">또는</div>
        <hr>
        </form>

        <p>
          <input type="submit" value="구글 로그인" class="btn01">
        </p>
      </div>
    </div>
  </div>
</body>
</html>