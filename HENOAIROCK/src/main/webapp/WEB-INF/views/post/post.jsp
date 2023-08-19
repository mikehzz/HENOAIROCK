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
<!-- CSS only -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
<link rel="stylesheet" type="text/css" href="/resources/css/post/post.css">
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
  <!-- 검색 form -->
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
  <div id="dyContainer">
  
  </div>

   <table id="boardTable" class="table table-striped table-borderless table-hover thead-inverse">
      <thead class="table-light">
        <tr  class="table-primary" >
           <th class="text-center">번호</th>
           <th class="text-center">제목</th>  
           <th class="text-center">글쓴이</th>
           <th class="text-center">작성일</th> 
           <th class="text-center">조회</th>
           <th style="display:none;">SEQ</th>
           <th class="text-center">앨범</th> 
           <th class="text-center">음악 정보</th>
        </tr>
      </thead>
      <tbody class="table-group-divider">
       <c:choose>
         <%-- 조회 데이터가 있는 경우--%>
         <c:when test="${not empty list }">
            <c:forEach var="vo" items="${list}">
              <tr>
                <td style="display:none;"><c:out value="${vo.postSeq}"/></td>
                <td class="text-center  col-sm-1  col-md-1  col-lg-1"><c:out value="${vo.num}"/></td>
                <td class="text-left    col-sm-2  col-md-2  col-lg-2"><a href="#"><c:out value="${vo.postTitle}"/></a></td>
                <td class="text-center  col-sm-2  col-md-2  col-lg-2"><c:out value="${vo.userId}"/></td>
                <td class="text-center  col-sm-2  col-md-1  col-lg-1"><c:out value="${vo.postDt}"/></td>
                <td class="text-end     col-sm-0  col-md-1  col-lg-1"><c:out value="${vo.readCnt}"/></td>
                <c:if test="${not empty vo.musicId}">
                  <td class="text-center  col-sm-2  col-md-1  col-lg-1"><img class="album-cover" src="${vo.albumPath }" alt="앨범커버" width="60px" height="60px"></td>
		              <td class="text-center  col-sm-2  col-md-5  col-lg-5"><c:out value="${vo.title}- ${vo.artist}"/></td>
		            </c:if>
		            <c:if test="${empty vo.musicId}">
		              <td class="text-center  col-sm-2  col-md-4  col-lg-4">음악정보가 없습니다.</td>
		              <td class="text-center  col-sm-2  col-md-4  col-lg-4"></td>
		            </c:if>
              </tr>            
            </c:forEach>
         </c:when>
         <%-- 조회 데이터가 없는 경우--%>
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
    <script src="/resources/js/post/post.js"></script>
</div>  
</body>

</html>