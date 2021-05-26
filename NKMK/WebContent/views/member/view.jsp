<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
 <%@ include file="/views/common/header.jsp"%>
 
 <%
Member member = (Member)request.getAttribute("member");

 %>
 <style> <!--사이드바 스타일 적용-->
 #board-container {
	width: 100%;
	margin: 0px auto;
	padding: auto;
}
#board-sidebar {
	width: 200px;
	padding: 30px;
	margin-bottom: 10px;
	float: left;
	border: 1px solid #bcbcbc;
}
 </style>
 <br>
 <section >
	<div id="board-container" >  <!--  사이드바  -->
		<div id="board-sidebar">
			<h3>나의 주문 관리</h3>
			<ul>
				<li><a href="<%=request.getContextPath()%>/board/mypage">주문배송조회</a></li>
				<li><a href="<%=request.getContextPath()%>/board/regularmanage">정기배송상품관리</a></li>
				<li><a href="<%=request.getContextPath()%>/board/cancel_list">취소/반품/교환</a></li>
				<li><a href="<%=request.getContextPath()%>/coupon/couponMgCouponList">쿠폰/적립금</a></li>
			</ul>
			<h3>나의 활동</h3>
			<ul>
				<li><a href="<%=request.getContextPath()%>/board/review">상품리뷰</a></li>
				<li><a href="<%=request.getContextPath()%>/board/11board">1:1문의</a></li>
			</ul>

			<h3>정보 관리</h3>
			<ul>
				<li><a href="<%=request.getContextPath()%>/member/view">개인정보수정</a></li>
				<li><a href="<%=request.getContextPath()%>/member/view2">반려동물정보수정</a></li>
				<li><a href="">배송지관리</a></li>
				
			</ul>
		</div>
		</div>
 
<section id="content"> <!-- 회원정보 수정 -->
	<br><br>
	<div align="center">
	<h1 >회원 정보 수정 </h1>
	<span  style = " font-size:0.9em;  color: blue;">*부분만 수정가능합니다</span>
	</div>
	<div align="center" id="view-container">
	
		<br>
		<form name="memberView" 
		action="<%= request.getContextPath() %>/member/update" method="POST">
			<table>
				<tr>
					<th>아이디</th>
					<td><input type="text" name="userId"  id="newId"
					value="<%= member.getId() %>" readonly	 /> 
					</td>
				</tr>
				<tr>
					<th>이름</th>
					<td><input type="text" name="userName" id="userName" 
					value ="<%= member.getName() %>" readonly />
					</td>
				</tr>
				
				<tr>
				<th>전화번호<span style = "color:blue">*</span></th>
					<td><input type="tel" name="phone" maxlength="13"
					value="<%= member.getPhone() %>" placeholder="010-1234-5678" required/><br>
			</tr>
			
				<tr>
				<th>개인정보</th>
				<td>나이<input type ="number" name="age" value="<%= member.getAge() %>"readonly />
				<input type ="radio" name="gender" value="F"<%=member.getGender().equals("F")? "checked":"" %>  /> 여성 
				<input type ="radio"  name="gender"value= "M"<%=member.getGender().equals("M")? "checked":"" %> />남성  </td>
				</tr>
				
				<tr>
					<th>닉네임<span style = "color:blue">*</span></th>
					<td><input type="text" name="userNick" id= "userNick"
					 value="<%= member.getNickName() %>"  />
					
				</tr>
				<tr>
					
				</tr>

				<tr>
					<th>이메일<span style = "color:blue">*</span></th>
					<td><input type="email" name="email" id="email"
					value="<%= member.getEmail() %>" placeholder=" ab@abc.com" /><br>
					
				</tr>

				
				<tr>
					<th>주소<span style = "color:blue">*</span></th>
				    <td><input type="text" name="address" id="address" 
				    value="<%= member.getAddress()%>"  /> 
				    
				  
				 

				</tr>
				</table>
				<br><br>
				
				
				
			
			<input type="button" id="updatePwd" value="비밀번호변경" />
	        <input type="submit" id="modifysubmit" value="수정완료" />
	        <input type="button" id="deleteMember" value="탈퇴하기" />

			</form>
		</div>
</section>

		

</section>
<script>
$(document).ready(() => {
	$("#deleteMember").on("click", (e) => {
		if(confirm("정말로 탈퇴하시겠습니까?!")) {

			location.replace('<%= request.getContextPath() %>/member/delete');
		}
	});


$("#updatePwd").on("click", (e) => {
	// 비밀번호 변경 창
	const url ="<%= request.getContextPath() %>/member/updatePwd";
	const status = "left=500px,top=200px,width=600px,height=210px"
	
	open(url,"",status);
	
	
	
});
}); 
</script>



<br>
<%@ include file="/views/common/footer.jsp" %>