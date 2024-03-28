<%@ page contentType="text/html; charset=utf-8"%>
<head>
<link rel="stylesheet" href="../resources/css/addmember.css">
<script>
	function history1() {
		window.history.back();
	}

	function checkForm() {
		if (!document.newMember.id.value) {
			alert("아이디를 입력하세요.");
			return false;
		}

		if (!document.newMember.password.value) {
			alert("비밀번호를 입력하세요.");
			return false;
		}

		if (document.newMember.password.value != document.newMember.password_confirm.value) {
			alert("비밀번호를 동일하게 입력하세요.");
			return false;
		}
	}
</script>
</head>

<body>
	<form action="processAddMember.jsp" method="post"
		onsubmit="return checkForm()">
		<div class="wrapper">
			<header class="header">
				<div class="left-triangle">
					<img style="cursor: pointer;" src="../resources/image/home.png"
						onclick="location.href='../homepage.jsp'" alt="홈">
				</div>
				<div class="right-triangle">
					<img style="cursor: pointer;" src="../resources/image/back.png"
						onclick="history1()" alt="뒤로">
				</div>
			</header>
			<span class="title-box"> 회원가입 </span>
			<div class="id-box item">
				<header> 아이디 </header>
				<section>
					<div>
						<input id="id" name="id" class="input-box" type="text"
							placeholder="아이디 입력(6~12자)">
						<button style="cursor: pointer;" type="button" class="id-check">중복
							확인</button>
					</div>

				</section>
			</div>
			<div class="password-box item">
				<header> 비밀번호 </header>
				<section>
					<div>
						<input id="password" name="password" class="input-box" type="text"
							placeholder="비밀번호 입력(9~16자, 특수문자 포함)">
					</div>
				</section>
			</div>
			<div class="password-check-box item">
				<header> 비밀번호 확인 </header>
				<section>
					<div>
						<input id="password_check" name="password_check" class="input-box"
							type="text" placeholder="비밀번호 한번더 입력">
					</div>
				</section>
			</div>
			<div class="name-box item">
				<header> 이름 </header>
				<section>
					<div>
						<input id="name" name="name" class="input-box" type="text"
							placeholder="한글과 영어, 숫자만 입력">
					</div>
				</section>
			</div>
			<div class="email-box item">
				<header> 이메일 </header>


				<!--             name부분이 원래는 mail임 수정필요 -->
				<section>
					<input id="email1" class="input-box-email1" type="text"
						name="email1"> <span>@</span> <input id="email2"
						class="input-box-email2" type="text" name="email2"
						value="naver.com">
				</section>
			</div>
			<div class="phone-box item">
				<header>
					전화번호
					<button style="cursor: pointer;" onclick="location.href='#'">인증하기</button>
				</header>

				<!--             전화번호도 원래는 name=phone 한개만 있음 생년월일도 수정필요 -->
				<section>
					<input id="phone1" class="input-box-phone1" type="text"
						name="phone1" value="010"> <span>&nbsp;-</span>
					<div class="input-box">
						<input id="phone2" class="input-box-phone2" type="text"
							name="phone2"> <span>&nbsp;-&nbsp;</span> <input
							id="phone3" class="input-box-phone3" type="text" name="phone3">
					</div>
				</section>
			</div>
			<div class="birth-box item">
				<header> 생년월일 </header>
				<section>
					<input id="birth1" class="input-box-birth1" type="text"
							name="birthyy" value="2000"> <span>&nbsp;년 </span> 
					<div class="input-box">		
						<input id="birth2" class="input-box-birth2" type="text" 
							name="birthmm" value="1"> <span>&nbsp;월 </span>

						<input id ="birth3" class="input-box-birth3" type="text"
							name="birthdd" value="1"> <span>&nbsp;일</span>
					</div>
				</section>
			</div>
			<div class="button-box">
				<button type="submit">회원가입</button>
			</div>
		</div>
		

		</div>
	</form>
</body>
