<%@ page contentType="text/html; charset=utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


<head>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65"
	crossorigin="anonymous">
<link rel="stylesheet" href="./resources/css/myprofile.css">
</head>
<%
String sessionId = (String) session.getAttribute("sessionId");
%>



<body>
	<nav class="navbar navbar-expand  navbar-dark bg-dark">
		<div class="container">
			<div class="navbar-header">
				<a class="navbar-brand" href=" ./homepage_do.do?pageNum=1">Home</a>
				<li style="padding-top: 7px; color: white">[<%=sessionId%>님]</li>
				
				<hr/>
				<hr/>
				
				<a class="nav-link navbar-brand" 
					href="<c:url value="/member/logoutMember.jsp"/>">로그아웃 </a>
				<a class="nav-link navbar-brand"
					href="<c:url value="/member/updateMember.jsp"/>">회원 수정</a>
			</div>

			<div class="panda">
				<div class="ear"></div>
				<div class="face">
					<div class="eye-shade"></div>
					<div class="eye-white">
						<div class="eye-ball"></div>
					</div>
					<div class="eye-shade rgt"></div>
					<div class="eye-white rgt">
						<div class="eye-ball"></div>
					</div>
					<div class="nose"></div>
					<div class="mouth"></div>
				</div>
				<div class="body"></div>
				<div class="foot">
					<div class="finger"></div>
				</div>
				<div class="foot rgt">
					<div class="finger"></div>
				</div>
			</div>




		</div>
	</nav>

</body>

