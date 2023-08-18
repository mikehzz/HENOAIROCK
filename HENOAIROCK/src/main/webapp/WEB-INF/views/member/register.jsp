<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="author" content="User">
<link rel="stylesheet" type="text/css" href="../resources/css/member/register.css">
<script src="/resources/js/jquery-3.7.0.js"></script>
<title>회원가입</title>
</head>
<body>
	<div id="con">
		<div id="login">
			<div id="login_form">
				<!--로그인 폼-->
				<form action="/member/register" method="post" id="register-form">
					<h2>회원가입</h2>
					
					<p class="find">
						<span><a href="/member/login">로그인 페이지로 이동</a></span>
					</p>
					
					<!--이메일-->
					<input type="button" value="중복확인" class="btnRe" onclick = "fn_idChk();" >
					<p class="input-title">E-mail</p>
					<div class="input-wrapper">
						<label>
							<input type="email" name="userId" id="userId" class="size line-input" required="required"> 
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
					<p class="input-title">Password</p>
					<label for="password">
						<input placeholder="비밀번호는 8이상 12자 이하로 설정바랍니다." type="password" class="size line-input" id="password" name="password" required>
						<span class="error-message" id="password_error"></span>
					</label>

					<!--비밀번호 확인-->
					<p class="input-title">Password확인</p>
					<label for="confirm_password">
						<input type="password" class="size line-input" id="confirm_password" name="confirm_password" required oninput="validateForm()">
						<span class="error-message" id="confirm_password_error"></span>
					</label>

					<!--이름-->
					<p class="input-title">이름</p>
					<label>
						<input type="text" class="size line-input" id="name" name="name" required>
					</label>
					
					<!--생년월일-->
					<p class="input-title">생년월일</p>
					<label>
						<input type="date" class="size line-input" id="birth" name="birth" required>
					</label>

					<!--이용약관동의-->
					<p class="h-zero input-title">
						이용약관동의 <span><a href="agree.html">[이용약관 자세히 읽기]</a></span>
					</p>

					<!-- 메일수신 -->
					<p class="input-chek">
						<input checked="checked" type="radio" name="agree" value="Y" id="m_y" required>
						<label for="m_y">동의</label>
						<input type="radio" name="agree" value="N" id="m_n" required>
						<label for="m_n">비동의 (이용 불가)</label>
					</p>

					<!-- 버튼 -->
					<p>
						<input id="register" type="submit" value="Create Account" class="Creative">
					</p>
				</form>
			</div>
		</div>
	</div>
	<script src="${CP}/resources/js/member/register.js"></script>
</body>
</html>
