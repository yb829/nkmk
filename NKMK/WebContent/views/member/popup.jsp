<%@page import="com.kh.mvc.member.model.vo.Member"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
	Member member = (Member)request.getAttribute("findMember");
	String identity1 = (String)request.getAttribute("identify1");
	String identity2 = (String)request.getAttribute("identify2");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="<%= request.getContextPath() %>/resources/js/jquery-3.6.0.min.js"></script>
<title>Insert title here</title>
</head>
<body>
	<%if(identity1 != null) {%>
		<h1>아이디 : <%= member.getId() %></h1>
		<br>
		<input class="confirm" type="button" value="확인">
	<%} %>
	
	<%if(identity2 != null) {%>
		<h1>비밀번호 : <%= member.getPassword() %></h1>
		<br>
		<input class="confirm" type="button" value="확인">
	<%} %>
</body>
<script>
	$(document).ready(() => {
		$('.confirm').on('click', (e) => {
			window.close();
		});
	});
</script>
</html>