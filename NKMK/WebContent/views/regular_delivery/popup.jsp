<%@page import="com.kh.mvc.member.model.vo.Member"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
	String id = (String)request.getAttribute("userId");
	String pwd = (String)request.getAttribute("userPwd");
	Member loginMember2 = (Member)session.getAttribute("loginMember");
%>
<style>
	.cardSelect{
		width:80px;
	}
	
	.num_length{
		width:50px;
	}
</style>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="<%= request.getContextPath() %>/resources/js/jquery-3.6.0.min.js"></script>
</head>
<body>
	<form id="popup" action="<%= request.getContextPath()%>/card/enroll" method="POST">
		<table>
			<tr>
				<td>
					카드 : <select class="cardSelect" name="cardSelect">
						<option value="신한">신한</option>
						<option value="국민">국민</option>
						<option value="농협">농협</option>
						<option value="BC">BC</option>
					</select>
				</td>
			</tr>
			<tr>
				<td>
					카드 번호 : 
					<input type="text" class="num_length" name="cardNum1" maxlength="4">-
					<input type="text" class="num_length" name="cardNum2" maxlength="4">-
					<input type="text" class="num_length" name="cardNum3" maxlength="4">-
					<input type="text" class="num_length" name="cardNum4" maxlength="4">
				</td>
			</tr>
			<tr>
				<td>
					<input type="hidden" name="id" value="<%=loginMember2.getId()%>">
					<input type="hidden" name="pwd" value="<%=loginMember2.getPassword() %>">
					<input type="hidden" name="loginMember2" value="<%=loginMember2 != null ? loginMember2 : ""%>">
					<input id="enroll" type="button" value="등록">
				</td>
			</tr>
		</table>
	</form>
	<script>
		$(document).ready(() => {
			$('#enroll').on('click', (e) => {
				$('#popup').submit();
			});
		});
	</script>

</body>
</html>