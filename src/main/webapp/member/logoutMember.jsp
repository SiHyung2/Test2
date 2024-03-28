<%@ page contentType="text/html; charset=utf-8"%>

<%
	session.invalidate();
response.sendRedirect("../homepage_do.do?pageNum=1");
%>