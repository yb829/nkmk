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
	width: 700px;
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

ul.board_faq_list {
	list-style-image:
		url("<%=request.getContextPath()%>/resources/images/faq_icon.png" );
}

div.list_none ul li {
	background-color: white;
	padding: 10px;
	margin: 10px;
}
#board-sidebar ul li {
	list-style-type: none;
}
</style>

<script>
	$(function() {
		// Hide all elements which id starts with text.
		$("[id^=text]").hide();

		$(".button").click(function() {
			$("#text" + $(this).data("rel")).toggle();
		});
	});
</script>

<meta http-equiv="Content-Type" content="text/html; harset=UTF-8">

</head>
<section>
	<div id="board-container">
		<div id="board-sidebar">
			<h2>고객센터</h2>
			<ul>
				<li><a href="<%=request.getContextPath()%>/board/list">공지사항</a></li>
				<li><a href="<%=request.getContextPath()%>/board/11board">1:1문의</a></li>
				<li><a href="<%=request.getContextPath()%>/board/fqa">자주묻는질문</a></li>
			</ul>
		</div>
		<section id="content">

			<div class="list_none">
				<h2>자주묻는질문</h2>
				<ul class="board_faq_list">
					<li>
						<div class="button" data-rel="1">
							<div class="button float_l">
								<a href="#"> 냥꿀멍꿀 회원가입은 어떻게 하나요? </a>
							</div>
						</div>
						<p>
						<div id="text1">
							1. 냥꿀멍꿀 상단 회원가입 클릭<br>2. 회원가입 약관에 동의 후 회원가입 클릭<br>3.
							회원정보 입력 후 회원가입 클릭 > 가입완료
						</div>
						</p>
					</li>

					<li>
						<div class="button" data-rel="2">
							<div class="button float_2">
								<a href="#"> 비회원 주문이 가능한가요? </a>
							</div>
						</div>
						<p>
						<div id="text2">비회원주문이 가능합니다. 다만 비회원 주문시 쿠폰, 적립금등의 각종 혜택에서
							제외되므로 회원가입 후 이용을 추천드립니다.</div>
						</p>
					</li>

					<li>
						<div class="button" data-rel="3">
							<div class="button float_3">
								<a href="#">결제 시 오류가 나요</a>
							</div>
						</div>
						<p>
						<div id="text3">오류 메세지 확인하시고 이용에 참고 부탁드립니다.</div>
						</p>
					</li>

					<li>
						<div class="button" data-rel="4">
							<div class="button float_4">
								<a href="#"> 배송비는 얼마인가요? </a>
							</div>
						</div>
						<p>
						<div id="text4">
							기본배송료는 2,500원 이며 3만원이상 구매시 무료로 배송됩니다.<br>일부 도서, 산간 지역은 배송
							불가하거나 배송기간이 길어질 수 있으며, 추가 배송비가 발생할 수 있습니다.
						</div>
						</p>
					</li>

					<li>
						<div class="button" data-rel="5">
							<div class="button float_5">
								<a href="#"> 비회원도 주문이 가능한가요? </a>
							</div>
						</div>
						<p>
						<div id="text5">넹</div>
						</p>
					</li>

					<li>
						<div class="button" data-rel="6">
							<div class="button float_6">
								<a href="#"> 발송 마감 시간은 언제인가요? </a>
							</div>
						</div>
						<p>
						<div id="text6">
							당일 발송(출고)을 위한 주문마감 시간은 월~금요일 오후 13시까지이며, 당일 발송(출고)된 상품은 영업일 기준
							다음날부터 배송 조회가능합니다. <br>다만, 상품의 품절이나 택배사 상황에 따라 당일 발송(출고)이 어려운
							경우도 있습니다.
						</div>
						</p>
					</li>

					<li>
						<div class="button" data-rel="7">
							<div class="button float_7">
								<a href="#"> 이벤트 당첨 시 지급되는 경품이 변경될 수 있나요? </a>
							</div>
						</div>
						<p>
						<div id="text7">
							간혹 경품 공급업체 사정으로 인한 판매 중지 시에만 동급의 타 모델 또는 적립금으로 대체 지급될 수 있으며, <br>고객님의
							개별 요청에 의한 변경은 불가능하오니, 이 점 양해 부탁드립니다.
						</div>
						</p>
					</li>

				</ul>
			</div>
			

		</section>
	</div>

</section>


<%@ include file="/views/common/footer.jsp"%>