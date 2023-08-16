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
    //이미지 클릭스 음악 상세 페이지 출력
    $("#musicClick").on("click", function (e) {
		 let musicId = $('#musicId').val();
	    console.log('musicId:' + musicId);
	    // 팝업 창 열기
	    let popupUrl = "/music/music_detail/?musicId=" + musicId;
	    let popupName = "MusicDetailPopup";
	    let popupOptions = "width=800,height=600,resizable=yes,scrollbars=yes";
	    window.open(popupUrl, popupName, popupOptions);
	    
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