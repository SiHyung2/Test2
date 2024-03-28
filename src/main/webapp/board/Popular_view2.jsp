<%@ page contentType="text/html; charset=utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.util.*"%>
<%@ page import="mvc.model.BoardDTO"%>

<%
	BoardDTO notice = (BoardDTO) request.getAttribute("board");
	int num = ((Integer) request.getAttribute("num")).intValue();
	int nowpage = ((Integer) request.getAttribute("page")).intValue();
%>
<!-- 컨트롤러와 상호작용하는 값들 -->
<%
List Popular_boardList = (List) request.getAttribute("Popular_boardlist");
int Popular_total_record = ((Integer) request.getAttribute("Popular_total_record")).intValue();
int Popular_pageNum = ((Integer) request.getAttribute("Popular_pageNum")).intValue();
int Popular_total_page = ((Integer) request.getAttribute("Popular_total_page")).intValue();

List Information_boardList = (List) request.getAttribute("Information_boardlist");
int Information_total_record = ((Integer) request.getAttribute("Information_total_record")).intValue();
int Information_pageNum = ((Integer) request.getAttribute("Information_pageNum")).intValue();
int Information_total_page = ((Integer) request.getAttribute("Information_total_page")).intValue();

%>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script>
	$(function() {
		$('.popular_information_section > div').hide();
		$('.popular_information_header a').click(function() {
			$('.popular_information_section > div').hide().filter(this.hash).fadeIn();
			$('.popular_information_header a').removeClass('active');
			$(this).addClass('active');
			return false;
		}).filter(':eq(0)').click();
	});
</script>

<html>
<head>
<link rel="stylesheet" href="./resources/css/bootstrap.min.css" />
<link href='//spoqa.github.io/spoqa-han-sans/css/SpoqaHanSansNeo.css'
	rel='stylesheet' type='text/css'>


<style>


/* 레이아웃 */
.wrapper {
	display: grid;
	grid-template-columns: 490px 905px 490px;
	grid-template-rows: 200px 70px 300px 400px 130px;
}

.main {
	grid-area: 1/1/2/4;
}

.real_time {
	grid-area: 2/1/4/2;
}
.popular_information {
	grid-area: 4/1/6/2;
}
.main_content{
	grid-area: 2/2/5/4;
	border:1px solid blue;
}
.footer_buttons{
	grid-area: 5/2/6/4;
	border:1px solid red;
}




*{
	border:1px solid gray;
}
/* 메뉴 css */
menu{
	position:absolute;
	top:0px;
	left:0px;
	z-index:10;
    margin: 0;
    padding: 0;
/*     float: left; */
    margin-right: -260px;
}
menu>.container{
    padding: 30px;
    width: 200px;
    transform:translateX(-170px);
    height: 100vw;
    font-size: 17;
    font-weight: 800;
    color: rgb(0, 0, 0);
    background-color: rgba(0, 0, 0, 0.021);
    text-align: right;
}
menu .li-item{
    list-style: none;
    transform: translateX(-150px);
    padding: 15px;

}
menu .container:hover{
    transform: translateX(-10px);
    transition: 1s;
    text-align: center;
    background-color: lightcyan;
}
menu .container:hover .li-item{
    animation-name: menu-ani;
    animation-duration: 1s;
    animation-fill-mode: forwards;

}
@keyframes menu-ani{
    0%{
        transform: translateX(-100px);
    }
    50%{
        transform: translateX(70px) skew(-30deg, 0deg);
    }
    100%{
        transform: translateX(-20px) skew(0deg, 0deg);
    }
}


/*main css */
.main>header {
	width: 100%;
	height: 60%;
	padding: 15px 15px 15px 15px; /*  글자 세로 정렬을 위해 */
	text-align: center;
	background-color: rgb(236, 199, 192);
	border-bottom: 5px solid rgb(243, 217, 210);
}

.main>header a {
	color: #333333;
	font-family: 'Spoqa Han Sans Neo', 'sans-serif';
	font-weight: 700;
	font-style: normal;
	font-size: 45px;
	font-weight: 500;
	padding-left: 150px;
	text-decoration-line: none; /* a태그 밑줄 제거*/
}
.main img {
	width: 40px;
	height: 40px;
	float: right;
	margin-right: 80px;
	margin-top: 15px;
	background-color: transparent;
}


	
	
/* 실시간 인기 게시판 상자 */
.real_time>div {
	width: 350px;
	height: 300px;
	margin: 50px 0px 0px 90px;
}

.real_time_header {
	width: 100%;
	height: 10%;
	background-color: lightgray;
	border-left: 3px solid lightgray;
	border-top: 3px solid lightgray;
	border-right: 3px solid lightgray;
}

.real_time_header>div {
	width: 230px;
	height: 100%;
	font-size: large;
	font-weight: 500;
	color: rgb(53, 104, 134);
	text-align: center;
	background-color: white;
}

.real_time_section {
	width: 100%;
	height: 90%;
	border-left: 3px solid lightgray;
	border-bottom: 3px solid lightgray;
	border-right: 3px solid lightgray;
}

.real_time_section>div {
	width: (100% -20px);
	height: 49px;
	font-size: large;
	font-style: italic;
	/* 글자 세로 정렬 */
	display: flex;
	align-items: center;
	padding-left: 40px;
}

.real_time_section>div a {
	color: black;
	/*     text-decoration-line: none; /* a태그 밑줄 제거*/
	*/
}

/* 인기게시판과 정보게시판을 보여주는  */
/* 탭 메뉴 */
.popular_information>div {
	width: 350px;
	height: 300px;
	margin: 100px 0px 0px 90px;
	/*  		border: 1px solid red;  */
}

.popular_information ul, li {
	margin: 0;
	padding: 0;
	list-style: none;
}

.popular_information_header {
	font-size: 0;
	width: 350px;
	border: 3px solid lightgray;
}

.popular_information_header li {
	display: inline-block;
	height: 46px;
	text-align: center;
	border-right: 3px solid lightgray;
}

.popular_information_header li a:before {
	content: "";
	position: absolute;
	z-index:-10;
	left: 0;
	top: 0px;
	width: 100%;
	height: 3px;
}
.popular_information_header li a.active:before {
	background: rgb(53, 104, 134);
}

.popular_information_header li a.active {
	border-bottom: 3px solid #fff;
}

.popular_information_header li a {
	position: relative;
	display: block;
	background: #f8f8f8;
	color: #000;
	padding: 0 30px;
	line-height: 46px;
	text-decoration: none;
	font-size: 16px;
}

.popular_information_header li a:hover, .popular_information_header li a.active {
	background: #fff;
	color: rgb(53, 104, 134);
}

.popular_information_section {
	width: 350px;
	padding: 20px;
	height: 244px;
	border: 3px solid lightgray;
	border-top: none;
}
.popular_information_section a{
	color: black; 
	margin-left:15px;
}
.popular_information_section #tab01>div{
	height:45px;
}
.popular_information_section #tab02>div{
	height:45px;
}


.footer_buttons>div{
	height:100px;
	border:2px solid yellowgreen;
}

.footer_buttons next_page_button{
	height:100px;
	background-color:lightgray;
	border:2px solid purple;
}

.footer_buttons before_page_button{
	height:50px;
	background-color:lightgray;
	border:2px solid purple;
}
	
	
</style>


<title>Board</title>
</head>
<body>


		<menu>
			<div class="container">
			<div>
				<h3>MENU</h3>
			</div>
			<ul class="li-con">
				<li style="cursor: pointer;" class="li-item"
					onclick="location.href='<c:url value="/homepage_do.do?pageNum=1"/>'">홈페이지</li>
				<li style="cursor: pointer;" class="li-item"
				    onclick="location.href='<c:url value='myprofile.jsp'/>'">프로필</li>
				<li style="cursor: pointer;" class="li-item"
					onclick="location.href='<c:url value="/Popular_BoardListAction.do?pageNum=1"/>'">인기<br>
					게시판
				</li>
				<li style="cursor: pointer;" class="li-item"
					onclick="location.href='<c:url value="/Freedom_BoardListAction.do?pageNum=1"/>'">자유<br>
					게시판
				</li>
				<li style="cursor: pointer;" class="li-item"
					onclick="location.href='<c:url value="/Information_BoardListAction.do?pageNum=1"/>'">정보<br>
					게시판
				</li>
				<li style="cursor: pointer;" class="li-item"
					onclick="location.href='<c:url value="/Information_BoardListAction.do?pageNum=1"/>'">게임<br>
					게시판
				</li>
				<li style="cursor: pointer;" class="li-item"
					onclick="location.href='<c:url value="/Notification_BoardListAction.do?pageNum=1"/>'">공지사항</li>
			</ul>
		</div>
	</menu>
	
	<div class="wrapper">
		<header class="main">
			<header>
				<div>
					<!-- 				컨텍스트에 맞게 주소를 입력해야하므로 myprofile.jsp에 c:url을 사용함 -->
					<a href="homepage_do.do?pageNum=1">MINECRAFT COMMUNITY</a> <img
						type="button" src="resources/image/hamburger_icon.png"
						onclick="location.href='<c:url value="myprofile.jsp"/>'" alt="=">
				</div>
			</header>
		</header>
		
		<aside class="real_time">
			<div>
				<header class="real_time_header">
					<div>실시간 인기 게시판</div>
				</header>
				<section class="real_time_section">
					<!--hit가 높은 게시물을 배열에 순서대로 담는 반복문들이다-->
					<%
					int[] hit_rank = { 0, 0, 0, 0, 0 };
					int[] num_rank = { 0, 0, 0, 0, 0 };
					String[] subject_rank = { "", "", "", "", "" };
					for (int j = 0; j < Popular_boardList.size(); j++) {
						notice = (BoardDTO) Popular_boardList.get(j);
						if (notice.getHit() > hit_rank[0]) {
							hit_rank[0] = notice.getHit();
							num_rank[0] = notice.getNum();
							subject_rank[0] = notice.getSubject();
						}
					}
					for (int i = 0; i < 4; i++) {
						for (int j = 0; j < Popular_boardList.size(); j++) {
							notice = (BoardDTO) Popular_boardList.get(j);
							// 							조건문 : 그전 등수보다 작은 값 중 가장 크다 && 그전 등수의 게시물이 아닐 것
							if (notice.getHit() > hit_rank[i + 1] & hit_rank[i] >= notice.getHit() & num_rank[i] != notice.getNum()) {
						hit_rank[i + 1] = notice.getHit();
						num_rank[i + 1] = notice.getNum();
						subject_rank[i + 1] = notice.getSubject();
							}
							//					디버그용 코드
							// 							if(i+1==2)
							// 								out.println("/////hit : "+notice.getHit()+"       num : "+notice.getNum() +"  최대hit : "+hit_rank[i+1]+"  최대의num : "+num_rank[i+1]);
						}
					}
					%>


					<!-- 출력부때문에 overflow가 적용되지않아서 문자열을 잘라준다 -->
					<%
					for (int j = 0; j < 5; j++) {
						if (subject_rank[j].length() > 15)
							subject_rank[j] = subject_rank[j].substring(0, 15);
					}
					%>
					<div>
						1.&nbsp; <span> <a
							href="/community2/Popular_BoardViewAction.do?num=<%=num_rank[0]%>&Popular_pageNum=<%=Popular_pageNum%>"><%=subject_rank[0]%></a>
						</span>
					</div>
					<div>
						2.&nbsp; <span> <a
							href="/community2/Popular_BoardViewAction.do?num=<%=num_rank[1]%>&Popular_pageNum=<%=Popular_pageNum%>"><%=subject_rank[1]%></a>
						</span>
					</div>
					<div>
						3.&nbsp; <span> <a
							href="/community2/Popular_BoardViewAction.do?num=<%=num_rank[2]%>&Popular_pageNum=<%=Popular_pageNum%>"><%=subject_rank[2]%></a>
						</span>
					</div>
					<div>
						4.&nbsp; <span> <a
							href="/community2/Popular_BoardViewAction.do?num=<%=num_rank[3]%>&Popular_pageNum=<%=Popular_pageNum%>"><%=subject_rank[3]%></a>
						</span>
					</div>
					<div>
						5.&nbsp; <span> <a
							href="/community2/Popular_BoardViewAction.do?num=<%=num_rank[4]%>&Popular_pageNum=<%=Popular_pageNum%>"><%=subject_rank[4]%></a>
						</span>
					</div>


				</section>
			</div>
		</aside>
		
		<aside class="popular_information" >
			<div>
			<ul class="popular_information_header">
				<li><a href="#tab01">인기게시판</a></li>
				<li><a href="#tab02">정보게시판</a></li>
			</ul>
			<div class="popular_information_section">
				<!--여기 탭 메뉴의 게시물들은 가장 최신의 게시물 5개만 보여준다 -->
					<div id="tab01">
						<!--num이 높은 게시물을 배열에 순서대로 담는 반복문들이다-->
	       				<!--즉, 가장 최신의 게시물을 찾는 반복문이다 -->
						<%
						int[] num_newest = { 0, 0, 0, 0, 0 };
						String[] subject_newest = { "", "", "", "", "" };
						for (int j = 0; j < Popular_boardList.size(); j++) {
							notice = (BoardDTO) Popular_boardList.get(j);
							if (notice.getNum() > num_newest[0]) {
								num_newest[0] = notice.getNum();
								subject_newest[0] = notice.getSubject();
							}
						}
						
						for (int i = 0; i < 4; i++) {
							for (int j = 0; j < Popular_boardList.size(); j++) {
								notice = (BoardDTO) Popular_boardList.get(j);
								// 조건문 : 그전 등수보다 작은 값 중 가장 크다 
								if (notice.getNum() > num_newest[i + 1] & num_newest[i] > notice.getNum() ) {
									num_newest[i + 1] = notice.getNum();
									subject_newest[i + 1] = notice.getSubject();
								}
								//					디버그용 코드
								// 							if(i+1==2)
								// 								out.println("/////hit : "+notice.getHit()+"       num : "+notice.getNum() +"  최대hit : "+hit_rank[i+1]+"  최대의num : "+num_rank[i+1]);
							}
						}
						%>
						
						<!-- 출력부때문에 overflow가 작동하지않으므로 문자열을 잘라준다 -->
						<%
						for (int j = 0; j < 5; j++) {
							if (subject_newest[j].length() > 20)
								subject_newest[j] = subject_newest[j].substring(0, 20);
						}
						%>
						<div>
							<span>
								<a class="text-dark"
								style="text-decoration-line: none;"
								href="./Popular_BoardViewAction.do?num=<%=num_newest[0]%>&Popular_pageNum=<%=Popular_pageNum%>"><%=subject_newest[0]%></a>
							</span>
						</div>
						<div>
							<span>
								<a class="text-dark"
								style="text-decoration-line: none;"
								href="./Popular_BoardViewAction.do?num=<%=num_newest[1]%>&Popular_pageNum=<%=Popular_pageNum%>"><%=subject_newest[1]%></a>
							</span>
						</div>
						<div>
							<span>
								<a class="text-dark"
								style="text-decoration-line: none;"
								href="./Popular_BoardViewAction.do?num=<%=num_newest[2]%>&Popular_pageNum=<%=Popular_pageNum%>"><%=subject_newest[2]%></a>
							</span>
						</div>
						<div>
							<span>
								<a class="text-dark"
								style="text-decoration-line: none;"
								href="./Popular_BoardViewAction.do?num=<%=num_newest[3]%>&Popular_pageNum=<%=Popular_pageNum%>"><%=subject_newest[3]%></a>
							</span>
						</div>
						<div>
							<span>
								<a class="text-dark"
								style="text-decoration-line: none;"
								href="./Popular_BoardViewAction.do?num=<%=num_newest[4]%>&Popular_pageNum=<%=Popular_pageNum%>"><%=subject_newest[4]%></a>
							</span>
						</div>
					</div>
				
					<div id="tab02">
						<!--num이 높은 게시물을 배열에 순서대로 담는 반복문들이다-->
	       				<!--즉, 가장 최신의 게시물을 찾는 반복문이다 -->
						<%
						int[] num_newest2 = { 0, 0, 0, 0, 0 };
						String[] subject_newest2 = { "", "", "", "", "" };
						for (int j = 0; j < Information_boardList.size(); j++) {
							notice = (BoardDTO) Information_boardList.get(j);
							if (notice.getNum() > num_newest2[0]) {
								num_newest2[0] = notice.getNum();
								subject_newest2[0] = notice.getSubject();
							}
						}
					
						for (int i = 0; i < 4; i++) {
							for (int j = 0; j < Information_boardList.size(); j++) {
								notice = (BoardDTO) Information_boardList.get(j);
								// 조건문 : 그전 등수보다 작은 값 중 가장 크다 
								if (notice.getNum() > num_newest2[i + 1] & num_newest2[i] > notice.getNum() ) {
									num_newest2[i + 1] = notice.getNum();
									subject_newest2[i + 1] = notice.getSubject();
								}
								//					디버그용 코드
								// 							if(i+1==2)
								// 								out.println("/////hit : "+notice.getHit()+"       num : "+notice.getNum() +"  최대hit : "+hit_rank[i+1]+"  최대의num : "+num_rank[i+1]);
						}
						}
						%>
						
						<!-- 출력부때문에 overflow가 작동하지않으므로 문자열을 잘라준다 -->
						<%
						for (int j = 0; j < 5; j++) {
							if (subject_newest2[j].length() > 20)
								subject_newest2[j] = subject_newest2[j].substring(0, 20);
						}
						%>
						<div>
						<span>
							<a class="text-dark"
							style="text-decoration-line: none;"
							href="./Information_BoardViewAction.do?num=<%=num_newest2[0]%>&Information_pageNum=<%=Information_pageNum%>"><%=subject_newest2[0]%></a>
						</span>
						</div>
						<div>
							<span>
								<a class="text-dark"
								style="text-decoration-line: none;"
								href="./Information_BoardViewAction.do?num=<%=num_newest2[1]%>&Information_pageNum=<%=Information_pageNum%>"><%=subject_newest2[1]%></a>
							</span>
						</div>
						<div>
							<span>
								<a class="text-dark"
								style="text-decoration-line: none;"
								href="./Information_BoardViewAction.do?num=<%=num_newest2[2]%>&Information_pageNum=<%=Information_pageNum%>"><%=subject_newest2[2]%></a>
							</span>
						</div>
						<div>
							<span>
								<a class="text-dark"
								style="text-decoration-line: none;"
								href="./Information_BoardViewAction.do?num=<%=num_newest2[3]%>&Information_pageNum=<%=Information_pageNum%>"><%=subject_newest2[3]%></a>
							</span>
						</div>
						<div>
							<span>
								<a class="text-dark"
								style="text-decoration-line: none;"
								href="./Information_BoardViewAction.do?num=<%=num_newest2[4]%>&Information_pageNum=<%=Information_pageNum%>"><%=subject_newest2[4]%></a>
							</span>
						</div>
					</div>
				</div>
			</div>
		</aside>
		
		
		<div class="main_content">
			<form name="newUpdate"
				action="Popular_BoardUpdateAction.do?num=<%=notice.getNum()%>&Popular_pageNum=<%=nowpage%>"
				class="form-horizontal" method="post">
					<div class="form-group row">
						<label class="col-sm-2 control-label" >성명</label>
						<div class="col-sm-3">
							<input name="name" class="form-control"	value="<%=notice.getName()%>">
						</div>
					</div>
					<div class="form-group row">
						<label class="col-sm-2 control-label" >제목</label>
						<div class="col-sm-5">
							<input name="subject" class="form-control"	value="<%=notice.getSubject()%>" >
						</div>
					</div>
					<div class="form-group row">
						<label class="col-sm-2 control-label" >내용</label>
						<div class="col-sm-8" style="word-break: break-all;">
							<textarea name="content" class="form-control" cols="50" rows="5"><%=notice.getContent()%></textarea>
						</div>
					</div>
					<div class="form-group row">
						<div class="col-sm-offset-2 col-sm-10 ">
							<c:set var="userId" value="<%=notice.getId()%>" />
							<c:if test="${sessionId==userId}">
								<p>
									<a	href="./Popular_BoardDeleteAction.do?num=<%=notice.getNum()%>&pageNum=<%=nowpage%>"	class="btn" style="background-color:darkcyan; color:white;"> 삭제</a> 
									<input type="submit" class="btn" style="background-color:darkcyan; color:white;" value="수정 ">
							</c:if>
							<a href="./Popular_BoardListAction.do?pageNum=<%=nowpage%>"		class="btn" style="background-color:darkcyan; color:white;"> 목록</a>
						</div>
					</div>
				</form>
				<hr>
			</div>
				<%
					//현재 페이지 숫자이다
					int num_now=((Integer) request.getAttribute("num")).intValue();
					//현재 num과 다음 num(또는, 이전 num)의 차이값. 32비트 최대 정수로 초기화하였음
					int num_difference_value=2147483647;
				%>
				<!--다음 게시물을 찾는 반복문이다 -->
				<%
				int num_next = 0;
				int k=0;
				String subject_next = "";
				for (int j = 0; j < Popular_boardList.size(); j++) {
					notice = (BoardDTO) Popular_boardList.get(j);
					//현재값과 차이를 계산한다. 마이너스값일 수도 있으니 제곱을 해줘서 비교한다
					k=(num_next-num_now)^2;
					if (notice.getNum() > num_next & k<num_difference_value & num_next>num_now) {
						num_next = notice.getNum();
						subject_next = notice.getSubject();
						num_difference_value=k;
					}
				}
				%>
				
				<!-- 출력부때문에 overflow가 작동하지않으므로 문자열을 잘라준다 -->
				<%
				for (int j = 0; j < 5; j++) {
					if (subject_next.length() > 50)
						subject_next = subject_newest[j].substring(0, 50);
				}
				%>
				
				
				
				<!--이전의 게시물을 찾는 반복문이다 -->
				<%
				int num_before = 0;
				k=0;
				String subject_before = "";
				for (int j = 0; j < Popular_boardList.size(); j++) {
					notice = (BoardDTO) Popular_boardList.get(j);
					//현재값과 차이를 계산한다. 마이너스값일 수도 있으니 제곱을 해줘서 비교한다
					k=(num_before-num_now)^2;
					if (notice.getNum() > num_before & k<num_difference_value & num_before<num_now) {
						num_before = notice.getNum();
						subject_before = notice.getSubject();
						num_difference_value=k;
					}
				}
				%>
				
				<!-- 출력부때문에 overflow가 작동하지않으므로 문자열을 잘라준다 -->
				<%
				for (int j = 0; j < 5; j++) {
					if (subject_before.length() > 50)
						subject_before = subject_newest[j].substring(0, 50);
				}
				%>
			
			
			<div class="footer_buttons">
				<div>
					<div class="next_page_button">
 						<%-- Popular_pageNum=<%=1%> 부분은 쓸모없는 변수(더미 코드)이다 --%>
						<a class="text-dark"
							style="text-decoration-line: none;"
							href="./Popular_BoardViewAction.do?num=<%=num_next%>&Popular_pageNum=<%=1%>"><%=subject_next%>1111</a>
					</div>
					<div class="before_page_button">
						<%-- Popular_pageNum=<%=1%> 부분은 쓸모없는 변수(더미 코드)이다 --%>
						<a class="text-dark"
							style="text-decoration-line: none;"
							href="./Popular_BoardViewAction.do?num=<%=num_before%>&Popular_pageNum=<%=1%>"><%=subject_before%>2222</a>
					</div>
				</div>
				
			</div>
	</div>
</body>
</html>


