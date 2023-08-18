<%@page import="com.heno.airock.dto.PostVO" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
<!-- JavaScript Bundle with Popper -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4" crossorigin="anonymous"></script>
<script src="${CP}/resources/js/jquery-3.7.0.js"></script>
<script src="${CP}/resources/js/util.js"></script>
<title>${title}</title>
</head>
<body>
  <!-- contents  -->  
  <div class="container">
  <!-- 소 제목 -->
  <div class="page-title">
    <h2>${title}</h2>
  </div>
  
  <!--// 소 제목 end ------------------------------------------------------------->
    <!-- 버튼 -->
    <div class="row g-1 d-flex justify-content-end">
      <div class="col-auto">
        <input type="button" class="btn btn-primary" value="목록" id="moveToList">
        <input type="button" class="btn btn-primary delete-button" value="삭제" id="doDelete"
           data-post-seq="${outVO.postSeq}"
           <c:if test="${isAdminLoggedIn}">
               disabled="disabled" <%-- 어드민으로 로그인되지 않은 경우 버튼 비활성화 --%>
           </c:if>
    >
      </div>
    </div>
    <!--// 버튼 ----------------------------------------------------------------->
    <form action="#"  name="reg_frm" id="reg_frm">
       <input type="hidden" name="div" id="div" value="${inVO.getPostDiv()}">
        <div class="mb-3">
          <label for="exampleFormControlInput1" class="form-label">SEQ</label>
          <input type="text" class="form-control title_cls" id="seq"  name="seq"
             placeholder="제목을 입력 하세요." required="required" readonly="readonly" value="${outVO.postSeq}">
        </div>       
        <div class="mb-3">
          <label for="exampleFormControlInput1" class="form-label">제목</label>
          <input type="text" class="form-control title_cls" id="title"  name="title"
             placeholder="제목을 입력 하세요." required="required" readonly="readonly" maxlength="66"  value="${outVO.postTitle}">
        </div>
        <div class="mb-3">
          <label for="exampleFormControlInput1" class="form-label">읽은 횟수</label>
          <input type="text" class="form-control title_cls" id="readCnt"  name="readCnt"
             placeholder="읽은 횟수" required="required"  readonly="readonly"   value="${outVO.readCnt}">
        </div>
                
        <div class="mb-3">
          <label for="exampleFormControlInput1" class="form-label">등록자ID</label>
          <input type="text" class="form-control" id="regId" name="regId" value="${outVO.userId}"
          placeholder="아이디를 입력 하세요." readonly="readonly">
        </div>
        
        <div class="mb-3">
          <label for="exampleFormControlInput1" class="form-label">등록일</label>
          <input type="text" class="form-control" id="regDt" name="regDt" value="${outVO.postDt}" readonly="readonly">
        </div>
        <div class="mb-3">
          <label for="exampleFormControlInput1" class="form-label">수정자</label>
          <input type="text" class="form-control" id="modId" name="modId" value="${outVO.userId}"
          placeholder="수정자 아이디를 입력 하세요." readonly="readonly">
        </div>
        
        <div class="mb-3">
          <label for="exampleFormControlInput1" class="form-label">수정일</label>
          <input type="text" class="form-control" id="modDt" name="modDt" value="${outVO.updateDt}" readonly="readonly">
        </div>

        <div class="mb-3">
          <label for="exampleFormControlTextarea1" class="form-label">내용</label>
          <textarea class="form-control" id="contents" name="contents" rows="3" readonly="readonly" required="required">${outVO.postContents}</textarea>
        </div>
                
    </form>
  </div>
  <!--// contents  ------------------------------------------------------------>
  <script src="/resources/js/admin/admin_post_mng.js"></script>
</body>
</html>