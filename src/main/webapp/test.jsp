<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script>
	$(function() {
		$('.tabcontent > div').hide();
		$('.tabnav a').click(function() {
			$('.tabcontent > div').hide().filter(this.hash).fadeIn();
			$('.tabnav a').removeClass('active');
			$(this).addClass('active');
			return false;
		}).filter(':eq(0)').click();
	});
	
</script>

<style type="text/css">
	
	
	
	/*tab css*/
	.popular_information {
		width: 350px;
		height: 300px;
/* 		border: 1px solid red; */
	}
	
	.popular_information ul, li {
		margin: 0;
		padding: 0;
		list-style: none;
	}
	
	.tabnav {
		font-size: 0;
		width: 350px;
		border: 1px solid #ddd;
	}
	
	.tabnav li {
		display: inline-block;
		height: 46px;
		text-align: center;
		border-right: 1px solid #ddd;
	}
	
	.tabnav li a:before {
		content: "";
		position: absolute;
		left: 0;
		top: 0px;
		width: 100%;
		height: 3px;
	}
	
	.tabnav li a.active:before {
		background: #7ea21e;
	}
	
	.tabnav li a.active {
		border-bottom: 1px solid #fff;
	}
	
	.tabnav li a {
		position: relative;
		display: block;
		background: #f8f8f8;
		color: #000;
		padding: 0 30px;
		line-height: 46px;
		text-decoration: none;
		font-size: 16px;
	}
	
	.tabnav li a:hover, .tabnav li a.active {
		background: #fff;
		color: #7ea21e;
	}
	
	.tabcontent {
/* 		여기선 가로길이를 310px을 입력하면 350px이 된다 */
		width: 310px;
		padding: 20px;
		height: 244px;
		border: 1px solid #ddd;
		border-top: none;
	}
</style>

</head>

<body>
	<div class="popular_information">
		<ul class="tabnav">
			<li><a href="#tab01" >인기게시판</a></li>
			<li><a href="#tab02">자유게시판</a></li>
		</ul>
		<div class="tabcontent">
			<div id="tab01">tab1 content</div>
			<div id="tab02">tab2 content</div>
		</div>
	</div>
	<!--tab-->
</body>
</html>