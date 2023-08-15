function openNewChat(){
	$.ajax({
		type :"POST",
		url : "/main/start",
		dataType : "html",
		data : { 
			"userId" : $('#userId').val()
		},	
		success : function(data) {// 통신 성공
			let paredJSON = JSON.parse(data)
			if ("1" == paredJSON.msgId) {
				alert(paredJSON.msgContents);
				window.location.href = '/main/chat';
			} else if("2" == paredJSON.msgId){
				alert(paredJSON.msgContents);
				location.reload();
			} else {
				alert(paredJSON.msgContents);
				window.location.href = '/member/login';
			}
		},
		error : function(data) {// 실패시 처리
			console.log("통신 오류");
		}
	});
}