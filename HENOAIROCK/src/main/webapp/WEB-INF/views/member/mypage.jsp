<%@page import="com.heno.airock.dto.MusicVO"%>
<%@page import="com.heno.airock.cmn.StringUtil"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/admin/sidebar.jsp" %>
<%@ taglib  prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" type="text/css" href="/resources/css/Mypage.css">
<script src="${CP}/resources/js/jquery-3.7.0.js"></script>
<script src="${CP}/resources/js/util.js"></script>
<title>Insert title here</title>
</head>
<body>
<!-- 제목 및 닉네임 사진 변경  -->
<div id="musicList" class="mw">
  <div class="meta_info">
    <img class="meta_info_img" alt="" src="https://api1.indj.club/api/v3/channel/image/thumbnail/CHThumbnail_2022-06-23-15-08-35_51532.jpg">
  <div class="meta_info_text absolute p-16">
    <h1>혼술할때 들어봐요</h1>
    <span class="text96">13곡 · 01시간 01분</span>
  <div class="tag_list">
    <span class="text96"> #휴식 </span>
    <span class="text96"> #혼술/혼밥 </span>
    <span class="text96"> #슬퍼요 </span>
  </div>
  
  <!-- 노래 모음 -->
  <article class="horizen_zzz">
  <button class="fs">
    <img class="horizen_mmimg" src="https://api1.indj.club/api/v3/channel/image/profile/profile_51532_340788244122.jpg" alt="이미지" style="width: 48px;">
  <div id="meta_info" class="ell">
    <p class="meta_info_title ell">어깨가 넓은 김형준</p>
  </div>
   </button>
  </article>
 </div>
</div>

  <div class="tab_menu">
    <ul class="tab_list">
      <li class="is_on"><a href="#tab1" class="tab_btn">좋아요</a></li>
      <li><a href="#tab2" class="tab_btn">앨범아트</a></li>
    </ul>
  </div>
  <div class="music_list p-16">
  <c:choose>
    <%-- 조회 데이터가 있는 경우--%>
    <c:when test="${not empty list }">
       <c:forEach var="vo" items="${list}">
       <article class="horizen_station cursor">
				  <button class="fs music" id="music" name="music">
					    <img class="horizen_img station" src="${vo.albumPath }" alt="이미지" style="width: 80px;">
					  <div id="meta_info" class="ell">
					    <p class="meta_info_title ell">${vo.title}</p>
					    <span class="meta_info_desc ell">${vo.artist }</span>
					  </div>
				   </button>
				   <input type="hidden" value="${vo.musicId }" id="musicId" name="musicId">
			 </article>
       </c:forEach>
    </c:when>
    <%-- 조회 데이터가 없는 경우--%>
    <c:otherwise>
      <tr>
         <td  class="text-center col-sm-12  col-md-12  col-lg-12" colspan="99">검색결과가 없습니다.</td>
      </tr>
    </c:otherwise>
  </c:choose>

  </div>
  
  <!--  -----------------------------------------중복------------------------------------------------------- -->
  
  <script src="${CP}/resources/js/member/mypage.js"></script>
</body>
</html>