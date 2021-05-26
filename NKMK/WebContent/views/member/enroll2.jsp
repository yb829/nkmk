<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/views/common/header.jsp"%>

<section id="content">

	<h2 align="center">회원 가입</h2>

	<div id="enroll-container">
		<h3>기본정보</h3> 
		<span style = " font-size:0.9em;  color: red;">*는 필수입력항목입니다</span>
	
		<hr>
		<form name="memberEnroll2"
			action="<%=request.getContextPath()%>/member/enroll2" method="post">
			<table>
				<tr>

					<th>아이디<span style = "color:red">*</span></th>
					<td><input type="text" name="userId" id= "newId"
						placeholder="아이디를 입력해주세요(4글자이상)." required /> <input
						type="button" id="checkDuplicate" value="중복확인" /></td>
				</tr>
				<tr>
					<th>패스워드<span style = "color:red">*</th>
					<td><input type="password" name="userPwd" id="pass1"
						placeholder="비밀번호를 입력해주세요." required /></td>
				<tr />
				<tr>
					<th>패스워드 확인<span style = "color:red">*</th>
					<td><input type="password" name="userPwdCheck" id="pass2"
						placeholder="비밀번호를 한번 더 입력해주세요." required /></td>
				</tr>
				<tr>
					<th>이름<span style = "color:red">*</th>
					<td><input type="text" name="userName"
						placeholder="이름을 입력해주세요." required /></td>
				</tr>
				<tr>
				<tr>
					<th>개인정보<span style = "color:red">*</th>
					<td>나이<input type="number" name="age" required /> 
					<input type="radio" name="gender" value="F" required />여성 
					<input type="radio" name="gender" value="M"  required />남성
					</td>
				</tr>

				<tr>
					<th>닉네임<span style = "color:red">*</th>
					<td><input type="text" name="userNick" id="userNick" required />
						
				</tr>
				<tr>

				</tr>

				<tr>
					<th>이메일<span style = "color:red">*</th>
					<td><input type="email" name="email" id="email"
						placeholder=" ab@abc.com" required  /><br> 
						<input type="radio"name="emailAgree" value="Y" />정보/이벤트 메일수신동의</td>
				</tr>

				<tr>
					<th>전화번호<span style = "color:red">*</th>
					<td><input type="tel" name="phone" maxlength="13"
						placeholder="010-1234-5678"  required><br> 
						<input type="radio" name="smsAgree" value="Y"/>정보/이벤트 SMS 수신동의</td>

				</tr>

				<tr>
					<th>주소<span style = "color:red">*</th>
					
					<td><input type="text" name="address" id="address" required />
						<input type="button" name="adress" id="findAddress" value="주소검색"  />
				<br>
		
			</table>
			<br> 
			<table>

				<h3>반려동물 정보</h3>
				<hr>
				<tr>
					<th>반려동물 이름</th>
					<td><input type="text" name="petName" id="petName" /></td>
				</tr>
				<tr>
					<th>반려동물 생년월일</th>
					<td><input type="date" name="petBirth" id="petBirth"/>
					</td>

				</tr>
				<tr>
					<th>반려동물</th>
					<td><input type="radio" name="petType" value="고양이"/>고양이 <input
						type="radio" name="petType" value="강아지"/>강아지</td>
				</tr>
				<tr>
					<th>반려동물(종)</th>
					<td><input type="text" name="petSort" id="petSort" /></td>
				</tr>
				<tr>
					<th>성별</th>
					<td><input type="radio" name="petGender" value="암컷" />암컷 <input
						type="radio" name="petGender" value="수컷"/>수컷</td>
				</tr>
				<tr>
					<th>중성화 여부</th>
					<td><input type="radio" name="petNeutralization" value="유" />유 <input
						type="radio" name="petNeutralization" value="무"/>무</td>
				</tr>

				<tr>

					<th>관심분야</th>
					<td><label><input type="checkbox" name="petConcern"
							value="관절" />관절</label> <label><input type="checkbox" name="petConcernet"
							value="피부/모질" />피부/모질</label> <label><input type="checkbox"
							name="pet" value="소화기관" />소화기관</label><br> <label><input
							type="checkbox" name="petConcern" id= "petConcer0" value="눈/눈물" />눈/눈물</label> <label><input
							type="checkbox" name="petConcern"  id= "petConcer1" value="체중/다이어트" />체중/다이어트</label> <label><input
							type="checkbox" name="petConcern"  id= "petConcer2" value="치아/구강" />치아/구강</label><br> <label><input
							type="checkbox" name="petConcern"  id= "petConcer3" value="신장/방광" />신장/방광</label> <label><input
							type="checkbox" name="petConcern"  id= "petConcer4" value="배변" />배변(설사/변비)</label> <label><input
							type="checkbox" name="petConcern"  id= "petConcer5" value="훈련" />훈련</label><br> <label><input
							type="checkbox" name="petConcern"  id= "petConcer6" value="임심/수유" />임신/수유</label> <label><input
							type="checkbox" name="petConcern"  id= "petConcer7" value="강아지용품" />강아지용품</label> <label><input
							type="checkbox" name="petConcern"  id= "petConcer8"value="고양이용품" />고양이용품</label></td>
				</tr>
			</table>
			<br> <br>

			<div align="center">

				<input type="reset" value="취소"
					onclick="location.href='<%=request.getContextPath()%>/'"> <input
					type="Submit" id="enrollSubmit" value="회원가입" />
				
	<input type = "hidden" name="terms1"  value="Y"/>
	<input type = "hidden" name="terms2"  value="Y"/>
			
				
			
			</div>
		</form >

		<form name="checkIdForm" >
			<input type="hidden" name="userId">
		</form>

	</div>

</section>


<script>

$("#enrollSubmit").on("click", () => {
	// TODO 전송하기 전에 각 영역에 유효성 검사로직을 추가하는 부분!
	
	
	//return false;
});

	// 아이디 중복을 확인 처리 콜백함수
$("#checkDuplicate").on("click", () => {
	// 중복확인전에 아이디 값이 4글자 이상인지 확인
	let id = $("#newId").val().trim();
	
	if (id.length < 4) {
		alert("아이디는 최소 4글자 이상 입력하셔요.")
		
		return;
	}
	
	//중복 확인할 새창 띄우기
	const url = "<%= request.getContextPath()%>/member/checkId";
	const title = "duplicate";
	const status = "left=500px,top=100px,width=500px,height=160px";
	
	open("", title, status);
	
	// form에 데이터들을 채우고 open된 윈도우에서 결과를 받는 로직을 구성한다.
	// 자바스크립트에서 form은 name 속성으로 요소를 가져올 수 있다.
	checkIdForm.target = title; // form 전송하는 윈도우를 설정한다.
	checkIdForm.action = url;
	checkIdForm.method = "post";
	checkIdForm.userId.value = id;
	
	// form 전송하기
	checkIdForm.submit();
});

	
	
//비밀번호값 확인
$(document).ready(() => {
		$("#pass2").blur((event) => {
			let pass1 = $("#pass1").val();			
			let pass2 = $(event.target).val();
			
			if(pass1.trim() != pass2.trim()) {
				alert("비밀번호가 일치하지 않습니다.");
				
				$("#pass1").val("");
				$(event.target).val("");
				$("#pass1").focus();
			}
		});	



  
});
	

 
	


  
    
</script>


<%@ include file="/views/common/footer.jsp"%>