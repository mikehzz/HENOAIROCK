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
<title>게시판</title>

</head>
<body>
    <table>
  <thead>
    <tr>
      <th>번호</th>
      <th>제목</th>
      <th>내용</th>
      <th>작성자</th>
      <th>날짜</th>
      <th>조회수</th>
      <th>탈퇴</th><!-- 새로운 열(칼럼)에 탈퇴 버튼 추가 -->
    </tr> 
  </thead>
  <tbody>
    <c:forEach items="${postList}" var="post">
      <tr>
         <td>${post.post_seq}</td>
         <td>${post.user_id}</td>
         <td>${post.post_title}</td>
         <td>${post.post_contents}</td>
         <td>${post.read_cnt}</td>
         <td>${post.like_cnt}</td>
         <td>
             <!-- 탈퇴 버튼 추가, 버튼을 클릭할 때 해당 게시물의 post_seq를 파라미터로 전달 -->
             <button onclick="withdraw(${post.post_seq})">탈퇴</button>
         </td>
      </tr>
    </c:forEach>
  </tbody>
</table>
    <script src="/resources/js/post.js"></script>
</body>
</html>