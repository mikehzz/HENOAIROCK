<%@page import="com.heno.airock.dto.PostVO"%>
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
<link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Nunito:wght@300;400;600;700&display=swap">
<script src="${CP}/resources/js/jquery-3.7.0.js"></script>
<script src="${CP}/resources/js/util.js"></script>

<title>${title}</title>
<style>

.body2 {
/*   background-image: linear-gradient(180deg,#000000 10%,#001a65 100%); */
    font-family: 'omyu_pretty';
    src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_2304-01@1.0/omyu_pretty.woff2') format('woff2');
    font-weight: normal;
    font-style: normal;
}
section{
  margin: 50px;
}

.page-header h2 {
  color: #f8f9fa; /* 밝은 글자색 */
  font-size: 24px;
  font-weight: bold;
}




#boardTable {
  border-collapse: separate;
  border-spacing: 0;
  width: 100%;
  border-radius: 15px;
  overflow: hidden;
  box-shadow: 0px 0px 10px rgba(0, 0, 0, 0.2);
  background-color: transparent;
}

#boardTable th,
#boardTable td {
  padding: 12px;
  text-align: center;
  background-color: rgba(255, 255, 255, 0.2);
  border-top: 1px solid rgba(255, 255, 255, 0.1);
  border-bottom: 1px solid rgba(0, 0, 0, 0.1);
}

#boardTable th {
  color: #f8f9fa;
}

#boardTable tbody tr {
  background-color: #f5f5f5;
}


.admin-post td {
    font-weight: bold;
}
/* 추가한 스타일 */
.notice-text {
  display: inline-block;
  background-color: #9addff; /* New notice color */
  color: white;
  padding: 0px 10px; /* Slightly smaller padding */
  border-radius: 15px;
  font-weight: bold;
  font-size: 13px;
  text-align: center;
  width: auto; /* Adjust width to fit content */
  box-shadow: 2px 2px 5px rgba(0, 0, 0, 0.1);
}
.admin-post td .gaesi {
    color: black !important;
}

.truncate-text {
    max-height: 60px;
    overflow: hidden;
    text-overflow: ellipsis;
    white-space: nowrap;
}

.noWidth {
    width: 5%;
}

.table-row {
    height: 90px;
}



.text-center {
    text-align: center;
}

.text-left {
    text-align: left;
}

.albumCover {
    width: 60px;
    height: 60px;
    object-fit: cover;
    border-radius: 50%;
}

.postDt {
    width: 12%;
}

.readCntWidth {
    width: 8%;
}

.d-flex.justify-content-center {
    justify-content: center;
}

.form-control {
  padding: 8px;
  border: 1px solid #ccc;
  border-radius: 4px;
  width: auto;
}

.form-select {
  padding: 8px;
  border: 1px solid #ccc;
  border-radius: 4px;
}


.row.g-1 {
    margin-top: 10px;
}

.btn-primary {
  padding: 10px 20px;
  background-color: #9addff; /* New primary color */
  color: white;
  border: none;
  border-radius: 4px;
  cursor: pointer;
}

.btn-primary:hover {
  background-color: #6db1e0; /* Darker color on hover */
}

form {
    margin-bottom: 20px;
}

.admin-post {
    position: relative;
}




</style>
</head>

<body class="body2">
<div class="container">
  <!-- Content here -->
  <!-- 제목 -->
  <div class="page-header">
    <h2><c:out value='${title}' /></h2>
  </div>
  <!--// 제목 ------------------------------------------------------------------->
   <table id="boardTable">
      <thead>
        <tr>
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
      <tbody>
       <c:choose>
         <%-- 조회 데이터가 있는 경우--%>
         <c:when test="${not empty list }">
            <c:forEach var="vo" items="${list}">
<tr class="table-row <c:if test='${vo.userId eq "어드민"}'>admin-post</c:if>">
    <td style="display:none;"><c:out value="${vo.postSeq}" /></td>
    <td style="vertical-align: middle;">
        <c:choose>
            <c:when test='${vo.userId eq "어드민"}'>

            <span class="notice-text">공지</span>

            </c:when>
            <c:otherwise>
                <c:out value="${vo.postSeq}" />
            </c:otherwise>
        </c:choose>
    </td>
    <td class="text-center" style="vertical-align: middle;"><c:out value="${vo.postTitle}"/></td>
    <c:if test="${not empty vo.musicId}">
        <td class="text-center" style="vertical-align: middle;"><img class="album-cover" src="${vo.albumPath }" alt="앨범커버" width="60px" height="60px"></td>
        <td class="text-left" style="vertical-align: middle;">
            <div class="truncate-text">
                <span style="font-weight: bold; font-size: 13px;"><c:out value="${vo.title}" /></span><br />
                <span style="font-size: 13px; color: #a1a1a1;"><c:out value="${vo.artist}" /></span>
            </div>
        </td>
    </c:if>
    <c:if test="${empty vo.musicId}">
        <td class="text-center" style="vertical-align: middle;"></td>
        <td class="text-center" style="vertical-align: middle;"></td>
    </c:if>
    <td class="text-center" style="vertical-align: middle;">
        <c:set var="email" value="${vo.userId}" />
        <c:set var="username" value="${email.split('@')[0]}" />
        <span class="gaesi" style="color: gray; font-size: 13px;"><c:out value="${username}" /></span>
    </td>
    <td class="text-center" style="vertical-align: middle;">
        <span class="gaesi" style="color: gray; font-size: 13px;"><c:out value="${vo.readCnt}" /></span>
    </td>
    <td class="text-center" style="vertical-align: middle;">
        <span class="gaesi" style="color: gray; font-size: 13px;"><c:out value="${vo.postDt}" /></span>
    </td>
</tr>     
            </c:forEach>
         </c:when>
         <%-- 조회 데이터가 없는 경우--%>
         <c:otherwise>
           <tr>
              <td colspan="99">검색결과가 없습니다.</td>
           </tr>
         </c:otherwise>
       </c:choose>
      </tbody>
</table>
<!-- 페이징 -->
    <div>
      <%=StringUtil.renderPaging(totalCnt, pageNo, pageSize, bottomCount, cPath+"/post", "select") %>
    </div>
    
  
  
    <!-- 검색 form -->
<div class="d-flex justify-content-center">
  <form action="/post" name="boardFrm">
    <input type="hidden" name="pageNo" id="pageNo">
    <input type="hidden" name="div"    id="div" value='${inVO.getPostDiv()}'>
    <div class="row g-1">
      <div>
        <select class="form-select" name="searchDiv" id="searchDiv"> <!-- code table -->
          <option value="">전체</option>
          <c:forEach var="vo" items="${searchList }">
            <option <c:if test="${vo.code == inVO.searchDiv }">selected</c:if> value="<c:out value='${vo.code }'/>"  >
               <c:out value='${vo.codeNm }'/>
            </option>
          </c:forEach>  
        </select>
      </div>  
      <div>
        <input type="text" name="searchWord" id="searchWord" value="<c:out value='${inVO.searchWord }'/>" placeholder="검색어를 입력 하세요" class="form-control">
      </div>
      <div>  
        <select class="form-select" name="pageSize" id="pageSize">
          <c:forEach var="vo" items="${pageSizeList }">
            <option <c:if test="${vo.code == inVO.pageSize }">selected</c:if> value="<c:out value='${vo.code }'/>">
               <c:out value='${vo.codeNm }'/>
            </option>
          </c:forEach>
        </select>
      </div>  
      <div>  
        <a href="#" id="doRetrieve" class="btn-primary">조회</a>
        <a href="/post/post_reg" class="btn-primary">등록</a>  
      </div>      
    </div>
  </form>
  </div>
  <script src="/resources/js/post.js"></script>
</div>
</body>

</html>