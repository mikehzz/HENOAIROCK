<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="author" content="User">
<title>비밀번호 변경 또는 찾기</title>
<link rel="stylesheet" type="text/css" href="../resources/css/passwd.css">
<script src="/resources/js/jquery-3.7.0.js"></script>
</head>
<body>
	<div id="con" class="find_pw">
		<div id="login">
			<div id="login_form">
				<!--로그인 폼-->
				<form>
				<p class="find">
					<span><a href="/member/login">로그인 페이지로 이동</a></span>
				</p>
				
					<h2>비밀번호 변경</h2>
					
					
					
            <p class="input-title">E-mail</p>
            <div class="input-wrapper">
              <label> <input type="text" class="size line-input"> 

            </label>

            </div>

					<!--이메일 인증번호 입력-->
          <input type="button" value="인증번호 전송 " class="btnRe" id="mail-Check-Btn">
          <input type="button" value="인증번호 확인 " class="btnRe" id="mail-Confirm-Btn">
          
          <p class="input-title">E-mail 인증번호 입력</p>
          
          <label>
           <input type="text" class="size line-input numberOnly" name="checkInput" id="checkInput" maxlength="6" required> 
          </label>
          
					<!--비밀번호-->
					<p class="input-title">새로운 Password</p>
					<label for="password">
						<input placeholder="비밀번호는 8이상 12자 이하로 설정바랍니다." type="password"
							class="size line-input" id="password" name="password" required>
						<span class="error-message" id="password_error"></span>
					</label>

					<!--비밀번호 확인-->
					<p class="input-title">새로운 Password확인</p>
					<label for="confirm_password">
						<input type="password" class="size line-input" id="confirm_password" name="confirm_password"
							required oninput="validateForm()">
						<span class="error-message" id="confirm_password_error"></span>
					</label>

					<p>
						<input id="register" type="submit" value="비밀번호 변경" class="Creative">
					</p>
				</form>
			</div>
		</div>
	</div>
	<script src="${CP}/resources/js/passwd.js"></script>
</body>
</html>
