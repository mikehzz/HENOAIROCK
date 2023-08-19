<%@page import="com.heno.airock.dto.PostVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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
	href="/resources/css/post/post_detail.css">
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
<script src="/resources/js/post/post_detail.js"></script>
<title>${title}</title>
</head>
<body>
	<!-- contents  -->
	<div class="container">
		<!-- 소 제목 -->
		<div class="page-title">
			<h2>${title}</h2>
		</div>
		<input type="hidden" name="div" id="div" value="${inVO.getPostDiv()}">
		<input type="hidden" name="seq" id="seq" value="${inVO.getPostSeq()}">
		<input type="hidden" name="userId" id="userId" value="${sessionScope.user.userId}">
		<input type="hidden" name="musicId" id="musicId" value="${outVO.musicId}">
		<div class="content">
			<section>
				<table class="table table-striped table-hover">
					<colgroup>
						<col style="width: 10%;" />
						<col style="width: 23%;" />
						<col style="width: 10%;" />
						<col style="width: 23%;" />
					</colgroup>
					<tbody>
						<tr>
							<c:if test="${not empty outVO.musicId}">
								<th scope="row">음악 정보</th>
								<td><img class="album-cover" src="${outVO.albumPath }"
									alt="앨범커버" width="60px" height="60px" id=musicClick name=musicClick></td>
								<th scope="row">곡이름</th>
								<td>${outVO.title} - ${outVO.artist }</td>
								<c:if test="${not empty outVO.updateDt }">
								<th scope="row">등록일</th>
								<td>${outVO.postDt}</td>
								<th scope="row">수정일</th>
								<td>${outVO.updateDt }</td>
								</c:if>
								<c:if test="${empty outVO.updateDt }">
								<th scope="row">등록일</th>
                <td>${outVO.postDt}</td>
								</c:if>
							</c:if>
							<c:if test="${empty outVO.musicId}">
								<th scope="row">음악 정보</th>
								<td>음악 정보가 없습니다.</td>
								<th scope="row">등록일</th>
								<td colspan="2">${outVO.postDt}</td>
							</c:if>
						</tr>
						<tr>
							<th scope="row">제목</th>
							<td>${outVO.postTitle}</td>

							<th scope="row">조회</th>
							<td colspan="6">${outVO.readCnt}</td>
						</tr>
						<tr>
							<th scope="row">글쓴이</th>
							<td colspan="7">${outVO.userId}</td>
						</tr>
						<tr>
							<th scope="row">내용</th>
							<td colspan="7"></td>
						</tr>
					</tbody>
				</table>
				<div class="content">
					<p>${outVO.postContents}</p>
				</div>
				<hr class="my-2">
				<p class="btn_set">
				  <c:set var="writer" value="${outVO.userId }" />
				  <c:set var="currentUser" value="${sessionScope.user.userId}" />
				  
				  <c:if test="${writer eq currentUser}">
					<input type="button" class="btn btn-primary" value="수정"
						id="doUpdate"> <input type="button"
						class="btn btn-primary" value="삭제" id="doDelete">
					</c:if>
						<input type="button" class="btn btn-primary" value="목록" id="moveToList">
				</p>
			</section>
		</div>
		
<div class="comment-input">
    <textarea class="form-control" id="comments" name="comments" rows="4"></textarea>
    <button class="btn btn-primary btn-lg" type="button" id="doAddComment">댓글 추가</button>
</div>

    <div id="commentList">
      <!-- 여기에 댓글이 추가될 것입니다 -->
    </div>


<c:forEach var="comment" items="${comments}">
    <span class="comment">
        <div class="comment-divider"></div>
        <div class="comment-content">
            <div class="comment-user">${comment.userId}</div>
            <div class="comment-time">${comment.cmtDt}</div>
        </div>
        <div class="comment-text">${comment.cmtContents}</div>
        <div class="comment-actions text-end justify-content-end">
            <!-- 수정 및 삭제 버튼은 댓글 작성자와 로그인한 사용자가 같을 때만 표시 -->
            <c:if test="${comment.userId eq currentUser}">
                <button class="btn btn-primary btn-sm edit-comment-button" data-comment-id="${comment.cmtSeq}">수정</button>
                <button class="btn btn-primary btn-sm delete-comment-button" data-comment-id="${comment.cmtSeq}">삭제</button>
            </c:if>
            <div class="comment-edit-form" style="display: none;">
                <textarea class="form-control editedComment comment-input" rows="4" style="width: 100%;">${comment.cmtContents}</textarea>
                <input type="hidden" class="commentId" value="${comment.cmtSeq}">
                <button type="button" class="btn btn-primary btn-sm submitEdit">수정 완료</button>
            </div>
        </div>
    </span>
</c:forEach>



				
		
	</div>
</body>
</html>