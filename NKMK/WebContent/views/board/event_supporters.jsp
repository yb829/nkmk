<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/views/common/header.jsp"%>
<script src="../resources/js/jquery-3.6.0.min.js"></script>
<head>
<style>
#eventpageimage {
	text-align: center;
}

#infoinput{
	text-align:center;
	padding:10px;
	margin:10px;
}
</style>
</head>
<body>
	<section id="content">
		<div id="eventpageimage">
			<img src="<%=request.getContextPath()%>/resources/images/eventsupporters.png">
		</div>
		<div id="eventsubmit">
			<form name="eventenroll">
				<h3>14일 체험단 신청 양식</h3>
				<p>
				입력해주신 이메일 주소로 체험단 신청 안내문과 구글 참여폼 링크를 보내드립니다.<br>
				이메일은 영업일 기준 1 영업일 이내에 발송됩니다.
				</p>
				<table class="infoinput"style="margin:20px;padding:20px; text-align:center;">
					<tr>
						<th>회원 아이디</th>
						<td><input type="text" name="userId"
							placeholder="아이디를 입력해주세요."></td>
					</tr>
					<tr>
						<th>이메일 주소</th>
						<td><input type="email" name="userEmail"
							placeholder="이메일 주소를 입력해주세요."></td>
						<td><input type="checkbox" name="markertingAgree" />정보/이벤트메일수신동의</td>
					</tr>
				</table>
				<input type="submit" id="eventSumbit" value="체험단 이벤트 참가" onclick="alert('체험단 신청이 완료되었습니다');">
			</form>
		</div>
	</section>
<script>



</script>
</body>

<%@ include file="/views/common/footer.jsp"%>