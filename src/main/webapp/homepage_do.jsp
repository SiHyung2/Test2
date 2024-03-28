<%@ page contentType="text/html; charset=utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.util.*"%>
<%@ page import="mvc.model.BoardDTO"%>
<html>
<head>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65"
	crossorigin="anonymous">
<!-- <link rel="stylesheet" href="./resources/css/bootstrap.min.css" /> -->
<!-- 구글 폰트 link -->
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com">
<link href='//spoqa.github.io/spoqa-han-sans/css/SpoqaHanSansNeo.css'
	rel='stylesheet' type='text/css'>
<link href="https://fonts.googleapis.com/css2?family=Anta&display=swap"
	rel="stylesheet">
<link href="https://fonts.googleapis.com/css2?family=Gugi&display=swap"
	rel="stylesheet">
<title>MINECRAFT COMMUNITY</title>
<!-- css 모음 -->
<link rel="stylesheet"
	href="./resources/css/homepage/homepage_layout.css">
<link rel="stylesheet" href="./resources/css/homepage/main.css">
<link rel="stylesheet" href="./resources/css/homepage/login.css">
<link rel="stylesheet" href="./resources/css/homepage/carousel.css">
<link rel="stylesheet" href="./resources/css/homepage/search.css">
<link rel="stylesheet" href="./resources/css/homepage/link.css">
<link rel="stylesheet" href="./resources/css/homepage/popular.css">
<link rel="stylesheet" href="./resources/css/homepage/freedom.css">
<link rel="stylesheet" href="./resources/css/homepage/notification.css">
<link rel="stylesheet" href="./resources/css/homepage/information.css">
<link rel="stylesheet" href="./resources/css/homepage/game.css">
<!-- 캐러셀 js모음(나머지 한개는 밑에) -->
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/swiper@11/swiper-bundle.min.css" />
<script
	src="https://cdn.jsdelivr.net/npm/swiper@11/swiper-bundle.min.js"></script>

</head>


<!-- 컨트롤러와 상호작용하는 값들 -->
<%
List Popular_boardList = (List) request.getAttribute("Popular_boardlist");
int Popular_total_record = ((Integer) request.getAttribute("Popular_total_record")).intValue();
int Popular_pageNum = ((Integer) request.getAttribute("Popular_pageNum")).intValue();
int Popular_total_page = ((Integer) request.getAttribute("Popular_total_page")).intValue();

List Freedom_boardList = (List) request.getAttribute("Freedom_boardlist");
int Freedom_total_record = ((Integer) request.getAttribute("Freedom_total_record")).intValue();
int Freedom_pageNum = ((Integer) request.getAttribute("Freedom_pageNum")).intValue();
int Freedom_total_page = ((Integer) request.getAttribute("Freedom_total_page")).intValue();

List Game_boardList = (List) request.getAttribute("Game_boardlist");
int Game_total_record = ((Integer) request.getAttribute("Game_total_record")).intValue();
int Game_pageNum = ((Integer) request.getAttribute("Game_pageNum")).intValue();
int Game_total_page = ((Integer) request.getAttribute("Game_total_page")).intValue();

List Information_boardList = (List) request.getAttribute("Information_boardlist");
int Information_total_record = ((Integer) request.getAttribute("Information_total_record")).intValue();
int Information_pageNum = ((Integer) request.getAttribute("Information_pageNum")).intValue();
int Information_total_page = ((Integer) request.getAttribute("Information_total_page")).intValue();

List Notification_boardList = (List) request.getAttribute("Notification_boardlist");
int Notification_total_record = ((Integer) request.getAttribute("Notification_total_record")).intValue();
int Notification_pageNum = ((Integer) request.getAttribute("Notification_pageNum")).intValue();
int Notification_total_page = ((Integer) request.getAttribute("Notification_total_page")).intValue();
%>



<body>

	<!-- 중간 태그 section,  양옆 태그 aside -->
	<div class="wrapper">
		<jsp:include page="./main.jsp" />
		<aside id="login">




			<!-- 			(loginId != null)일때 보여주는 화면과 else일 때 보여주는 화면을 나누어서 설계하자 -->



			<div>
				<%
				String msg = request.getParameter("msg");

				String loginId = (String) session.getAttribute("sessionId");
				if (loginId != null) {
					// 					out.println(" <h2>" + loginId + "님 </h2>");
				%>
				<div class="line_1st_after_after" style="border-bottom: 10px solid rgb(95, 4, 176, 0.3);"><h1><%=loginId %></h1></div>
				<br/>
				<div class="line_2nd_after_login d-flex">
					<div>
						&nbsp;&nbsp;&nbsp;<img style="cursor: pointer;"
							src="resources/image/profile_icon.png"
							onclick="location.href='myprofile.jsp'" alt="프로필">
					</div>
					<div style="margin-left:100px; margin-top:0px; font-size:20px; font-weight:700;">
						<a class="nav-link"
						href="<c:url value="./member/logoutMember.jsp"/>">로그아웃 </a>
					</div>
					
				</div>
				<div class="line_3rd_before_login">
				</div>
				<%
				} else {
				%>

				<div class="line_1st_before_login">마인 커뮤 로그인</div>
				<div class="line_2nd_before_login">
					<%
					String error = request.getParameter("error");
					if (error != null) {
						out.println("<script>alert('아이디와 비밀번호를 확인해 주세요');</script>");
					}
					%>
					<!-- 					form문을 쓰면 2줄이 되기때문에 인라인 시트로 수정해준다 -->
					<form action="./member/processLoginMember.jsp" method="post"
						style="display: flex; padding-bottom: -50px">

						<div id="login_input" style="width: 70px; margin-right: 110px;">
							<div>
								<input type="text" placeholder="ID" name='id' required autofocus>
							</div>
							<div>
								<input type="password" placeholder="Password" name='password'
									required>
							</div>
						</div>
						<button id="login_btn" type="submit" style="width: 60px;">login</button>
					</form>
				</div>
				<div class="line_3rd_before_login">
					<div>
						<a href="./member/addMember.jsp">회원가입</a>
					</div>
					<div>
						<a href="find.jsp"> 아이디 비밀번호 찾기</a>
					</div>
				</div>

			</div>


			<%
			}
			%>
		</aside>
		<section id="carousel">
			<!-- Swiper 캐러셀-->
			<div class="swiper mySwiper">
				<div class="swiper-wrapper">
					<!-- 게시판 사진만 각 슬라이드에 넣고 사진을 누르면 해당 게시판으로 이동하도록 만들기 -->
					<div class="swiper-slide">
						<!-- 해당 ID의 게시물로 이동 -->
						<img style="cursor: pointer;"
							src="./resources/image/img_post1.jpg" alt="이미지 없음"
							onclick="location.href='post.html'">
					</div>
					<div class="swiper-slide">
						<img style="cursor: pointer;" src="./resources/image/pizza.jpg"
							alt="이미지 없음" onclick="location.href='post.html'">
					</div>
					<div class="swiper-slide">
						<img style="cursor: pointer;" src="./resources/image/images.jpg"
							alt="이미지 없음" onclick="location.href='post.html'">
					</div>
					<div class="swiper-slide">
						<img style="cursor: pointer;"
							src="./resources/image/img_post2.jpg" alt="이미지 없음"
							onclick="location.href='post.html'">
					</div>
					<div class="swiper-slide">
						<!-- 해당 ID의 게시물로 이동 -->
						<img style="cursor: pointer;" src="./resources/image/images.jpg"
							alt="이미지 없음" onclick="location.href='post.html'">
					</div>
					<div class="swiper-slide">
						<img style="cursor: pointer;" src="./resources/image/pizza.jpg"
							alt="이미지 없음" onclick="location.href='post.html'">
					</div>
					<div class="swiper-slide">Slide 7</div>
					<div class="swiper-slide">Slide 8</div>
					<div class="swiper-slide">Slide 9</div>
				</div>
				<div class="swiper-pagination"></div>
			</div>

			<!-- 이위치에 있는 js가 캐러셀을 조정 -->
			<script>
				var swiper = new Swiper(".mySwiper", {
					slidesPerView : 4,
					grid : {
						rows : 1,
					},
					spaceBetween : 30,
					pagination : {
						el : ".swiper-pagination",
						clickable : true,
					},
				});
			</script>
		</section>
		<aside id="search">
			<div class="input-group">
				<select name="items" class="txt w-25">
					<option value="subject">제목에서</option>
					<option value="content">본문에서</option>
					<option value="name">글쓴이에서</option>
				</select> <input name="text" type="text" class="w-75" />
				<input
					style="width: 100%; background-color: darkcyan; color: white; font-size: 15px; font-weight: 700"
					type="submit" id="btnAdd" class="btn" value="검  색 " />

			</div>
		</aside>
		<aside id="link" style="height:320px;">
			<div>
				<header> QUICK LINK </header>

				<div>
					<span id="square">&nbsp;</span> <span id="server"> <!-- 일단 아무 디코 서버를 적었다 -->
						<a href="https://discord.com/invite/uzhqXw5NyK">서버1 ></a>
					</span>
				</div>
				<div>
					<span id="square">&nbsp;</span> <span id="server"> <a
						href="https://discord.com/invite/uzhqXw5NyK">서버2 ></a>
					</span>
				</div>
				<div>
					<span id="square">&nbsp;</span> <span id="server"> <a
						href="https://discord.com/invite/uzhqXw5NyK">서버3 ></a>
					</span>
				</div>
				<div>
					<span id="square">&nbsp;</span> <span id="server"> <a
						href="https://discord.com/invite/uzhqXw5NyK">서버4 ></a>
					</span>
				</div>


			</div>
		</aside>
		<section id="popular">
			<header>
				<!-- href="Noticeboard?menu=popular" 으로 적을 예정인데
              의미는 게시판의 메뉴에 인기 게시판을 누른상태로 게시판으로
              이동하기 위함이다 -->
				<div>
					<a href="<c:url value="/Popular_BoardListAction.do?pageNum=1"/>">인기
						게시판</a>
				</div>
				<div>
					<a href="<c:url value="/Freedom_BoardListAction.do?pageNum=1"/>">자유
						게시판</a>
				</div>
				<div>
					<a
						href="<c:url value="/Information_BoardListAction.do?pageNum=1"/>">정보
						게시판</a>
				</div>
			</header>
			<section>
				<aside>
					<div class="image_post">
						<!-- 해당 게시판으로 들어가도록 수정필요 -->
						<img style="cursor: pointer;"
							src="./resources/image/img_post1.jpg"
							onclick="location.href='Noticeboard.html'" alt="사진 없음">
						<div>
							<!--가장 hit가 높은 게시물의 주소를 출력-->
							<%
							int x = 0, max = 0, max_hit_of_num = 0;
							for (int j = 0; j < Popular_boardList.size(); j++) {
								BoardDTO notice = (BoardDTO) Popular_boardList.get(j);
								x = notice.getHit();
								if (x > max) {
									max = x;
									max_hit_of_num = notice.getNum();
								}
								if (j == Popular_boardList.size() - 1) {
							%>

							<a
								href="/community2/Popular_BoardViewAction.do?num=<%=max_hit_of_num%>&Popular_pageNum=<%=Popular_pageNum%>"><%=notice.getSubject()%></a>
							<%
							}
							}
							%>
						</div>
					</div>
				</aside>
				<div class="post_list">



					<table>
						<%
						for (int j = 0; j <7; j++) {
							BoardDTO notice = (BoardDTO) Popular_boardList.get(j);
						%>
						<tr>
							<td><a
								href="/community2/Popular_BoardViewAction.do?num=<%=notice.getNum()%>&Popular_pageNum=<%=Popular_pageNum%>"><%=notice.getSubject()%></a></td>
						</tr>
						<%
						}
						%>

					</table>

				</div>
			</section>
		</section>
		<aside id="notification">
			<header>
				<!-- ?를 통하여 게시판 화면의 메뉴에서 공지사항을 한채로 게시판 화면으로
                 넘겨주는 것을 추가해야함 -->
				<div>
					<a
						href="<c:url value="/Notification_BoardListAction.do?pageNum=1"/>">공지사항</a>
				</div>
			</header>
			<table>
			
			
<!-- 			스트립틀릿이나 출력부에 적힌 값은 태그만 적용되고 css가 적용이 잘 안되기에 substring()을 이용하여 -->
<!-- 			문자열을 잘라주었다  -->
				<%
				for (int j = 0; j < Notification_boardList.size(); j++) {
					BoardDTO notice = (BoardDTO) Notification_boardList.get(j);
					String subject=notice.getSubject();
					if(notice.getSubject().length()>20)
						subject=notice.getSubject().substring(0,20);
				%>
				<tr>
					<td><a class="text-dark" style=" text-decoration-line: none; margin-left:20px;"
						href="/community2/Notification_BoardViewAction.do?num=<%=notice.getNum()%>&Notification_pageNum=<%=Popular_pageNum%>">
						<%=subject%></a></td>
				</tr>
				<%
				}
				%>

			</table>
		</aside>
		<aside id="infomation">
			<!-- 		어차피 게시판 번호를 바꾸지않을 것이니 스트립틀릿 없이 주소만 입력하였다 -->
			<div>
				<div id="circle"></div>
				<a id="info_btn"
					href="Information_BoardViewAction.do?num=23&Information_pageNum=1">네더
					차원 정보 </a>
			</div>
			<div>
				<div id="circle"></div>
				<a id="info_btn"
					href="Information_BoardViewAction.do?num=25&Information_pageNum=1">엔더
					차원 정보 </a>
			</div>
			<div>
				<div id="circle"></div>
				<a id="info_btn"
					href="Information_BoardViewAction.do?num=24&Information_pageNum=1">오버
					월드 tip </a>
			</div>

		</aside>
		<section id="freedom">
			<header>
				<div>
					<a href="<c:url value="/Freedom_BoardListAction.do?pageNum=1"/>">자유
						게시판</a>
				</div>
			</header>
			<section class="d-flex">
				<div class="post_list">
					<!-- 				절반은 왼쪽 절반은 오른쪽에 게시물 출력 -->
					<table>
						<%
						for (int j = 0; j < 6; j++) {
							BoardDTO notice = (BoardDTO) Freedom_boardList.get(j);
						%>
						<tr>
							<td><a class="text-dark" style=" text-decoration-line: none;"
								href="/community2/Freedom_BoardViewAction.do?num=<%=notice.getNum()%>&Freedom_pageNum=<%=Freedom_pageNum%>"><%=notice.getSubject()%></a></td>
						</tr>
						<%
						}
						%>

					</table>
				</div>
				<div class="post_list">
					<table>
						<%
						for (int j = 6; j < 12; j++) {
							BoardDTO notice = (BoardDTO) Freedom_boardList.get(j);
						%>
						<tr>
							<td>
								<div>
									<a class="text-dark" style=" text-decoration-line: none; w-100"
										href="/community2/Freedom_BoardViewAction.do?num=<%=notice.getNum()%>&Freedom_pageNum=<%=Freedom_pageNum%>"><%=notice.getSubject()%>
									</a>
								</div>
							</td>
						</tr>
						<%
						}
						%>

					</table>
				</div>
			</section>
		</section>
		<aside id="game">
			<header>
				<div>
					<a href="<c:url value="/Game_BoardListAction.do?Game_pageNum=1"/>">게임
						게시판</a>
				</div>
			</header>
			<section>
				<div class="post_list">
					<table>
						<%
						for (int j = 0; j < Game_boardList.size(); j++) {
							BoardDTO notice = (BoardDTO) Game_boardList.get(j);
						%>
						<tr>
							<td><a class="text-dark" style=" text-decoration-line: none;"
								href="/community2/Game_BoardViewAction.do?num=<%=notice.getNum()%>&Game_pageNum=<%=Game_pageNum%>"><%=notice.getSubject()%></a></td>
						</tr>
						<%
						}
						%>

					</table>
				</div>
			</section>
		</aside>
	</div>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<p class="w-100 text-center">©️ 시형 주식회사</p>
</body>
</html>