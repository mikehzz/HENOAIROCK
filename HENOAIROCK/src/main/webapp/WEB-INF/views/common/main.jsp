<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/admin/sidebar.jsp" %>
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
    
     <table id="boardTable">
      <thead>
        <tr>
          <th></th>
          <th style="display:none;">SEQ</th>
        </tr>
       </thead>
       <tbody class="table-group-divider">
       <c:choose>
          <c:when test="${not empty MsgList }">
            <c:forEach var="vo" items="${MsgList}">
                <tr>
                  <td style="display:none;">${vo.chatSeq}</td>
                  <td>${vo.chatDt} ${vo.chatContents}</td>
                </tr>                  
            </c:forEach>
           </c:when>
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
           </c:choose>
      </tbody>
     </table>
  
    <div id="messageContainer" class="message-container"></div>
      <input type="text" id="userInput" placeholder="대화를 입력하세요.">
      <button onclick="sendMessage()">보내기</button>

 
   
  <script>
  function sendMessage() {
      const userInput = document.getElementById("userInput").value.trim();
      console.log("user-message")
      const chatSeq = new URLSearchParams(window.location.search).get("chatSeq"); // 기존의 chatSeq를 체크
      const userMessage = userInput;
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
          if (!chatSeq) {
              // Create a new chat sequence and send the message
              $.ajax({
                  type: "POST",
                  url: "${CP}/main/start",
                  dataType: "json",
                  data: {
                      userId: $('#userId').val()
                  },
                  success: function(parsedJSON) {
                      if (parsedJSON.msgId === "1") {
                          const newChatSeq = parsedJSON.msgContents;
                          sendChatMessage(newChatSeq, userInput); // Send the message after creating a new chat sequence
                          const newURL = "${CP}/main/selectOne?chatSeq=" + newChatSeq;
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
          } else {
              sendChatMessage(chatSeq, userInput); // Send the message using the existing chat sequence
          }

          // Function to send the message
          function sendChatMessage(chatSeq, message) {
              $.ajax({
                  url: "${CP}/main/chat",
                  type: "POST",
                  data: {
                      chatSeq: chatSeq,
                      chatContents: message
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
          }

      }
  }
  
  $("#boardTable>tbody").on("click", "tr", function() {
	    let tdArray = $(this).children();
      var chatSeqValue = tdArray.eq(0).text();
      console.log("Clicked chatSeq:", chatSeqValue);

      // Create a new URL with the chatSeqValue
      const newURL = "${CP}/main/selectOne?chatSeq=" + chatSeqValue;
      window.location.href = newURL;
  });

      
  </script>
</body>
</html>