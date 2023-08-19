<%@page import="com.heno.airock.dto.PostVO"%>
<%@page import="com.heno.airock.cmn.StringUtil"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ include file="/WEB-INF/views/admin/admin_dashboard.jsp" %>
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
<%
    // 어드민으로 로그인되었는지 확인
    boolean isAdminLoggedIn = session.getAttribute("loggedInAdmin") != null;
    
    // isAdminLoggedIn 값을 JavaScript 변수로 넘겨주기
    out.println("<script>const isAdminLoggedIn = " + isAdminLoggedIn + ";</script>");
%>

<c:set var="CP" value="${pageContext.request.contextPath }"/>  
<!DOCTYPE html>
<html>
<head>
<meta charset="${encoding}">
<meta name="viewport" content="width=device-width, initial-scale=1">
<!-- CSS only -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
<!-- Google Icons -->
<link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
<!-- JavaScript Bundle with Popper -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4" crossorigin="anonymous"></script>
<script src="${CP}/resources/js/jquery-3.7.0.js"></script>
<script src="${CP}/resources/js/util.js"></script>

<title>${title}</title>

</head>
<style>
</style>
<body class="music-board">
<div class="container">
  <!-- Content here -->
  <!-- 제목 -->
  <div class="page-header">
    <h2><c:out value='${title}' /></h2>
  </div>
  <!--// 제목 ------------------------------------------------------------------->
  <!-- 검색 form -->
  <form action="/admin/post" name="boardFrm">
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
        <a href="/admin/admin_post_reg" class="btn btn-primary" >공지사항 등록</a>
      </div>      
    </div>  
  </form>
  <div id="dyContainer">

  </div>

   <table id="boardTable" class="table table-striped table-hover table-bordered  thead-dark thead-inverse">
      <thead>
        <tr  class="table-primary" >
           <th class="text-center">번호</th>
           <th class="text-center">제목</th>  
           <th class="text-center">글쓴이</th>
           <th class="text-center">작성일</th> 
           <th class="text-center">조회</th>
           <th style="display:none;">SEQ</th>
        </tr>
      </thead>
      
   <tbody>
      <c:choose>
         <%-- 조회 데이터가 있는 경우--%>
         <c:when test="${not empty list }">
            <c:forEach var="vo" items="${list}">
               <tr>
                  <td class="text-center col-1"><c:out value="${vo.num}" /></td>
                  <td class="text-left col-7"><a href="#"><c:out value="${vo.postTitle}" /></a></td>
                  <td class="text-center col-2"><c:out value="${vo.userId}" /></td>
                  <td class="text-center col-2"><c:out value="${vo.updateDt}" /></td>
                  <td class="text-end col-1"><c:out value="${vo.readCnt}" /></td>
                  <td style="display:none;"><c:out value="${vo.postSeq}" /></td>
                  <td class="text-center col-1">
                     <c:if test="${loggedInAdmin != null}">
                        <div class="btn-group">
                           <button class="btn btn-info btn-sm detail-button" data-post-seq="<c:out value='${vo.postSeq}'></c:out>">
                              <i class="fas fa-info-circle"></i> 상세조회
                           </button>
                           <button class="btn btn-danger btn-sm delete-button" data-post-seq="<c:out value='${vo.postSeq}'></c:out>">
                              <i class="fas fa-trash"></i> 삭제
                           </button>
                        </div>
                     </c:if>
                  </td>
               </tr>
            </c:forEach>
         </c:when>
      </c:choose>
   </tbody>
</table>
<!-- 페이징 -->
    <div class="d-flex justify-content-center">
      <%=StringUtil.renderPaging(totalCnt, pageNo, pageSize, bottomCount, cPath+"/admin/post", "select") %>
    </div>
</div> 

<script>
function select(url, pageNo){
    console.log("url:"+url);
    console.log("pageNo:"+pageNo);
    
    let frm = document.boardFrm;
    //$("#pageNo").val(1); //jquery
    frm.action = url;
    frm.pageNo.value=pageNo;//javascript
    frm.submit();//controller call  
  }


//상세조회 버튼 클릭 시 실행되는 함수
$(".detail-button").on("click", function () {
    console.log("doDetail");
    var seq = $(this).data("post-seq"); // 조회할 게시물의 번호 가져오기
    // div, seq
    // http://localhost:8080/ehr/board/doSelectOne.do?div=10&seq=393
    window.location.href = "${CP}/admin/select?div=" + $("#div").val() + "&seq=" + seq;

});
   // 삭제 버튼 클릭 시 실행되는 함수
   $(".delete-button").on("click", function () {
       console.log("doDelete");
       var seq = $(this).data("post-seq"); // 삭제할 게시물의 번호 가져오기
       if (confirm('삭제 하시겠습니까') == false) return;

       $.ajax({
           type: "GET",
           url: "/admin/delete", // 삭제를 처리하는 서버 URL
           async: true, // 비동기 처리
           dataType: "html", // 응답 데이터 형식은 HTML로 설정
           data: {
               postDiv: $("#div").val(), // 게시물 구분 값
               postSeq: seq // 게시물 번호
           },
           success: function (data) { // 서버 응답 성공 시 실행되는 함수
               console.log("success data:", data);
               var result = JSON.parse(data); // JSON 데이터로 변환
               if ("1" === result.msgId) { // 성공적으로 삭제되었을 경우
                   alert(result.msgContents);
                   location.reload(); // 삭제 후 페이지 새로고침
               } else {
                   alert(result.msgContents);
               }
           },
           error: function (data) { // 서버 응답 실패 시 실행되는 함수
               console.log("error:", data);
           }
       });
   });

   // 조회 버튼 클릭 시 실행되는 함수
   $("#doRetrieve").on("click", function () {
       console.log("doRetrieve");
       doRetrieveCall(1); // 페이지 번호 1로 조회 호출
   });

   // 검색어 입력란에서 Enter 키를 누를 때 실행되는 함수
   $("#searchWord").on("keypress", function (e) {
       console.log("searchWord");
       if (13 === e.which) { // Enter 키의 키코드
           e.preventDefault();
           doRetrieveCall(1); // 페이지 번호 1로 조회 호출
       }
   });

   // 게시물 목록 조회 함수
   function doRetrieveCall(pageNo) {
       var frm = document.boardFrm;
       frm.pageNo.value = pageNo;
       frm.submit();
   }

</script>
</body>

</html>