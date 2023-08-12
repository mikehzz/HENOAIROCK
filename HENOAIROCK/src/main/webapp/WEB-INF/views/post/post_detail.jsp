<%@page import="com.heno.airock.dto.PostVO" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
<style>
.comment {
  border: 1px solid #ccc;
  margin: 10px 0;
  padding: 10px;
  background-color: #f9f9f9;
  border-radius: 5px;
}

.comment-user {
  font-weight: bold;
}

.comment-text {
  margin-top: 5px;
}

.comment-time {
  color: #666;
  font-size: 12px;
}

/* 추가된 댓글 입력 영역 스타일 */
.input-group {
  margin-top: 20px;
}

#comments {
  width: 70%;
  border: 1px solid #ccc;
  border-radius: 5px;
  padding: 5px;
}

#doAddComment {
  margin-left: 10px;
}
</style>
</head>
<body>
  <!-- contents  -->  
  <div class="container">
  <!-- 소 제목 -->
  <div class="page-title">
    <h2>${title}</h2>
    ${comments}
  </div>
  
  <!--// 소 제목 end ------------------------------------------------------------->
    <!-- 버튼 -->
    <div class="row g-1 d-flex justify-content-end">
      <div class="col-auto">
        <input type="button" class="btn btn-primary" value="목록" id="moveToList">
        <input type="button" class="btn btn-primary" value="수정" id="doUpdate">
        <input type="button" class="btn btn-primary" value="삭제" id="doDelete">
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
             placeholder="제목을 입력 하세요." required="required" maxlength="66"  value="${outVO.postTitle}">
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
          <textarea class="form-control" id="contents" name="contents" rows="3" required="required">${outVO.postContents}</textarea>
        </div>
                
                <div class="input-group">
           <textarea class="form-control" id="comments" name="comments" rows="2"></textarea>
           <button class="btn btn-primary" type="button" id="doAddComment">댓글 추가</button>
        </div>
<div id="commentList">
  <!-- 여기에 댓글이 추가될 것입니다 -->
</div>

<c:forEach var="comment" items="${comments}">
    <div class="comment">
        <div class="comment-content">
            <span class="comment-user">${comment.userId}</span>
            <span class="comment-text">${comment.cmtContents}</span>
            <span class="comment-time">${comment.cmtDt}</span>
        </div>
        <div class="comment-actions">
            <button class="edit-comment-button" data-comment-id="${comment.cmtSeq}">수정</button>
        </div>
        <!-- 수정 폼 -->
        <div class="comment-edit-form" style="display: none;">
            <textarea class="editedComment" rows="4">${comment.cmtContents}</textarea>
            <input type="hidden" class="commentId" value="${comment.cmtSeq}">
            <button type="button" class="submitEdit">수정 완료</button>
        </div>
    </div>
</c:forEach>

    </form>

  </div>
  <!--// contents  ------------------------------------------------------------>
<script>
$(document).ready(function() {
    // 페이지 로드 시 댓글 가져오기


    $("#doAddComment").on("click", function() {
        var commentText = $("#comments").val();

        if (!commentText) {
            alert("댓글을 입력하세요.");
            $("#comments").focus();
            return;
        }

        var userId = "${sessionScope.user.userId}";
        var postSeq = $("#seq").val();

        $.ajax({
            type: "POST",
            url: "/post/create",
            dataType: "json",
            data: {
                postSeq: postSeq,
                cmtContents: commentText,
                userId: userId
            },
            success: function(response) {
                if (response.success) {
                    var newComment = 
                    alert("댓글이 추가되었습니다.");
                    location.reload();
                } else {
                    alert(response.message);
                }
            }
        });
    });

 // 댓글 수정 버튼 클릭 시 수정 폼 보여주기
    $(document).on("click", ".edit-comment-button", function() {
    var commentText = $(this).siblings(".comment-text").text();
    var commentId = $(this).data("comment-id");
    var editedCommentForm = $(this).closest(".comment").find(".comment-edit-form");
    editedCommentForm.find(".editedComment").val(commentText);
    editedCommentForm.find(".commentId").val(commentId);
    editedCommentForm.show();
});

 // 수정 완료 버튼 클릭 시 수정 내용 서버로 전송
    $(document).on("click", ".submitEdit", function() {
        var editedComment = $(this).siblings(".editedComment").val();
        var commentId = $(this).siblings(".commentId").val();

        $.ajax({
            type: "POST",
            url: "/post/updateComment",
            data: {
                cmtSeq: commentId,
                cmtContents: editedComment
            },
            success: function(response) {
                if (response.success) {
                    var editedCommentText = response.editedComment.cmtContents;
                    var commentToUpdate = $(".edit-comment-button[data-comment-id='" + commentId + "']").siblings(".comment-text");
                    commentToUpdate.text(editedCommentText);
                    $(".comment-edit-form").hide();
                } else {
                    alert("댓글 수정에 실패했습니다.");
                }
            },
            error: function() {
                alert("댓글 수정에 실패했습니다.");
            }
        });
    });
    // 댓글 추가 END

    // 수정
    $("#doUpdate").on("click", function() {
      console.log("doUpdate");
      // 제목,내용,div,mod_id(session),seq

      if (eUtil.ISEmpty($("#title").val()) == true) {
        alert("제목을 입력 하세요.");
        $("#title").focus();
        return;
      }

      if (eUtil.ISEmpty($("#contents").val()) == true) {
        alert("내용을 입력 하세요.");
        $("#contents").focus();
        return;
      }
      console.log('modId: ' + '${sessionScope.user.userId}');
      if (confirm('수정 하시겠습니까?') == false) return;

      // ajax로 비동기 통신
      $.ajax({
        type: "POST",
        url: "/post/update",
        async: "true",
        dataType: "html",
        data: {
          postTitle: $("#title").val(),
          postContents: $("#contents").val(),
          userId: '${sessionScope.user.userId}',
          postSeq: $("#seq").val()
        },
        success: function(data) { // 통신 성공
          console.log("success data:" + data);
          // 성공(1),실패

          let parsedJson = JSON.parse(data);
          if ("1" == parsedJson.msgId) {
            alert(parsedJson.msgContents);
            moveToListView();
          } else {
            alert(parsedJson.msgContents);
          }
        },
        error: function(data) { // 실패시 처리
          console.log("error:" + data);
        }
      });
    });

    // 삭제
    $("#doDelete").on("click", function() {
      console.log("doDelete");
      console.log("seq:" + $("#seq").val());
      if (confirm('삭제 하시겠습니까') == false) return;

      $.ajax({
        type: "GET",
        url: "/post/delete",
        asyn: "true",
        dataType: "html",
        data: {
          postDiv: $("#div").val(),
          postSeq: $("#seq").val()
        },
        success: function(data) { // 통신 성공
          console.log("success data:" + data);
          // 성공, 실패
          // 성공->board_list.jsp로 이동
          let parsedJson = JSON.parse(data);
          if ("1" == parsedJson.msgId) {
            alert(parsedJson.msgContents);
            moveToListView();
          } else {
            alert(parsedJson.msgContents);
          }
        },
        error: function(data) { // 실패시 처리
          console.log("error:" + data);
        }
      });
    });

    // 추천하기
    $("#doRecommend").on("click", function() {
      console.log("doRecommend");
      $.ajax({
        type: "GET",
        url: "/post/recommend",
        asyn: "true",
        dataType: "html",
        data: {
          postDiv: $("#div").val(),
          postSeq: $("#seq").val()
        },
        success: function(data) { // 통신 성공
          console.log("success data:" + data);
          // 성공, 실패
          // 성공->board_list.jsp로 이동
          let parsedJson = JSON.parse(data);
          if ("1" == parsedJson.msgId) {
            alert(parsedJson.msgContents);
            moveToListView();
          } else {
            alert(parsedJson.msgContents);
          }
        },
        error: function(data) { // 실패시 처리
          console.log("error:" + data);
        }
      });
    });
    // 추천하기 끝

    function moveToListView() {
      window.location.href = "/post?div=" + $("#div").val();
    }

    $("#moveToList").on("click", function() {
      if (confirm('목록 화면으로 이동 하시겠습니까?') == false) return;

      moveToListView();
    });

    $("#doSave").on("click", function() {
      console.log("doSave");

      let frmTitle = document.reg_frm.title.value;
      console.log("frmTitle:" + frmTitle);

      // class로 선택
      let sTitle = document.querySelector(".title_cls").value;
      // class값으로 값 가지고 오기

      console.log("sTitle:" + sTitle);

      if (eUtil.ISEmpty($("#regId").val()) == true) {
        alert("등록자를 입력하세요.");
        $("#regId").focus();
        return;
      }

      if (eUtil.ISEmpty($("#contents").val()) == true) {
        alert("내용을 입력하세요.");
        $("#contents").focus();
        return;
      }

      // confirm
      if (confirm('등록 하시겠습니까') == false) return;

      // ajax
      $.ajax({
        type: "POST",
        url: "/post/save",
        asyn: "true",
        dataType: "html",
        data: {
          postDiv: $("#div").val(),
          postTitle: $("#title").val(),
          userId: $("#regId").val(),
          postContents: $("#contents").val()
        },
        success: function(data) { // 통신 성공
          console.log("success data:" + data);
          let parsedJson = JSON.parse(data);
          // title 미 입력
          if ("10" == parsedJson.msgId) {
            alert(parsedJson.msgContents);
            $("#title").focus();
            return;
          }

          // 등록자 미 입력
          if ("20" == parsedJson.msgId) {
            alert(parsedJson.msgContents);
            $("#regId").focus();
            return;
          }

          // 등록자 미 입력
          if ("30" == parsedJson.msgId) {
            alert(parsedJson.msgContents);
            $("#contents").focus();
            return;
          }

          if ("1" == parsedJson.msgId) {
            alert(parsedJson.msgContents);
            // javascript
            // window.location.href ="${CP}/board/boardView.do?div="+$("#div").val();
            moveToListView();
          } else {
            alert(parsedJson.msgContents);
          }
        },
        error: function(data) { // 실패시 처리
          console.log("error:" + data);
        }
      });

    });
    // --doSave
  });
</script>

</body>
</html>