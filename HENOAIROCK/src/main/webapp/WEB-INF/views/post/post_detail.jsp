<%@page import="com.heno.airock.dto.PostVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
  pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/admin/sidebar.jsp" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
  PostVO vo = (PostVO) request.getAttribute("inVO");
String divValue = vo.getPostDiv();
String title = "자유게시판";//10:자유게시판, 20:공지사항
if ("20".equals(divValue)) {
  title = "공지사항";
}
request.setAttribute("title", title);
%>

<c:set var="CP" value="${pageContext.request.contextPath }" />
<!DOCTYPE html>
<html>
<head>
<meta charset="${encoding}">
<meta name="viewport" content="width=device-width, initial-scale=1">
<!-- CSS only -->
<link rel="stylesheet" type="text/css"
  href="/resources/css/post_detail.css">
<link
  href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css"
  rel="stylesheet"
  integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65"
  crossorigin="anonymous">
<!-- JavaScript Bundle with Popper -->
<script
  src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"
  integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4"
  crossorigin="anonymous"></script>
<script src="${CP}/resources/js/jquery-3.7.0.js"></script>
<script src="${CP}/resources/js/util.js"></script>
<script src="/resources/js/post_detail.js"></script>
<title>${title}</title>
<style>



/*.container {
  background-color: #fff;
  border-radius: 10px;
  box-shadow: 0px 2px 6px rgba(0, 0, 0, 0.3); /* 연하게 수정 */
  padding: 30px;
  margin-bottom: 20px;
  margin-top: 15px;
  
}*/

@font-face {
    font-family: 'Cafe24SsurroundAir';
    src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_2105_2@1.0/Cafe24SsurroundAir.woff') format('woff');
    font-weight: normal;
    font-style: normal;
}
.body {
/*   background-image: linear-gradient(180deg,#000000 10%,#001a65 100%); */
    font-family: 'Cafe24SsurroundAir';
    src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_2105_2@1.0/Cafe24SsurroundAir.woff') format('woff');
    font-weight: normal;
    font-style: normal;
}
</style>
</head>
<body>


  <!-- contents  -->
  <div class="container">
    <!-- 소 제목 -->

    
   <!-- 간격을 위한 빈 div -->
  <div style="margin-top: 25px;"></div>
  
    
   <!-- 목록 버튼 추가 -->
	  <div style="text-align: right;">
	   <input type="button" class="btn btn-secondary" value="목록" id="moveToList">
	  </div>
	  </br>
  
		<div class="container">
		    <div class="page-title">
		        <div class="d-flex justify-content-between align-items-center">
		            <h2><c:out value='${outVO.postTitle}' /></h2>
		            <div class="text-muted small">
		                작성자: ${outVO.userId}
		                <c:choose>
		                    <c:when test="${not empty outVO.updateDt}">
		                        <br>등록일: ${outVO.postDt} / 수정일: ${outVO.updateDt}
		                    </c:when>
		                    <c:otherwise>
		                        <br>등록일: ${outVO.postDt}
		                    </c:otherwise>
		                </c:choose>
		            </div>
		        </div>
		    </div>
  

	 <div>
		  
		    <div style="margin-top: 40px;"></div>
		    <input type="hidden" name="div" id="div" value="${inVO.getPostDiv()}">
		    <input type="hidden" name="seq" id="seq" value="${inVO.getPostSeq()}">
		    <input type="hidden" name="userId" id="userId" value="${sessionScope.user.userId}">
		    <input type="hidden" name="musicId" id="musicId" value="${outVO.musicId}">
		    <div class="content">
      <section>
				<table class="table custom-table">
				    <colgroup>
				        <col style="width: 10%;" />
				        <col style="width: 23%;" />
				        <col style="width: 10%;" />
				        <col style="width: 23%;" />
				    </colgroup>
	    <tbody>
			        <tr>
			            <th scope="row">음악 정보</th>
			            <td><img class="album-cover" src="${outVO.albumPath}" alt="앨범커버" width="60px" height="60px" id="musicClick" name="musicClick"></td>
			            <th scope="row">곡이름</th>
			            <td>${outVO.title} - ${outVO.artist}</td>
			            <th scope="row">조회수</th>
			            <td colspan="6">${outVO.readCnt}</td>
			             <th scope="row" style="color: white;">내용</th>
			        </tr>

			    </tbody>
			</table>
	      <table class="table table-striped">
	          <tr>
	            <th scope="row" style="color: white;">내용</th>
	            <td colspan="7"></td>
	          </tr>
	          </table>
	      <div class="content">
	          <p>${outVO.postContents}</p>
	        </div> 
		        
			<p class="btn_set">
			    <c:set var="writer" value="${outVO.userId }" />
			    <c:set var="currentUser" value="${sessionScope.user.userId}" />
			
			    <c:if test="${writer eq currentUser}">
			        <input type="button" class="btn btn-secondary" value="수정" id="doUpdate">
			        <input type="button" class="btn btn-secondary" value="삭제" id="doDelete">
			    </c:if>
			</p>
      </section>
    </div>
</div>
    </div>
    <div style="margin-top: 0px;">
    <div class="comment-input">
        <textarea class="form-control" id="comments" name="comments" rows="4"></textarea>
        <button class="btn btn-secondary btn-lg" type="button" id="doAddComment">댓글 추가</button>
    </div>
    <div style="margin-top: 10px;">
    <br/>
    <h5>댓글</h5>


    <div id="commentList">
      <!-- 여기에 댓글이 추가될 것입니다 -->
    </div>


<c:forEach var="comment" items="${comments}">
    <div class="comment mb-3 p-3 border rounded">
        <div class="d-flex justify-content-between align-items-center">
            <div class="comment-user">${comment.userId}</div>
            <c:if test="${comment.userId eq currentUser}">
                <div class="comment-actions">
                    <button class="btn btn-secondary btn-sm edit-comment-button" data-comment-id="${comment.cmtSeq}">수정</button>
                    <button class="btn btn-secondary btn-sm delete-comment-button" data-comment-id="${comment.cmtSeq}">삭제</button>
                </div>
            </c:if>
        </div>
        <div class="comment-text mt-2">${comment.cmtContents}</div>
        <c:if test="${not empty comment.cmtUpdateDt}">
          <div class="comment-time text-muted mt-2">수정됨: ${comment.cmtUpdateDt}</div>
        </c:if>
        <c:if test="${empty comment.cmtUpdateDt}">
          <div class="comment-time text-muted mt-2">${comment.cmtDt}</div>
        </c:if>
        
        <div class="comment-edit-form mt-2" style="display: none;">
            <textarea class="form-control editedComment comment-input" rows="4"></textarea>
            <input type="hidden" class="commentId" value="${comment.cmtSeq}">
            <button type="button" class="btn btn-secondary btn-sm submitEdit mt-2">수정 완료</button>
            <button type="button" class="btn btn-secondary btn-sm cancelEdit mt-2">취소</button>
        </div>

    </div>
</c:forEach>

  </div>
</body>
</html>