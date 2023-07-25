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
<link rel="stylesheet" type="text/css" href="/resources/css/register.css">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
<!-- JavaScript Bundle with Popper -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4" crossorigin="anonymous"></script>
<script src="${CP}/resources/js/jquery-3.7.0.js"></script>
<script src="${CP}/resources/js/util.js"></script>
<title>회원가입</title>
</head>
<body>
    <div id="con">
      <div id="login">
        <div id="login_form">
          <!--로그인 폼-->
          <form action="/member/save" method="post" id="register-form">
            <h2>회원가입</h2>
              <p class="find">
            <span><a href="/member/login">로그인 페이지로 이동</a></span>
            </p>
            
            <!--이메일-->
<!--            <input type="button" value="중복확인" class="btnRe"> -->
            <p class="input-title">E-mail</p>
            <div class="input-wrapper">
              <label> <input type="text" class="size line-input"> 

            </label>

            </div>

            <!--이메일 인증번호 입력-->
            <input type="button" value="인증번호 전송 " class="btnRe">
                        <input type="button" value="인증번호 확인 " class="btnRe">
            <p class="input-title">E-mail 인증번호 입력</p>
            <label> <input type="text" class="size line-input"> 
            
            </label>
            
            <!--비밀번호-->
            <p class="input-title">Password</p>
            <label for="password"> <input
              placeholder="비밀번호는 8이상 12자 이하로 설정바랍니다." type="password"
              class="size line-input" id="password" name="password" required>
              <span class="error-message" id="password_error"></span>
            </label>

            <!--비밀번호 확인-->
            <p class="input-title">Password확인</p>
            <label for="confirm_password"> <input type="password"
              class="size line-input" id="confirm_password" name="confirm_password"
              required oninput="validateForm()"> <span
              class="error-message" id="confirm_password_error"></span>
            </label>

            <!--이름-->
            <p class="input-title">이름</p>
            <label> <input type="text" class="size line-input" required>
            </label>
            
            <!--생년월일-->
            <p class="input-title">생년월일</p>
            <label> <input type="date" class="size line-input" required>
            </label>

            <!--이용약관동의-->
            <p class="h-zero input-title">
              이용약관동의 <span><a href="agree.html">[이용약관 자세히 읽기]</a></span>
            </p>

            <!-- 메일수신 -->
            <p class="input-chek">
              <input checked="checked" type="radio" name="agree" value="Y"
                id="m_y" required> <label for="m_y">동의</label>
              <input type="radio" name="agree" value="N" 
                id="m_n" required> <label for="m_n">비동의 (이용 불가)</label>
            </p>
            <!-- <p class="input-chek">
              <input type="radio" name="agree" value="N" id="m_n" required>
              <label for="m_n">비동의 (이용 불가)</label>
            </p> -->

            <!-- 버튼 -->
            <p>
              <input type="submit" value="Create Account" class="Creative">
            </p>
          </form>
        </div>
      </div>
    </div>
  </body>
</html>