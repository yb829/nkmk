<%@page import="java.util.List"%>
<%@page import="com.kh.mvc.cart.model.vo.Cart"%>
<%@page import="com.kh.mvc.common.util.PageInfo"%>
<%@page import="com.kh.mvc.cart.model.service.CartService"%>
<%@page import="com.kh.mvc.cart.model.dao.CartDAO"%>
<%@page import="com.kh.mvc.product.model.service.ProductService"%>
<%@page import="com.kh.mvc.product.model.dao.ProductDAO"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/views/common/header.jsp" %> 

<%

%>
<style>
section{width:90%; margin:0 auto;}
#tbl-tap{width:900px;height:50px;background:orange;}
#tbl-tap th{background:#ffe09e;}
#tbl-tap a{text-decoration:none;color:black;}
#tbl-cart{width:900px;height:auto;border:1px solid gray; text-align:center;}
#tbl-cart th{background:lightgray;}
#cart-sidebar {
	width: 200px;
	padding: 30px;
	margin-bottom: 10px;
	float: right;
	border: 1px solid #bcbcbc;
}
.cartProdCount{
	width:35px;
	height:26px;
	border:1px solid gray;
}
.modifyBtn{
	display:inline-block;
	width:45px;
	height:30px;
	text-align:center;
	border:1px solid gray;
}
.selectBtn{
	background-color: orange;
	border: none;
	color: black;
	padding: 10px 15px;
	text-align: center;
	text-decoration: none;
	font-size: 0.6em;
	margin: 0px 0px;
	cursor: pointer;
}

</style>
<section>
	<div class="prod_list_wrap">
		<h2 align="left">장바구니</h2>
		<h4 align= "right">01 장바구니 > 02 주문서 작성 결제> 03 주문완료 </h4>
		<table  id="tbl-tap">						
			<tr>
				<th><a href="<%--<%=request.getContextPath()%>/cart/cart1--%>#">일반주문</a></th>
				<th><a href="<%--<%=request.getContextPath()%>/cart/cart2--%>#">정기배송</a></th>
			</tr>
		</table>
		<div class="product_list_container">
		<h4>일반구매상품</h4>
			<div id="cart-container">
				<div id="cart-sidebar">
					<h5  class="bigtext right-align sumcount" id="sum_p_num"> 개의 상품금액</h5>
					<h5> 배송비</h5>
					<h5> 30,000원 이상 구매 시 무료배송</h5>
					<hr>
					<h5 class="bigtext right-align box blue summoney" id="sum_p_price">결제예상금액: 22,470원</h5>
	
					<input type="button" class="selectBtn buyIt" value="선택상품주문">
					<input type="button" class="selectBtn deleteIt" value="선택상품삭제">
				</div>
   			</div>
			<table id="tbl-cart">
				<tr>
					<th><input type="checkBox" id="chkAll"></th>
					<th>이미지</th>
					<th>품명</th>
					<th>수량</th>
					<th>상품금액</th>
					<th>할인/적립</th>
					<th>합계금액</th>
				</tr>
				<%
				if (cartList.isEmpty()) {
				%>
				<tr>
					<td colspan="7">조회된 상품이 없습니다.</td>
				</tr>
				<%
				} else {
				for (Cart cartOn : cartList) {
				%>
				<tr>
					<td><input type="checkBox" class="chk"></td>
					<td><img src="<%= request.getContextPath() %>/resources/upload/product/<%=cartOn.getFileName()%>" width="80px"></td>
					<td><%=cartOn.getProductName()%></td>
					<td>
						<input type="number" class="cartProdCount" value="<%=cartOn.getCartCount()%>">
						<input type="button" class="modifyBtn" value="수정">
					</td>
					<td><%=cartOn.getPriceSum()/cartOn.getCartCount()%></td>
					<td>-</td>
					<td><%=cartOn.getPriceSum()%></td>
				</tr>
				<%
					}
				}
				%>
			</table>
		</div>
	</div>
</section>
<script>
$(document).ready(()=>{
	$('#chkAll').change((e) => {
		if($('#chkAll').is(':checked')){
			$('.chk').prop('checked', true);
		} else {
			$('.chk').prop('checked', false);
		}
	});
});
</script>

<%@ include file="/views/common/footer.jsp" %> 