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

    // 수정으로 이동
    $("#doUpdate").on("click", function() {
    	if (confirm('수정화면으로 이동하시겠습니까?') == false) return;
    	window.location.href = "/post/post_mng?div="+$("#div").val()+"&seq="+$("#seq").val();
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
          postSeq: $("#seq").val(),
          userId: $("#userId").val()
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
      moveToListView();
    });

  });