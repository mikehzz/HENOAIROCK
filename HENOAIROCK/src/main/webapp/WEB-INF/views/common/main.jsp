<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib  prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="CP" value="${pageContext.request.contextPath }"/>  
<!DOCTYPE html>
<html>
<head>
<meta charset="${encoding}">
<meta name="viewport" content="width=device-width, initial-scale=1">
<!-- CSS only -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
<link rel="stylesheet" type="text/css" href="/resources/css/main.css">
<!-- JavaScript Bundle with Popper -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4" crossorigin="anonymous"></script>
<script src="${CP}/resources/js/jquery-3.7.0.js"></script>
<script src="${CP}/resources/js/util.js"></script>
<script src="${CP}/resources/js/main.js"></script>
<title>음악 사이트</title>
</head>
<body>

    <div class="chat-container">
        <div class="chat-logs" id="chatLogs">
            <div class="bot-message">싸그리싺싺AI: 안녕하세요! 무엇을 도와드릴까요?</div>
        </div>
    </div>
   
    <input type="hidden" id= "userId" value="${sessionScope.userId}" name="userId" >
    
     <table>
      <thead>
        <tr>
          <th></th>
        </tr>
       </thead>
       <tbody class="table-group-divider">
       <c:choose>
          <c:when test="${not empty MsgList }">
            <c:forEach var="vo" items="${MsgList}">
                <tr>
                  <td id="chatSeq" class="chatSeq" onclick="chatContents(this)"><c:out value="${vo.chatSeq }"/></td>
                </tr>
                  
            </c:forEach>
           </c:when>
           <c:otherwise>
            <tr>
                  <td>검색 결과 없음</td>
               </tr>
           </c:otherwise>
          </c:choose>
        </tbody>
     </table>
 
      <table>
      <thead>
        <tr>
          <th></th>
        </tr>
       </thead>
       <tbody class="table-group-divider">
            <c:choose>
          <c:when test="${not empty contentsList }">
            <c:forEach var="conVO" items="${contentsList}">
                <tr>
                  <td><c:out value="${conVO.chatSeq }"/></td>
                  <td><c:out value="${conVO.chatContents }"/></td>
                </tr>
                  
            </c:forEach>
           </c:when>
           <c:otherwise>
            <tr>
                  <td>검색 결과 없음</td>
               </tr>
           </c:otherwise>
           </c:choose>
      </tbody>
     </table>
        <!-- Sidebar -->
    <aside class="sidebar" id="sidebar">
        <ul>
            <li><a href="#">홈</a></li>
            <li><a href="/mypage">마이페이지</a></li>
            <li><a href="/post">게시판</a></li>
            <li><a href="/setting">설정&#128540;</a></li>
        </ul>

    </aside>   
    
		<div id="messageContainer" class="message-container"></div>
			<input type="text" id="userInput" placeholder="대화를 입력하세요.">
			<button onclick="sendMessage()">보내기</button>

 
   
  <script>
  function sendMessage() {
	    const userInput = document.getElementById("userInput").value.trim();
	    const chatSeq = new URLSearchParams(window.location.search).get("chatSeq"); // 기존의 chatSeq를 체크
	    if (!chatSeq && userInput === "") {
	        alert("대화를 입력하세요.");
	        return;
	    }
	    if (userInput !== "") {
	        // Create a new message element and append to the container
	        const messageElement = document.createElement("div");
	        messageElement.className = "user-message";
	        messageElement.textContent = userInput;
	        document.getElementById("messageContainer").appendChild(messageElement);

	        // Clear the input field using jQuery
	        $("#userInput").val("");

	        // Scroll to the bottom of the chatLogs to show the latest message
	        const chatLogs = document.getElementById("chatLogs");
	        chatLogs.scrollTop = chatLogs.scrollHeight;

	        // Send the message to the server
	        if (chatSeq) {
	            $.ajax({
	                url: "${CP}/main/chat",
	                type: "POST",
	                data: {
	                    chatSeq: chatSeq,
	                    chatContents: userInput
	                },
	                success: function() {
	                    console.log("Message sent!");
	                    // Clear the input field
	                    document.getElementById("userInput").value = "";
	                    // Refresh the chat logs using JQuery
	                    $.get(window.location.href, function(data) {
	                        const chatLogs = document.getElementById("chatLogs");
	                        chatLogs.innerHTML = $(data).find("#chatLogs").html();
	                    });
	                },
	                error: function() {
	                    console.log("Error sending the message");
	                }
	            });
	        } else {
	            $.ajax({
	                type: "POST",
	                url: "/main/start",
	                dataType: "json", // 수정
	                data: {
	                    "userId": $('#userId').val()
	                },  
	                success: function(parsedJSON) {
	                    if (parsedJSON.msgId === "1") {
	                        alert("채팅이 시작됩니다!");
	                        // Create a new URL with the newChatSeq value
	                        const newURL = "${CP}/main/selectOne?chatSeq=" + parsedJSON.msgContents;
	                        window.location.href = newURL;
	                    } else if (parsedJSON.msgId === "2") {
	                        alert(parsedJSON.msgContents);
	                        location.reload();
	                    } else {
	                        alert(parsedJSON.msgContents);
	                        window.location.href = "${CP}/member/login";
	                    }
	                },
	                error: function(data) {
	                    console.log("Communication error");
	                }
	            });
	        }
	    }
	}
  
  function chatContents(element) {
      var chatSeqValue = element.textContent;
      console.log("Clicked chatSeq:", chatSeqValue);

      // Create a new URL with the chatSeqValue
      const newURL = "${CP}/main/selectOne?chatSeq=" + chatSeqValue;
      window.location.href = newURL;
  }

	    


  </script>
</body>
</html>