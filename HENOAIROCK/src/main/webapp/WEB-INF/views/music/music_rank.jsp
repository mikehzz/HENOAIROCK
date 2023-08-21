<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib  prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="/WEB-INF/views/admin/sidebar.jsp" %>
<c:set var="CP" value="${pageContext.request.contextPath }"/>  
<!DOCTYPE html>
<html>
<head>
<meta charset="${encoding}">
<meta name="viewport" content="width=device-width, initial-scale=1">
<!-- CSS only -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
<link rel="stylesheet" type="text/css" href="/resources/css/music_rank.css">
<!-- JavaScript Bundle with Popper -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4" crossorigin="anonymous"></script>
<script src="${CP}/resources/js/jquery-3.7.0.js"></script>
<script src="${CP}/resources/js/util.js"></script>
<title>음악 순위 페이지</title>
</head>
<body>
<div class="container">
  <!-- 제목 -->
  <div class="page-header text-center">
    <h2><c:out value='음악 순위 페이지' /></h2>
  </div>
  <hr class="my-2">
  <div class="row g-1 d-flex justify-content-end ">
  <h2>장르</h2>
    <div class="col-sm" id="genre" onclick="redirectToMusicReg('발라드')">발라드</div>
    <div class="col-sm" id="genre" onclick="redirectToMusicReg('댄스')">댄스</div>
    <div class="col-sm" id="genre" onclick="redirectToMusicReg('랩/힙합')">랩/힙합</div>
    <div class="col-sm" id="genre" onclick="redirectToMusicReg('Soul')">R&B/Soul</div>
    <div class="col-sm" id="genre" onclick="redirectToMusicReg('인디음악')">인디음악</div>
    <div class="col-sm" id="genre" onclick="redirectToMusicReg('록/메탈')">록/메탈</div>
    <div class="col-sm" id="genre" onclick="redirectToMusicReg('트로트')">트로트</div>
    <div class="col-sm" id="genre" onclick="redirectToMusicReg('포크/블루스')">포크/블루스</div>
  </div>
  <div class="row g-1 d-flex justify-content-end ">
  <h2>감정</h2>
    <div class="col-sm" id="feeling" onclick="redirectToMusicRegEmo('설렘')">설렘</div>
    <div class="col-sm" id="feeling" onclick="redirectToMusicRegEmo('슬픔')">슬픔</div>
    <div class="col-sm" id="feeling" onclick="redirectToMusicRegEmo('편안')">편안함</div>
    <div class="col-sm" id="feeling" onclick="redirectToMusicRegEmo('불안')">불안함</div>
    <div class="col-sm" id="feeling" onclick="redirectToMusicRegEmo('화')">화남</div>
    <div class="col-sm" id="feeling" onclick="redirectToMusicRegEmo('신남')">신남</div>
    <div class="col-sm" id="feeling" onclick="redirectToMusicRegEmo('자신감')">자신감</div>
  </div>
  
    <hr class="my-2">
   <table id="boardTable" class="table table-striped table-hover table-bordered" style="table-layout: fixed">
      <thead>
        <tr class="table-info" style="height: 49px;">
          <th class="text-center noWidth">No</th>
          <th class="text-center albumtWidth"></th>
          <th class="text-left infoWidth">곡정보</th>
          <th class="text-left albuminfotWidth">앨범</th>
          <th class="text-center genreWidth">장르</th> 
          <th class="text-center genreWidth">감정</th>
          <th class="text-center likeCntWidth">좋아요</th>
          <th style="display:none;">SEQ</th>
        </tr>
      </thead>
      <tbody>
       <c:choose>
         <%-- 조회 데이터가 있는 경우--%>
         <c:when test="${not empty musicList }">
            <c:forEach var="vo" items="${musicList}">
              <tr class="align-middle" onclick="musicClick();" style="height: 85px;">
                <td class="text-center title"><c:out value="${vo.num}"/></td>
                <td class="text-center albumPath"><img class="album-image" src="<c:out value="${vo.albumPath}"/>" width="60px" height="60px"></td>
                <td class="text-left title artist">
                  <div class="truncate-text">
								    <c:out value="${vo.title}" /><br />
								    <c:out value="${vo.artist}" />
								  </div></td>
                <td class="text-center album">
                <div class="truncate-text">
                <c:out value="${vo.album}"/>
                </div>
                </td>
                <td class="text-center genre">
                <div class="truncate-text">
                <c:out value="${vo.genre}"/>
                </div>
                </td>
                <td class="text-center feeling"><c:out value="${vo.feeling}"/></td>
                <td class="text-center likeCnt"><c:out value="${vo.likeCnt}"/></td>
                <td style="display:none;" data-musicid="<c:out value="${vo.musicId}" />"></td>
              </tr>
            </c:forEach>
         </c:when>

         <%-- 조회 데이터가 없는 경우--%>
         <c:otherwise>
           <tr>
              <td  class="text-center col-sm-12  col-md-12  col-lg-12" colspan="99">No data found.</td>
           </tr>
         </c:otherwise>
       </c:choose>
      </tbody>
</table>
  
  <script src="/resources/js/music_rank.js"></script>
  </div>
</body>
</html>