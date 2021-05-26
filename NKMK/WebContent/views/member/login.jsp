<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/views/common/header.jsp" %>
<style>
	<%-- input --%>
	.input_size{
		height:35px;
		width:370px;
	}
	<%-- 찾기 기능 --%>
	.function{
		font-size:13px;
	}
	<%-- 로그인 버튼--%>
	.loginButton{
		height:35px;
		width:380px;
		font-size:15px;
		background-color:rgb(255, 230, 0);
		border:0;
		font-weight:bold;
	}
	<%-- 체크 박스 --%>
	#idSave{
		text-align:left;
	}
	<%-- 회원가입 버튼 --%>
	#enrollButton{
		height:70px;
		width:120px;
		font-size:20px;
		float:right;
		background-color:darkorange;
		border:0;
		font-weight:bolder;
	}
	
	
</style>
<section id="content" align="center">
	<h3>로그인</h3>
	<form action="<%= request.getContextPath() %>/member/login" method="POST">
		<% if(loginMember == null) {%>
		<table align="center">
			<tr>
				<th colspan="3">회원 로그인</th>
			</tr>
			<tr>
				<td colspan="3"><input class="input_size" type="text" name="userId" value="<%= saveId != null ? saveId : "" %>" placeholder="아이디" required></td>
			</tr>
			<tr>
				<td colspan="3"><input class="input_size" type="password" name="userPwd" placeholder="비밀번호" required></td>
			</tr>
			<tr>
				<td colspan="3"><input class="loginButton" type="submit" id="login" value="로그인"></td>
			</tr>
			<tr id="idSave">
				<td><input type="checkbox" name="saveId" <%= saveId != null ? "checked" : "" %>>아이디 저장</td>
				<td><a class="function" href="<%= request.getContextPath()%>/member/findId">&gt;아이디 찾기&nbsp;</a></td>
				<td><a class="function" href="<%= request.getContextPath()%>/member/findPwd">&gt;비밀번호 찾기</a></td>
			</tr>
			<tr>
				<td>아직 회원이 아니신가요?<br>지금 바로 회원가입하세요!</td>
                <td colspan="2" id="test"><input id="enrollButton" type="button" value="회원가입"onclick="location.href='<%= request.getContextPath() %>/member/enroll1'"></td>			</tr>
		</table>
		<%} %>
		<br><br>
	</form>
	
	<table align="center">
		<tr>
			<th>비회원 주문조회</th>
		</tr>
		<tr>
			<td><input class="input_size" type="text" placeholder="주문자명"></td>
		</tr>
		<tr>
			<td><input class="input_size" type="text" placeholder="주문번호"></td>
		</tr>
		<tr>
			<td><input class="loginButton" type="submit" value="주문조회 하기"></td>
		</tr>
	</table>
</section>
	
<%@ include file="/views/common/footer.jsp" %>