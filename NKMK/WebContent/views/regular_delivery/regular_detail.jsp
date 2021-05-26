<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="/views/common/header.jsp"%>
<style>
	.list{
		margin-bottom:25px;
	}
	
	.enlarge{
		font-size:30px;
		display:inline;
	}
	
	.substance{
		font-size:20px;
	}
</style>
<section id="content">
	<h1>정기배송</h1>
	<hr>
	<h3>서비스 이용 절차</h3>
	<img id="picture" src="<%=request.getContextPath()%>/resources/images/serviceProdedure.png">
	<br>
	<h3>유의사항</h3>
	
	<div id="notice">
		<ul>
			<li class="list">정기배송 가능한 상품에 한하여 주문 가능합니다.</li>
			<li class="list">정기배송 설정한 카드의 잔액 부족, 분실 등으로 결제되지 않은 경우 정기배송이 취소될 수 있습니다.</li>
			<li class="list">정기배송 상품 품절의 경우 부분취소가 불가하여 부득이하게 전체 취소 후 재결제로 처리됩니다.</li>
			<li class="list">제주도, 도서산간 지역 혹은 택배사 사정에 따라 수령일이 변경될 수 있습니다.</li>
		</ul>
	</div>
	<br>
	<div id="question">
		<h3>자주하는 Q&A</h3>
		<span class="substance">
			<p class="enlarge">&nbsp;&nbsp;&nbsp;Q.</p> 정기배송 상품도 할인쿠폰을 사용할 수 있나요? </span><br>
		<span class="substance">
			<p class="enlarge">&nbsp;&nbsp;&nbsp;A.</p> 정기배송 상품은 매달 최대 10% 할인 혜택이 자동으로 주어지며, 별도의 
			할인쿠폰 적용은<br>&emsp;&emsp;&emsp; 불가능합니다.(중복할인불가)</span><br><br><br>
		<span class="substance">
			<p class="enlarge">&nbsp;&nbsp;&nbsp;Q.</p> 정기배송 결제 카드는 어떻게 변경하나요?</span><br>
		<span class="substance">
			<p class="enlarge">&nbsp;&nbsp;&nbsp;A.</p> 정기배송 신청 이후 결제 카드 변경은 어려우니 변경을 원하실 경우, 
			정기배송 서비스 취소 후<br>&emsp;&emsp;&emsp; 재신청하여 부탁드립니다.</span><br><br><br>
		<span class="substance">
			<p class="enlarge">&nbsp;&nbsp;&nbsp;Q.</p> 주소나 날짜 변경이 가능한가요?</span><br>
		<span class="substance">
			<p class="enlarge">&nbsp;&nbsp;&nbsp;A.</p> 정기배송 서비스 신청 이후 주소나 날짜변경은 불가능하여 번거로우시겠지만 
			변경을 원하실<br>&emsp;&emsp;&emsp; 경우 서비스 해지 후 재신청하여 이용 부탁드립니다.</span>
	</div>
	<br><br><br><br>
	
	<div>
		
	</div>
</section>

<%@ include file="/views/common/footer.jsp"%>