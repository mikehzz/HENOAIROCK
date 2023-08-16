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
</head>
<body>
	<!-- contents  -->
	<div class="container">
		<!-- 소 제목 -->
		<div class="page-title">
			<h2>${title}</h2>
		</div>
		<input type="hidden" name="div" id="div" value="${inVO.getPostDiv()}">
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
								<th scope="row">등록일</th>
								<td>${outVO.postDt}</td>
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
							<td colspan="4">${outVO.readCnt}</td>
						</tr>
						<tr>
							<th scope="row">글쓴이</th>
							<td colspan="5">${outVO.userId}</td>
						</tr>
						<tr>
							<th scope="row">내용</th>
							<td colspan="5"></td>
						</tr>
					</tbody>
				</table>
				<div class="content">
					<p>${outVO.postContents}</p>
				</div>
				<hr class="my-2">
				<p class="btn_set">
					<input type="button" class="btn btn-primary" value="수정"
						id="doUpdate"> <input type="button"
						class="btn btn-primary" value="삭제" id="doDelete"> <input
						type="button" class="btn btn-primary" value="목록" id="moveToList">
				</p>
			</section>
		</div>
		<div class="input-group">
			<textarea class="form-control" id="comments" name="comments" rows="2"></textarea>
			<button class="btn btn-primary" type="button" id="doAddComment">댓글
				추가</button>
		</div>
		<div id="commentList">
			<!-- 여기에 댓글이 추가될 것입니다 -->
		</div>

		<c:forEach var="comment" items="${comments}">
			<div class="comment">
				<div class="comment-content">
					<span class="comment-user">${comment.userId}</span> <span
						class="comment-text">${comment.cmtContents}</span> <span
						class="comment-time">${comment.cmtDt}</span>
				</div>
				<div class="comment-actions">
					<button class="edit-comment-button"
						data-comment-id="${comment.cmtSeq}">수정</button>
				</div>
				<!-- 수정 폼 -->
				<div class="comment-edit-form" style="display: none;">
					<textarea class="editedComment" rows="4">${comment.cmtContents}</textarea>
					<input type="hidden" class="commentId" value="${comment.cmtSeq}">
					<button type="button" class="submitEdit">수정 완료</button>
				</div>
			</div>
		</c:forEach>
	</div>
</body>
</html>