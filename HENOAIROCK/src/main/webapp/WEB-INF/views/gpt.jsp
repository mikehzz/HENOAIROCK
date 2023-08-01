<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib  prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="CP" value="${pageContext.request.contextPath }"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<!-- CSS only -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
<!-- JavaScript Bundle with Popper -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4" crossorigin="anonymous"></script>
<script src="${CP}/resources/js/jquery-3.7.0.js"></script>
<script src="${CP}/resources/js/util.js"></script>
    <title>GPT Sidebar</title>
  <style>
  body {
    margin: 0;
    padding: 0;
    font-family: Arial, sans-serif;
}

.sidebar {
    position: fixed;
    top: 0;
    left: 0;
    width: 250px;
    height: 100%;
    background-color: #f0f0f0;
    padding: 20px;
    box-sizing: border-box;
}

.sidebar h2 {
    margin-bottom: 20px;
}

.sidebar ul {
    list-style: none;
    padding: 0;
}

.sidebar li {
    margin-bottom: 10px;
}

.sidebar a {
    text-decoration: none;
    color: #333;
    display: block;
    padding: 5px;
    border-radius: 5px;
}

.sidebar a:hover {
    background-color: #ddd;
}

.content {
    margin-left: 270px; /* Sidebar width + some space */
    padding: 20px;
}

.sidebar.active {
    margin-left: 0;
    transition: margin-left 0.3s ease-in-out;
}

.toggle-btn {
    position: fixed;
    top: 20px;
    left: 20px;
    padding: 10px;
    background-color: #007bff;
    color: #fff;
    border: none;
    border-radius: 5px;
    cursor: pointer;
}

/* 미디어 쿼리를 사용하여 화면이 작아질 때 사이드바가 보이도록 합니다. */
@media (max-width: 768px) {
    .sidebar {
        margin-left: -270px;
        transition: margin-left 0.3s ease-in-out;
    }

    .sidebar.active {
        margin-left: 0;
    }

    .content {
        margin-left: 0;
    }
}
.sidebar-header {
    display: flex;
    align-items: center;
    justify-content: space-between;
    margin-bottom: 20px;
}
.new-chat-btn {
    background-color: #5cb85c;
    color: #fff;
    border: none;
    padding: 10px 15px;
    border-radius: 5px;
    cursor: pointer;
    margin-right: 10px;
}
        body {
            font-family: Arial, sans-serif;
            line-height: 1.6;
            max-width: 800px;
            margin: 0 auto;
            padding: 20px;
        }

        .chat-container {
            display: flex;
        }

        .chat-logs {
            flex: 1;
            border: 1px solid #ccc;
            padding: 10px;
            max-height: 400px;
            overflow-y: auto;
        }

        .user-message {
            text-align: right;
            color: #007bff;
        }

        .bot-message {
            text-align: left;
            color: #28a745;
        }

        .user-input {
            display: flex;
            margin-top: 10px;
        }

        .user-input input {
            flex: 1;
            padding: 5px;
        }

        .user-input button {
            padding: 5px 10px;
            background-color: #007bff;
            color: #fff;
            border: none;
            cursor: pointer;
        }
    .viewbox {
        position: relative;
    top: 20px;
    right: 20px;
    perspective: 1000px;
}
</style>
</head>



<body>
    <!-- Open Sidebar Button -->
    <!--<button class="open-btn" onclick="openSidebar()">사이드바 열기</button> -->

    <!-- Sidebar -->
    <aside class="sidebar" id="sidebar">
        <div class="sidebar-header">
            <!-- New Chat Button -->
            <button class="new-chat-btn" onclick="openNewChat()">New Chat</button>
            <h2>GPT Sidebar</h2>
            <!-- Close Sidebar Button -->
            <!-- <button class="close-btn" onclick="closeSidebar()">Close Sidebar</button> -->
        </div>
        <ul>
            <li><a href="#">홈</a></li>
            <li><a href="/mypage/main">마이페이지</a></li>
            <li><a href="#">게시판</a></li>
            <li><a href="#">설정</a></li>
        </ul>
        <div class="user-info">
            <h3>User Information</h3>
            <p>Name: John Doe</p>
            <p>Email: johndoe@example.com</p>
        </div>
    </aside>

    <!-- Content -->
    <h1>싸그리싺싺AI 페이지</h1>

    <div class="chat-container">
        <div class="chat-logs" id="chatLogs">
            <div class="bot-message">싸그리싺싺AI: 안녕하세요! 무엇을 도와드릴까요?</div>
        </div>
    </div>
    <div class="user-input">
        <input type="text" id="userInput" placeholder="메시지를 입력하세요...">
        <button onclick="sendMessage()">전송</button>
    </div>

    <script>
        //function openSidebar() {
            //var sidebar = document.getElementById('sidebar');
            //sidebar.style.marginLeft = '0';
        //}

//function closeSidebar() {
  //  var sidebar = document.getElementById('sidebar');
    //sidebar.style.marginLeft = '-270px'; // Sidebar width + some space
//}
function openNewChat() {
    // 여기에 채팅을 열거나 필요한 동작을 추가하세요.
}
        function appendMessage(sender, message) {
            const chatLogs = document.getElementById('chatLogs');
            const messageElement = document.createElement('div');
            messageElement.textContent = sender + ': ' + message;
            if (sender === 'ChatGPT') {
                messageElement.className = 'bot-message';
            } else {
                messageElement.className = 'user-message';
            }
            chatLogs.appendChild(messageElement);
            chatLogs.scrollTop = chatLogs.scrollHeight;
        }

        function sendMessage() {
            const userInput = document.getElementById('userInput');
            const userMessage = userInput.value;
            if (userMessage.trim() !== '') {
                appendMessage('사용자', userMessage);
                userInput.value = '';
                // 여기에 ChatGPT와 상호작용하는 로직을 추가할 수 있습니다.
                // 예를 들면, fetch 또는 XMLHttpRequest를 사용하여 서버로 사용자 입력을 보내고 응답을 받을 수 있습니다.
                // 이 예제에서는 단순히 미리 정의된 응답을 보여줍니다.
                setTimeout(() => {
                    appendMessage('ChatGPT', '사용자가 입력한 메시지에 대한 응답입니다.');
                }, 1000);
            }
        }
  </script>
</body>
</html>