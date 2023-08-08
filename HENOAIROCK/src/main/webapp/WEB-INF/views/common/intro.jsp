<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib  prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<c:set var="CP" value="${pageContext.request.contextPath }"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<!-- CSS only -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
<!-- JavaScript Bundle with Popper -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4" crossorigin="anonymous"></script>
<script src="${CP}/resources/js/jquery-3.7.0.js"></script>
<script src="${CP}/resources/js/util.js"></script>
<title>싸그리싺싺AI 페이지</title>
<link rel="stylesheet" type="text/css" href="/resources/css/intro.css">
</head>

<body>

  <div class="wrapper">
    <h1></h1>
  </div>
  <div class="welcome-section content-hidden">
    <div class="content-wrap">
      <ul class="fly-in-text">
        <li>HE</li>
        <li>NO</li>
        <li>AI</li>
        <li>RO</li>
        <li>CK</li>
      </ul>
      <a href="#" class="enter-button">그냥 시작</a>
      <a href="/member/login" class="login-button">로그인 후 시작하기</a>
    </div>
  </div>
      <h1>싸그리싺싺AI 페이지</h1>

    <div class="chat-container">
        <div class="chat-logs" id="chatLogs">
            <div class="bot-message">싸그리싺싺AI: 안녕하세요! 무엇을 도와드릴까요?</div>
        </div>
    </div>
    <div class="user-input">
        <input type="text" id="userInput" placeholder="메시지를 입력하세요...">
        <button onclick="sendMessage()">전송&#127925;</button>
    </div>
    
    <!-- Sidebar -->
    <aside class="sidebar" id="sidebar">
        <div class="sidebar-header">
            <!-- New Chat Button -->
            <button class="new-chat-btn" onclick="openNewChat()">New Chat</button>
            <h2>GPT</h2>
            <!-- Close Sidebar Button -->
            <!-- <button class="close-btn" onclick="closeSidebar()">Close Sidebar</button> -->
        </div>
        <ul>
            <li><a href="#">홈</a></li>
            <li><a href="/mypage">마이페이지</a></li>
            <li><a href="/post">게시판</a></li>
            <li><a href="#">설정&#128540;</a></li>
        </ul>

    </aside>

  <script src="/resources/js/intro.js"></script>
</body>
</html>