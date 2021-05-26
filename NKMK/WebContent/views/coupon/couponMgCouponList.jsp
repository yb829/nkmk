<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/views/common/header.jsp"%>

<link rel="stylesheet"
	href="http://code.jquery.com/ui/1.8.18/themes/base/jquery-ui.css"
	type="text/css">

<script
	src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"></script>

<script src="http://code.jquery.com/ui/1.8.18/jquery-ui.min.js"></script>

<link rel="stylesheet" type="text/css"
	href="../../../resources/css/bootstrap.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"></script>
<html>

<head>
<style>

#board-container {
	width: 100%;
	margin: 0px auto;
	padding: auto;
}

#board-content {
	width: 700px;
	padding: 20px;
	margin-bottom: 20px;
	float: left;
	border: 1px solid #bcbcbc;
}

.mypage_top_info ul li {
	list-style-type: none;
	float: left;
	margin: 5px;
}

.mypage_top_info {
	list-style-type: none;
	float: left;
	background-color: white;
	width: 60%;
}
#board-sidebar {
	width: 200px;
	padding: 30px;
	margin-bottom: 10px;
	float: left;
	border: 1px solid #bcbcbc;
}

#board-content, board-sidebar {
	text-align: center;
}

#board-sidebar ul li {
	list-style-type: none;
}

tr {
	text-align: center;
}

.button {
	background-color: #8ac4d0;
	border: none;
	color: white;
	padding: 8px 16px;
	text-align: center;
	text-decoration: none;
	display: inline-block;
	font-size: 15px;
	margin: 4px 2px;
	cursor: pointer;
}

#search {
	padding: 5px;
}

input[type=checkbox] {
	cursor: pointer;
	width: 18px;
	height: 18px;
}

h1, h2, h3, h4, h5, h6, .h1, .h2, .h3, .h4, .h5, .h6 {
	margin-bottom: 0;
	font-weight: 500;
	line-height: 1.2;
}

h1, .h1 {
	font-size: 2em;
	display: block;
	margin-block-start: 0.67em;
	margin-block-end: 0.67em;
	margin-inline-start: 0px;
	margin-inline-end: 0px;
	font-weight: bold;
}

h2, .h2 {
	display: block;
	font-size: 1.5em;
	margin-block-start: 0.83em;
	margin-block-end: 0.83em;
	margin-inline-start: 0px;
	margin-inline-end: 0px;
	font-weight: bold;
}

h3, .h3 {
	display: block;
	font-size: 1.17em;
	margin-block-start: 1em;
	margin-block-end: 1em;
	margin-inline-start: 0px;
	margin-inline-end: 0px;
	font-weight: bold;
}

h4, .h4 {
	font-size: 1rem;
}

p {
	display: block;
	margin-block-start: 1em;
	margin-block-end: 1em;
	margin-inline-start: 0px;
	margin-inline-end: 0px;
}
</style>
</head>
<body class="sb-nav-fixed">
	<div id="board-container">
		<div id="board-sidebar">
			<h3>나의 주문 관리</h3>
			<ul>
				<li><a href="<%=request.getContextPath()%>/board/mypage">주문배송조회</a></li>
				<li><a
					href="<%=request.getContextPath()%>/board/regularmanage">정기배송상품관리</a></li>
				<li><a href="<%=request.getContextPath()%>/board/cancel_list">취소/반품/교환</a></li>
				<li><a
					href="<%=request.getContextPath()%>/coupon/couponMgCouponList">쿠폰/적립금</a></li>
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
		<section id="content">

			<div id="layoutSidenav_content">
				<main>
					<div class="container-fluid">
							<div class="mypage_top_info" style="margin:10px; padding:10px;">
					<div class="mypage_top_txt">
						<div class="pet_photo" style="float: left; margin-right: 10px;">
							<img
								src="<%=request.getContextPath()%>/resources/images/logo-orange.png"
								style="width: 100px; height: 70px;">
						</div>
					</div>

					<div class="my_sum" style="float: left">
						<div style="clear: both;">
							<br>
							<h2>
								<strong><%=loginMember.getName()%></strong> 님. 쿠폰/적립금 조회
							</h2>
						</div>
					</div>
				</div>
				
				
						<div class="card mb-4">
							<div class="card-body">
								<div class="table-responsive">
									<table class="table table-bordered" id="dataListTable"
										width="100%" cellspacing="0" align="center"
										border="1px solid black">
										<thead align="center">
											<tr>
												<form name="searchName" method="post">
													<th style="vertical-align: middle height:100px;background-color:#fbeeac">쿠폰명
														검색</th>
													<th><input name="couponName" type="text" id="search"
														style="width: 120px; height: 30px">
														<button class="small_btn" type="submit">검색</button></th>
												</form>
												<form name="searchDate" method="post">
													<th style="vertical-align: middle;;background-color:#fbeeac">기간별 조회</th>
													<th><input type="date" name="startDate" required>
														~ <input type="date" name="endDate" required>
														<button class="small_btn" type="submit">검색</button></th>
												</form>
										</thead>							
									</table>
									<div align="right">
										<button class="button">보유중인 쿠폰 등록</button>
										<button class="button" onclick="delCoupon();">선택한 쿠폰 삭제</button>
									</div>

									<table class="table table-bordered" id="dataListTable"
										width="100%" cellspacing="0" border="1px solid black">
										<thead>
											<tr style="background-color:#fbeeac">
												<th width="7%">NO</th>
												<th width="40%">쿠폰</th>
												<th width="25%">기간</th>
												<th width="8%">할인율</th>
												<th width="15%">등록일</th>
												<th width="5%"><input name="all" type="checkbox"
													class="checkAll"></th>
											</tr>
										</thead>
										<tbody>
											<tr>
												<td>1</td>
												<td>냥꿀멍꿀 OPEN 기념 감사 쿠폰</td>
												<td>2021.01.01 ~ 2021.12.31</td>
												<td>10%</td>
												<td>2021.01.01</td>
												<th><input class="cb" type="checkbox"
													name="checkCoupon"></th>
											</tr>
											<input type="submit" id="hiddenDelBtn" style="display: none;">
										</tbody>
									</table>
									<br><br><br>
									<h3>적립금</h3>
									<table class="table table-bordered" id="dataListTable"
										width="100%" cellspacing="0" border="1px solid black">
										<thead>
											<tr style="background-color:#fbeeac">
												<th width="7%">NO</th>
												<th width="33%">적립금</th>
												<th width="25%">사용 가능 기간</th>
												<th width="15%">금액</th>
												<th width="15%">등록일</th>
												<th width="5%"><input name="all" type="checkbox"
													class="checkAll"></th>
											</tr>
										</thead>
										<tbody>
											<tr>
												<td>1</td>
												<td>냥꿀멍꿀 OPEN 적립금</td>
												<td>2021.01.01 ~ 2021.12.31</td>
												<td>1000원</td>
												<td>2021.01.01</td>
												<th><input class="cb" type="checkbox"
													name="checkCoupon"></th>
											</tr>
											<input type="submit" id="hiddenDelBtn" style="display: none;">
										</tbody>
									</table>
									
									
									
								</div>
							</div>
						</div>
					</div>
				</main>
			</div>
		</section>


	</div>
	<script>
		$(document).ready(function() {
			$('.checkAll').click(function() {
				$('.cb').prop('checked', this.checked);
			});
		});
		function delCoupon() {
			$("#hiddenDelBtn").trigger("click");
		}
	</script>
	</div>
</body>
<%@ include file="/views/common/footer.jsp"%>