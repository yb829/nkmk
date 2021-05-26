<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/views/common/header.jsp"%>
<script src="../resources/js/jquery-3.6.0.min.js"></script>
<head>
<style>
#board-container {
	width: 100%;
	margin: 0px auto;
	padding: auto;
}

#board-content {
	width: 800px;
	padding: 20px;
	margin-bottom: 20px;
	float: left;
	border: 1px solid #bcbcbc;
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

table#board_list_table {
	width: 800px;
	border: 1px solid; padding 5px;
	text-align: center;
}

.board_tit {
	text-align: left;
}

.container {
	float: left;
	width: 100%;
	text-align: center;
	padding: 5px;
	margin: 5px;
}

.container ul li {
	float: left;
}

.mypage_top_info {
	list-style-type: none;
	float: left;
	background-color: white;
	width: 60%;
}

.mypage_top_wallet {
	list-style-type: none;
	position: clear;
	float: left;
}

.mypage_top_wallet ul li {
	list-style-type: none;
	margin: 10px;
}

.mypage_top_info ul li {
	list-style-type: none;
	float: left;
	margin: 5px;
}

.ec-base-box.gHalf {
	position: relative;
	padding: 20px 0;
}

.ec-base-box {
	padding: 20px;
	margin-left: auto;
	margin-right: auto;
	border: 1px solid #e8e8e8;
	color: #404040;
}

</style>
</head>

<section>
	<div id="board-container">
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

		<section id="content">
			<div class="container">
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
								<strong><%=loginMember.getName()%></strong> 님. 정기배송 상품 관리
							</h2>
						</div>
					</div>
				</div>

				<div class="mypage_top_wallet"
					style="width:relative; padding: 5px; position: relative; margin: 10px; padding: 10px; background-color:#fbeeac;">
					<ul class="update_list"
						style="margin-top: 0px; margin-bottom: 0px; margin-left: 0px; text-align: center;">
						<!-- 주문배송 -->
						<li>
							<div class="inner_list"
								style="margin-top: 0px; margin-bottom: 0px;">
								<h4 style="margin-top: 0px; margin-bottom: 0px;">주문배송</h4>
								<p style="margin-top: 0px; margin-bottom: 0px;">
									<a href=""><strong>0</strong></a>건
								</p>
							</div>
						</li>
						<!-- 정기배송상품 -->
						<li>
							<div class="inner_list">
								<h4 style="margin-top: 0px; margin-bottom: 0px;">정기배송상품</h4>
								<p style="margin-top: 0px; margin-bottom: 0px;">
									<a href=""><strong>0</strong></a>건
								</p>
							</div>
						</li>
						<!-- 쿠폰 -->
						<li>
							<div class="inner_list">
								<h4 style="margin-top: 0px; margin-bottom: 0px;">쿠폰</h4>
								<p style="margin-top: 0px; margin-bottom: 0px;">
									<a href=""><strong>1</strong></a>장
								</p>
							</div>
						</li>
						<!-- 적립금 -->
						<li>
							<div class="inner_list mileage">
								<h4 style="margin-top: 0px; margin-bottom: 0px;">적립금</h4>
								<p style="margin-top: 0px; margin-bottom: 0px;">
									<a href=""><strong>5,000</strong></a>원
								</p>
							</div>
						</li>
						<li>
							<div class="inner_list mileage">
								<h4 style="margin-top: 0px; margin-bottom: 0px;">진행중인 주문</h4>
								<p style="margin-top: 0px; margin-bottom: 0px;">
									<a href=""><strong>0</strong></a>건
								</p>
							</div>
						</li>
						<li>
							<div class="inner_list mileage">
								<h4 style="margin-top: 0px; margin-bottom: 0px;">최근 주문 정보</h4>
								<p style="margin-top: 0px; margin-bottom: 0px;">
									<a href=""><strong>0</strong></a>원
								</p>
							</div>
						</li>
					</ul>
				</div>

				<div class="orderlist" style="margin-top: 30px; ">
					<table width="800" cellpadding="5" cellspacing="3" bgcolor="#fbeeac" >
						<colgroup>
							<col width="12%">
							<col width="13%">
							<col width="10%">
							<col width="29%">
							<col width="21%">
							<col width="15%">
						</colgroup>
						<tbody>
							<tr bgcolor="#f4d160">
								<th scope="col" class="myacc_th01">주문일</th>
								<th scope="col" class="myacc_th01">주문번호</th>
								<th scope="col" class="myacc_th01">수령인</th>
								<th scope="col" class="myacc_th01">주문상품</th>
								<th scope="col" class="myacc_th01">조회 및 증빙서류</th>
								<th scope="col" class="myacc_th01">비고</th>
							</tr>

							<tr>
								<td class='td_date myacc_td03'>2021-04-22</td>
								<td class='td_link myacc_td03'><a href=''>A777343077
								
								<td class='td_date myacc_td03'>김냥명</td>
								<td class='td_left myacc_td05'><div class='td_left_item'>
										고양이도 강아지도 냥꿀멍꿀 <br /> 총 1종 1개, 14,900원
									</div></td>
								<td class='myacc_td02' style='position: relative;'>
									<div class=''>
										<div class='button list_btn01 mb5'>
											<a href='' class='button_small'>상세조회</a>
										</div>
										<div class='btnReceiptPrint' orderno='001-A777343077'>
											<div class='button list_btn01 mb5'>
												<a class='button_small' href='javascript:void(0);'>증빙서류
													신청/조회 </a>
											</div>
										</div>
									</div>
								</td>
								<td>
								정기배송중!
								</td>
							</tr>
						</tbody>
					</table>
				</div>
			</div>
		</section>
	</div>
</section>

<%@ include file="/views/common/footer.jsp"%>