<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="author" content="User">
<title>비밀번호찾기 Page</title>
<link rel="stylesheet" type="text/css" href="/resources/css/passwd.css">
<script src="/resources/js/jquery-3.7.0.js"></script>
</head>
<body>
	<div class="container">
        <h1>RETYPE</h1>
        <form>
        
            <label for="Email">Email
            	<input type="button" value="중복확인" class="btnRe">
            </label>
            	<input type="text" id="Email" name="Email" required>
            
            
            <label for="cemail">Confirm Email
				<input type="button" value="인증번호 확인 " class="btnRe" id="mail-Confirm-Btn">
            	<input type="button" value="인증번호 전송 " class="btnRe" id="mail-Check-Btn">
			</label>
            <input placeholder="인증번호는 6자리 입니다." type="text" id="cemail" name="cemail" required>
            
            <label for="password">Password</label>
            <input placeholder="비밀번호는 8이상 12자 이하로 설정바랍니다." type="password" name="password" id="password" required />


            <label for="cpass">Confirm Password</label>
            <input type="password" name="confirm_password" id="confirm_password" required />
            <p id="password-match-message" style="font-size: 8px;color: black; display: none;">비밀번호가 일치합니다.</p>

    
            

            <button type="submit" id="register">RETYPE PASSWORD</button>

    </div>
	<script src="${CP}/resources/js/passwd.js"></script>
</body>
</html>
