<%@ page contentType="text/html; charset=utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%@ page import="mvc.model.BoardDTO"%>

<%
	BoardDTO notice = (BoardDTO) request.getAttribute("board");
	int num = ((Integer) request.getAttribute("num")).intValue();
	int nowpage = ((Integer) request.getAttribute("page")).intValue();
%>
<html>
<head>
<link rel="stylesheet" href="./resources/css/bootstrap.min.css" />



<style>
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

.header{
	height:112px;
	background-color: rgb(236, 199, 192);
	padding-top: 25px;
}

.header>div{
	text-align: center;
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





.popular_information>div{
    width: 350px;
    height: 300px;
    margin: 100px 0px 0px 90px;
}
.popular_information_header{
    display: flex;
    width: 100%;
    height: 10%;
    background-color: lightgray;
    border-left: 3px solid lightgray;
    border-top: 3px solid lightgray;
    border-right: 3px solid lightgray;
}
.popular_information_header>div:nth-of-type(1){
    width: 170px;
    height: 100%;
    font-size: large;
    font-weight: 500;
    color: rgb(53, 104, 134);
    text-align: center;
    background-color: white;    
}
.popular_information_header>div:nth-of-type(2){
    width: 170px;
    height: 100%;
    font-size: large;
    font-weight: 500;
    text-align: center;
}
.popular_information_section{
    width: 100%;
    height: 90%;
    border-left: 3px solid lightgray;
    border-bottom: 3px solid lightgray;
    border-right: 3px solid lightgray;
}
.popular_information_section>div{
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
.popular_information_section>div a{
    color: black;
    text-decoration-line: none; /* a태그 밑줄 제거*/
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
	

	<header class="header">
		<div class="container">
			<h1 style="cursor: pointer;" onclick="location.href='<c:url value="/homepage_do.do?pageNum=1"/>'">MINECREAFT COMMUNITY</h1>
		</div>
	</header>


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
		
	<aside class="popular_information">
			<div>
				<header class="popular_information_header">
					<div>인기 게시판</div>
					<div>정보 게시판</div>
				</header>
				<section class="popular_information_section">
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



	<div class="container">
		<form name="newUpdate"
			action="Freedom_BoardUpdateAction.do?num=<%=notice.getNum()%>&Freedom_pageNum=<%=nowpage%>"
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
							<a	href="./Freedom_BoardDeleteAction.do?num=<%=notice.getNum()%>&pageNum=<%=nowpage%>"	class="btn btn-danger"> 삭제</a> 
							<input type="submit" class="btn btn-success" value="수정 ">
					</c:if>
					<a href="./Freedom_BoardListAction.do?pageNum=<%=nowpage%>"		class="btn btn-primary"> 목록</a>
				</div>
			</div>
		</form>
		<hr>
	</div>
</body>
</html>


