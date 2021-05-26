
<%@page import="java.util.List"%>
<%@page import="java.util.Arrays"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/views/common/header.jsp"%>

<%
Member member = (Member)request.getAttribute("member"); 
System.out.println(member);
List<String> petConcern = Arrays.asList(member.getPetConcern().split(","));
%>

<style>
<!--
사이드바 스타일 적용-->#board-container {
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
<section>
	<div id="board-container">
		<!-- 사이드바-->
		<div id="board-sidebar">
			<h2>나의 주문 관리</h2>
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

	<section id="content">
	
		<br> <br>
		<h1 align="center">반려동물 정보 수정</h1>
		<br> <br>
		<div align="center" id="view-container">

			<form name="memberView2"
				action="<%=request.getContextPath()%>/member/update2" method="POST">
				<table>
				
					<tr>
					<th>아이디</th>
					<td><input type="text" name="userId"  id="newId"
					value="<%= member.getId() %>"  readonly > 
					</td>
				</tr>
					<tr>
						<th>반려동물 이름</th>
						<td><input type="text" name="petName" id="petName"
							value="<%=member.getPetName()%>" /></td>
					</tr>
					<tr>
						<th>반려동물 생년월일</th>
						<td><input type="date" name="petBirth" id="petBirth"
							value="<%=member.getPetBirth()%>" /></td>
					</tr>
					<tr>
						<th>반려동물</th>
						<td><input type="radio" name="petType" value="고양이"  <%=member.getPetType().equals("고양이")? "checked":"" %> />고양이 <input
							type="radio" name="petType" value="강아지"   <%=member.getPetType().equals("강아지")? "checked":"" %> />강아지</td>
					</tr>
					<tr>
						<th>반려동물(종)</th>
						<td><input type="text" name="petSort" id="petSort"
							value="<%=member.getPetSort()%>" /></td>
					</tr>
					<tr>
						<th>성별</th>
						<td><input type="radio" name="petGender" value="암컷" <%=member.getPetGender().equals("암컷")? "checked":"" %> />암컷 
						<input type="radio" name="petGender" value="수컷" <%=member.getPetGender().equals("수컷")? "checked":"" %> />수컷</td>
					</tr>
					<tr>
						<th>중성화 여부</th>
						<td><input type="radio" name="petNeutralization" value="유"<%=member.getPetNeutralization().equals("유")? "checked":"" %> />유
							<input type="radio" name="petNeutralization" value="무" <%=member.getPetNeutralization().equals("무")? "checked":"" %> />무</td>
					</tr>

					<tr>
					 	<th>관심분야</th>
					<td>
						<label><input type="checkbox" name="petConcern"
								id="petConcern0" value="관절" <%=petConcern.contains("관절")? "checked":"" %>/>관절</label>
								<label><input type="checkbox" name="petConcernet"
							    id= "petConcern1"value="피부/모질" <%=petConcern.contains("피부/모질")? "checked":"" %>/>피부/모질</label> 
						<label> <input type="checkbox" name="pet" 
						        id="petConcern2" value="소화기관"  <%=petConcern.contains("소화기관")? "checked":"" %>/>소화기관 </label> 
						        
					<br>
					
						 <label><input type="checkbox" name="petConcern"
								id="petConcern3" value="눈/눈물"  <%=petConcern.contains("눈/눈물")? "checked":"" %>/>눈/눈물</label> 
								<label><input type="checkbox" name="petConcern" 
								id="petConcern4"value="체중/다이어트" <%=petConcern.contains("체중/다이어트")? "checked":"" %> />체중/다이어트</label> 
								<label><input type="checkbox" name="petConcern"
								 id="petConcern5" value="치아/구강" <%=petConcern.contains("치아/구강")? "checked":"" %> />치아/구강</label>
								
					<br>
								
							<label><input type="checkbox" name="petConcern"
								id="petConcern6" value="신장/방광"  <%=petConcern.contains("신장/방광")? "checked":"" %>/>신장/방광</label>
								 <label><input type="checkbox" name="petConcern"
								 id="petConcern7" value="배변" <%=petConcern.contains("배변")? "checked":"" %> />배변(설사/변비)</label>
							<label><input type="checkbox" name="petConcern"
								id="petConcern8" value="훈련" <%=petConcern.contains("훈련")? "checked":"" %> />훈련</label>
								
					<br> 
								
								<label><input type="checkbox" name="petConcern" 
								id="petConcern9" value="임심/수유"  <%=petConcern.contains("임신/수유")? "checked":"" %>/>임신/수유</label>
							<label><input type="checkbox" name="petConcern"
								id="petConcern10" value="강아지용품" <%=petConcern.contains("강아지용품")? "checked":"" %> />강아지용품</label>
								 <label><input type="checkbox" name="petConcern" 
								 id="petConcern11" value="고양이용품"  <%=petConcern.contains("고양이용품")? "checked":"" %>/>고양이용품</label>
					</td>
					</tr>
				</table>
				<br> <br>


				<div>
					<input type="submit" id="modifysubmit" value="수정완료" />
				</div>
			</form>
		</div>
	</section>

</section>
<br>
<%@ include file="/views/common/footer.jsp"%>