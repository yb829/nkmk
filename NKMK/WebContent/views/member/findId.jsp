<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ include file="/views/common/header.jsp"%>

<style>
	#find{
		height:35px;
		width:185px;
		font-size:15px;
		background-color:rgb(255, 230, 0);
		border:0;
		font-weight:bold;
	}
	
	#toLogin{
		height:35px;
		width:185px;
		font-size:15px;
		background-color:rgb(255, 230, 0);
		border:0;
		font-weight:bold;
	}
	
	.input_size{
		height:35px;
		width:370px;
	}
	
	tr{
		line-height:300%;
	}
</style>

<section id="content" align="center">
	<form id="findForm" action="<%= request.getContextPath() %>/member/findId" method="POST" target="popup_window">
		<table align="center">
			<br><br>
			<tr>
				<th>아이디 찾기</th>
			</tr>
			<tr>
				<td><input class="input_size" type="email" name="email" placeholder="이메일" required></td>
			</tr>
			<tr>
				<td><input class="input_size" type="text" name="name" placeholder="이름" required></td>
				<td><input type="hidden" name="identify1" value="a"></td>
			</tr>	
		</table>
	</form>
	<button type="button" id="find">찾기</button>
	<button type="button" id="toLogin">로그인</button>
</section>
<script>
	$(document).ready(() => {
		$('#find').on('click', (e) => {
			window.open("", "popup_window", "left=500, top=200, width=500, height=300, scrollbars=no");
			$('#findForm').submit();
		});
		
		$('#toLogin').on('click', (e) => {
			location.replace('<%= request.getContextPath()%>/member/login');
		});
	});
</script>
<%@ include file="/views/common/footer.jsp" %>