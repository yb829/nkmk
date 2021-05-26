<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
	String msg = (String)request.getAttribute("msg");
	String script = (String)request.getAttribute("script");
	String location = (String)request.getAttribute("location");
	String location_parent = (String)request.getAttribute("location_parent");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<script type="text/javascript">
		// 알림메시지를 띄움
		alert("<%= msg %>");
		
		// 실행시켜야할 스크립트가 있으면 실행
		if(<%= script != null %>){
			<%= script %>
		}
		
		// 페이지 이동
		location.replace("<%= request.getContextPath() %><%= location %>");
		
		if(<%= location_parent != null%>){
			window.opener.location.href="<%= request.getContextPath()%><%=location_parent%>";
		}
	</script>
</body>
</html>