<%@ page contentType="text/html; charset=utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<header id="main">
	<header>
		<div>
			<a href="<c:url value="/homepage_do.do?pageNum=1"/>">MINECRAFT COMMUNITY</a> <img
				style="cursor: pointer;" src="resources/image/hamburger_icon.png"
				onclick="location.href='myprofile.jsp'" alt="프로필">
		</div>
	</header>


	<section class="d-flex justify-content-around">
		<!-- <ul class="navbar-nav navbar-nav-hover align-items-lg-center"> -->
		<li class="nav-item dropdown"><a href="#" class="nav-link"
			data-toggle="dropdown" href="#" role="button"> <i
				class="ni ni-ui-04 d-lg-none"></i> <span
				class="nav-link-inner--text">게시판</span>
		</a>
			<div class="dropdown-menu dropdown-menu-xl">
				<div class="dropdown-menu-inner">
					<a href="<c:url value="/Freedom_BoardListAction.do?pageNum=1"/>"
						class="d-flex align-items-center dropdown-item"> 자유게시판 </a> <a
						href="<c:url value="/Popular_BoardListAction.do?pageNum=1"/>"
						class="d-flex align-items-center dropdown-item"> 인기게시판 </a> <a
						href="<c:url value="/Information_BoardListAction.do?pageNum=1"/>"
						class="d-flex align-items-center dropdown-item"> 정보게시판 </a> <a
						href="<c:url value="/Notification_BoardListAction.do?pageNum=1"/>"
						class="d-flex align-items-center dropdown-item"> 공지사항 </a>
				</div>
			</div></li>
		<li class="nav-item dropdown"><a href="#" class="nav-link"
			data-toggle="dropdown" href="#" role="button"> <i
				class="ni ni-collection d-lg-none"></i> <span
				class="nav-link-inner--text">서버 입장하기</span>
		</a>
			<div class="dropdown-menu">
				<a href="https://discord.com/invite/uzhqXw5NyK"
					class="dropdown-item">튜토리얼</a> <a
					href="https://discord.com/invite/uzhqXw5NyK" class="dropdown-item">서버
					1 입장하기</a> <a href="https://discord.com/invite/uzhqXw5NyK"
					class="dropdown-item">서버 2 입장하기</a> <a
					href="https://discord.com/invite/uzhqXw5NyK" class="dropdown-item">서버
					3 입장하기</a> <a href="https://discord.com/invite/uzhqXw5NyK"
					class="dropdown-item">서버 4 입장하기</a>
			</div></li>
		<li class="nav-item dropdown"><a href="#" class="nav-link"
			data-toggle="dropdown" href="#" role="button"> <i
				class="ni ni-collection d-lg-none"></i> <span
				class="nav-link-inner--text">Q&A</span>
		</a>
			<div class="dropdown-menu">
				<a href="#" class="dropdown-item">문의하기</a> <a href="#"
					class="dropdown-item">버그 발생</a> <a href="#">
					<a class="dropdown-item">신고하기</a>
			</div></li>
		</setcion>
</header>