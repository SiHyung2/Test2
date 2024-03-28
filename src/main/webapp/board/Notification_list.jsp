<%@ page contentType="text/html; charset=utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.util.*"%>
<%@ page import="mvc.model.BoardDTO"%>
<%
String sessionId = (String) session.getAttribute("sessionId");
List Notification_boardList = (List) request.getAttribute("Notification_boardlist");
int Notification_total_record = ((Integer) request.getAttribute("Notification_total_record")).intValue();
int Notification_pageNum = ((Integer) request.getAttribute("Notification_pageNum")).intValue();
int Notification_total_page = ((Integer) request.getAttribute("Notification_total_page")).intValue();
%>








<html>
<head>
<title>Board</title>
<script type="text/javascript">
	function checkForm() {	
		if (${sessionId==null}) {
			alert("로그인 해주세요.");
			return false;
		}

		location.href = "./Notification_BoardWriteForm.do?id=<%=sessionId%>"
	}
</script>

<link rel="stylesheet" href="./resources/css/bootstrap.min.css" />
<!-- <link rel="stylesheet" href="./resources/css/Board_list.css"> -->
<style type="text/css">
	.wrapper{
    display: grid;
    grid-template-columns: 490px 905px 490px;
    grid-template-rows: 200px 50px 235px 315px 146px 130px;
}

/* .wrapper>*{
    border: 1px solid black;
} */
.main{
    grid-area: 1/1/2/4;
}
.real_time{
    grid-area: 2/1/4/2;
}
.border_menu_search{
    grid-area: 2/2/3/4;
}
.Notification_information{
    grid-area: 4/1/6/2;
}
.border_list{
    grid-area: 3/2/5/4;
}
.write_and_view_button{
    grid-area: 5/2/6/4;
}
.footer_button{
    grid-area: 6/1/7/4;
}

/* 메뉴 css */
menu{
    margin: 0;
    padding: 0;
    float: left;
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








.main>header{
    width: 100%;
    height: 60%;
    padding: 15px 15px 15px 15px;    /*  글자 세로 정렬을 위해 */
    text-align: center;
    background-color: rgb(236, 199, 192);
    border-bottom: 5px solid rgb(243, 217, 210);
}
.main>header a{
    color:#333333;
    font-family: 'Spoqa Han Sans Neo', 'sans-serif';
    font-weight: 700;
    font-style: normal;
    font-size: 45px;
    font-weight: 500;
    padding-left: 150px;
    text-decoration-line: none; /* a태그 밑줄 제거*/
}

/*main css */
.main img{
    width: 40px;
    height: 40px;
    float: right;
    margin-right: 80px;
    margin-top: 15px;
    background-color:transparent;
}



.border_list{
	padding-right:300px;
}





.real_time>div{
    width: 350px;
    height: 300px;
    margin: 50px 0px 0px 90px;
    /* border: 1px solid red; */
}
.real_time_header{
    width: 100%;
    height: 10%;
    background-color: lightgray;
    border-left: 3px solid lightgray;
    border-top: 3px solid lightgray;
    border-right: 3px solid lightgray;
}
.real_time_header>div{
    width: 230px;
    height: 100%;
    font-size: large;
    font-weight: 500;
    color: rgb(53, 104, 134);
    text-align: center;
    background-color: white;    
}
.real_time_section{
    width: 100%;
    height: 90%;
    border-left: 3px solid lightgray;
    border-bottom: 3px solid lightgray;
    border-right: 3px solid lightgray;
}
.real_time_section>div{
    width: (100%-20px);
    height: 49px;
    font-size: large;
    font-style: italic;
    /* 글자 세로 정렬 */
    display: flex;
    align-items: center;
    padding-left: 40px;
    
}
.real_time_section>div a{
    color: black;
    text-decoration-line: none; /* a태그 밑줄 제거*/
}


.Notification_information>div{
    width: 350px;
    height: 300px;
    margin: 100px 0px 0px 90px;
}
.Notification_information_header{
    display: flex;
    width: 100%;
    height: 10%;
    background-color: lightgray;
    border-left: 3px solid lightgray;
    border-top: 3px solid lightgray;
    border-right: 3px solid lightgray;
}
.Notification_information_header>div:nth-of-type(1){
    width: 170px;
    height: 100%;
    font-size: large;
    font-weight: 500;
    color: rgb(53, 104, 134);
    text-align: center;
    background-color: white;    
}
.Notification_information_header>div:nth-of-type(2){
    width: 170px;
    height: 100%;
    font-size: large;
    font-weight: 500;
    text-align: center;
}
.Notification_information_section{
    width: 100%;
    height: 90%;
    border-left: 3px solid lightgray;
    border-bottom: 3px solid lightgray;
    border-right: 3px solid lightgray;
}
.Notification_information_section>div{
    width: (100%-20px);
    height: 49px;
    font-size: large;
    font-style: italic;
    /* 글자 세로 정렬 */
    display: flex;
    align-items: center;
    padding-left: 40px;
    overflow: hidden;
}
.Notification_information_section>div a{
    color: black;
    text-decoration-line: none; /* a태그 밑줄 제거*/
}


.search{
    width: 1300px;
    padding-top:50px;
/*     border:1px solid black; */
}
.search>div {
	width:200px;
    float: right;
    position: relative;
  }
  
  input {
    width: 100%;
    border: 1px solid #bbb;
    border-radius: 8px;
    padding: 10px 12px;
    font-size: 14px;
  }
  
  
.footer_button>div{
	float:right; 
	margin-right:300px;
	background-color: darkcyan;
}

  
</style>
</head>
<body>
	<menu>
		<div class="container">
			<div>
				<h3>MENU</h3>
			</div>
			<ul class="li-con">
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
					onclick="location.href='<c:url value="/Game_BoardListAction.do?pageNum=1"/>'">게임<br>
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
		<nav class="search">
			<div>
				<form action="<c:url value="./Notification_BoardListAction.do"/>"
					method="post">
					<div class="d-flex">

						<select name="items" class="w-25">
							<option value="subject">제목에서</option>
							<option value="content">본문에서</option>
							<option value="name">글쓴이에서</option>
						</select> <input name="text" type="text" class="w-75" />
					</div>

					<input
						style="width: 100%; background-color: darkcyan; color: white; font-size: 15px; font-weight: 700"
						type="submit" id="btnAdd" class="btn" value="검색 " />
				</form>
			</div>

		</nav>
		<section class="border_list">
			<div>
				<div class="container">
					<form action="<c:url value="./Freedom_BoardListAction.do"/>"
						method="post">
						<table class="table table-hover">
							<tr>
								<th>번호</th>
								<th>제목</th>
								<th>작성일</th>
								<th>조회</th>
								<th>글쓴이</th>
							</tr>
							<%
							for (int j = 0; j < Notification_boardList.size(); j++) {
								BoardDTO notice = (BoardDTO) Notification_boardList.get(j);
							%>
							<tr>
								<td><%=notice.getNum()%></td>
								<td><a class="text-dark"
									style="text-decoration-line: none;"
									href="./Notification_BoardViewAction.do?num=<%=notice.getNum()%>&Notification_pageNum=<%=Notification_pageNum%>"><%=notice.getSubject()%></a></td>
								<td><%=notice.getRegist_day()%></td>
								<td><%=notice.getHit()%></td>
								<td><%=notice.getName()%></td>
							</tr>
							<%
							}
							%>
						</table>
					</form>
				</div>
			</div>



		</section>
		<aside class="real_time">
			<div>
				<header class="real_time_header">
					<div>실시간 인기 게시판</div>
				</header>
				<section class="real_time_section">
					<div>
						1&nbsp;&nbsp;<span><a href="#">슬립백이라는 고길동</a></span>
					</div>
					<div>
						2&nbsp;&nbsp;<span><a href="#">10만원권 초상화 이순신</a></span>
					</div>
					<div>
						3&nbsp;&nbsp;<span><a href="#">이재용 회장 유튜브 하기로</a></span>
					</div>
					<div>
						4&nbsp;&nbsp;<span><a href="#">서버3 버그 패치관련</a></span>
					</div>
					<div>
						5&nbsp;&nbsp;<span><a href="#">서버 운영진은 들어라</a></span>
					</div>
				</section>
			</div>
		</aside>
		<aside class="Notification_information">
			<div>
				<header class="Notification_information_header">
					<div>인기 게시판</div>
					<div>정보 게시판</div>
				</header>
				<section class="Notification_information_section">
					<div>
						<span><a href="#">블루투스 샤워기 개발 성공.jpg</a></span>
					</div>
					<div>
						<span><a href="#">10만원권 초상화 이순신 장군</a></span>
					</div>
					<div>
						<span><a href="#">지구온난화 가속화</a></span>
					</div>
					<div>
						<span><a href="#">친구많은 거지 VS 친구 없는 부자</a></span>
					</div>
					<div>
						<span><a href="#">이재용 회장 유튜브 하기로 결정</a></span>
					</div>
				</section>
			</div>
		</aside>
		<div class="write_and_view_button"></div>
		<footer class="footer_button">
			<div><a href="#"
			onclick="checkForm(); return false;" class="btn text-white">&laquo;글쓰기</a></div>
		</footer>
	</div>
	
	<div align="center">
				<c:set var="pageNum" value="<%=Notification_pageNum%>" />
				<c:forEach var="i" begin="1" end="<%=Notification_total_page%>">
					<a href="<c:url value="./Notification_BoardListAction.do?pageNum=${i}" /> ">
						<c:choose>
							<c:when test="${pageNum==i}">
								<font color='4C5317'><b> [${i}]</b></font>
							</c:when>
							<c:otherwise>
								<font color='4C5317'> [${i}]</font>

							</c:otherwise>
						</c:choose>
					</a>
				</c:forEach>
			</div>

		
		
				

</body>
</html>





