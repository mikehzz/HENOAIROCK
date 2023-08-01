$('#delete-id-btn').click(function withdraw(postSeq) {
  // 탈퇴 버튼을 눌렀을 때 해당 게시물의 postSeq를 서버에 전달하여 삭제 요청
  if (confirm("정말로 삭제하시겠습니까?")) {
    // AJAX를 사용하여 서버에 삭제 요청 보내기
    $.ajax({
      url: "/post", // 서버 측에서 게시물 삭제를 처리하는 URL
      method: "POST",
      data: { postSeq: postSeq },
      success: function (data) {
        // 서버에서 성공적으로 처리한 후에 클라이언트에서 행 삭제
        // 해당 postSeq를 가지고 있는 행을 찾아서 삭제합니다.
        $(`tr[data-post-seq="${postSeq}"]`).remove();
        console.log("게시물 삭제 성공");
      },
      error: function (error) {
        console.error("게시물 삭제 오류");
      },
    });
  }
})