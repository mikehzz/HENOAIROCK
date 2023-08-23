<%-- <%@page import="com.heno.airock.dto.PostVO"%>
<%@page import="com.heno.airock.cmn.StringUtil"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/admin/sidebar.jsp" %>
<%@ taglib  prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%       
        PostVO vo = (PostVO)request.getAttribute("inVO");
        String divValue = vo.getPostDiv();
        String title    = "자유게시판";//10:자유게시판, 20:공지사항
        
        if("20".equals(divValue)){
           title = "공지사항";
        }
        
        request.setAttribute("title", title);
        
        //paging
        int bottomCount = 10;
        int pageSize    = 10;
        int pageNo      =  1;
        int totalCnt    =  0;
        String searchWord = "";
        String searchDiv  = "";
          
        if(null != vo){
             pageSize   = vo.getPageSize();
             pageNo     = vo.getPageNo();
             searchDiv  = vo.getSearchDiv();
             searchWord = vo.getSearchWord();
        }
        
        if(null !=  request.getAttribute("totalCnt")){
             totalCnt = Integer.parseInt(request.getAttribute("totalCnt").toString());
        }
        
        String cPath  = request.getContextPath();
         
%>
<c:set var="CP" value="${pageContext.request.contextPath }"/>  
<!DOCTYPE html>
<html>
<head>
<meta charset="${encoding}">
<meta name="viewport" content="width=device-width, initial-scale=1">
<!-- CSS only -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
<link rel="stylesheet" type="text/css" href="/resources/css/post.css">
<!-- JavaScript Bundle with Popper -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4" crossorigin="anonymous"></script>
<script src="${CP}/resources/js/jquery-3.7.0.js"></script>
<script src="${CP}/resources/js/util.js"></script>

<title>${title}</title>
</head>

<body>
<div class="container">
  <!-- Content here -->
  <!-- 제목 -->
  <div class="page-header">
    <h2><c:out value='${title}' /></h2>
  </div>
  <!--// 제목 ------------------------------------------------------------------->
   <table id="boardTable" class="table table-hover table-striped table-sm table-borderless" style="table-layout: fixed">
      <thead class="table-light">
        <tr class="text-center table-Secondary didi">
   <th class="text-center noWidth" style="width: 5%;">번호</th>
   <th class="text-center" style="width: 25%;">제목</th>
   <th class="text-center" style="width: 15%;">앨범</th> 
   <th class="text-center" style="width: 15%;">음악 정보</th>
   <th class="text-center" style="width: 10%;">작성자</th>
   <th class="text-center readCntWidth" style="width: 5%;">조회수</th>
   <th class="text-center postDt" style="width: 10%;">작성일</th>
   <th style="display:none;">SEQ</th>
        </tr>
      </thead>
      <tbody class="table-group-divider">
       <c:choose>
         조회 데이터가 있는 경우
         <c:when test="${not empty list }">
            <c:forEach var="vo" items="${list}">
<tr class="table-row <c:if test='${vo.userId eq "어드민"}'>admin-post</c:if>">
    <td style="display:none;"><c:out value="${vo.postSeq}" /></td>
    <td class="text-center col-sm" style="vertical-align: middle;">
        <c:choose>
            <c:when test='${vo.userId eq "어드민"}'>
        <div class="admin-notice">
            <span style="color: red;">공지</span>
        </div>
            </c:when>
            <c:otherwise>
                <c:out value="${vo.postSeq}" />
            </c:otherwise>
        </c:choose>
    </td>
    <td class="text-center col-sm" style="vertical-align: middle;"><c:out value="${vo.postTitle}"/></td>
    <c:if test="${not empty vo.musicId}">
        <td class="text-center  col-sm" style="vertical-align: middle;"><img class="album-cover" src="${vo.albumPath }" alt="앨범커버" width="60px" height="60px"></td>
        <td class="text-left col-sm" style="vertical-align: middle;">
            <div class="truncate-text">
                <span style="font-weight: bold; font-size: 13px;"><c:out value="${vo.title}" /></span><br />
                <span style="font-size: 13px; color: #a1a1a1;"><c:out value="${vo.artist}" /></span>
            </div>
        </td>
    </c:if>
    <c:if test="${empty vo.musicId}">
        <td class="text-center col-sm" style="vertical-align: middle;"></td>
        <td class="text-center col-sm" style="vertical-align: middle;"></td>
    </c:if>
    <td class="text-center  col-sm" style="vertical-align: middle;">
        <c:set var="email" value="${vo.userId}" />
        <c:set var="username" value="${email.split('@')[0]}" />
        <span class="gaesi" style="color: gray; font-size: 13px;"><c:out value="${username}" /></span>
    </td>
    <td class="text-center  col-sm" style="vertical-align: middle;">
        <span class="gaesi" style="color: gray; font-size: 13px;"><c:out value="${vo.readCnt}" /></span>
    </td>
    <td class="text-center  col-sm" style="vertical-align: middle;">
        <span class="gaesi" style="color: gray; font-size: 13px;"><c:out value="${vo.postDt}" /></span>
    </td>
</tr>     
            </c:forEach>
         </c:when>
         조회 데이터가 없는 경우
         <c:otherwise>
           <tr>
              <td  class="text-center col-sm-12  col-md-12  col-lg-12" colspan="99">검색결과가 없습니다.</td>
           </tr>
         </c:otherwise>
       </c:choose>
      </tbody>
</table>
<!-- 페이징 -->
    <div class="d-flex justify-content-center">
      <%=StringUtil.renderPaging(totalCnt, pageNo, pageSize, bottomCount, cPath+"/post", "select") %>
    </div>
    
  
  
    <!-- 검색 form -->
<div class="d-flex justify-content-center">
  <form action="/post" name="boardFrm">
    <input type="hidden" name="pageNo" id="pageNo">
    <input type="hidden" name="div"    id="div" value='${inVO.getPostDiv()}'>
    <div class="row g-1 d-flex justify-content-end ">
      <div class="col-auto">
        <select class="form-select" name="searchDiv" id="searchDiv"> <!-- code table -->
          <option value="">전체</option>
          <c:forEach var="vo" items="${searchList }">
            <option <c:if test="${vo.code == inVO.searchDiv }">selected</c:if> value="<c:out value='${vo.code }'/>"  >
               <c:out value='${vo.codeNm }'/>
            </option>
          </c:forEach>  
        </select>
      </div>  
      <div class="col-auto">
        <input type="text" name="searchWord" id="searchWord" value="<c:out value='${inVO.searchWord }'/>" placeholder="검색어를 입력 하세요" class="form-control">
      </div>
      <div class="col-auto">  
        <select class="form-select" name="pageSize" id="pageSize">
          <c:forEach var="vo" items="${pageSizeList }">
            <option <c:if test="${vo.code == inVO.pageSize }">selected</c:if> value="<c:out value='${vo.code }'/>">
               <c:out value='${vo.codeNm }'/>
            </option>
          </c:forEach>
        </select>
      </div>  
      <div class="col-auto">  
        <a href="#" class="btn btn-primary" id="doRetrieve" >조회</a>
        <a href="/post/post_reg" class="btn btn-primary" >등록</a>  
      </div>      
    </div>
  </form>
  </div>
  <script src="/resources/js/post.js"></script>
</div>
</body>

</html> --%>