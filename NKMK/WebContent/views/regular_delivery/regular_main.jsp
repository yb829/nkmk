<%@page import="com.kh.mvc.product.model.vo.Product"%>
<%@page import="com.kh.mvc.common.util.PageInfo"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="/views/common/header.jsp"%>

<%
	String id = (String)request.getAttribute("userId");
	String pwd = (String)request.getAttribute("userPwd");
	Member loginMember2 = (Member)session.getAttribute("loginMember");
	
	List<Product> list = (ArrayList)request.getAttribute("list");
	PageInfo pageInfo = (PageInfo)request.getAttribute("pageInfo");
    String category_rd_name = "";
%>
<style>
	.button{
		width:90px;
		height:30px;
		background-color:darkorange;
		border:0;
	}
	
	.main_image{
		text-align:center;
	}
	
	#picture{
		align:center;
	}
	
	form{
		display:inline;
	}
	
	<%-- 상품 진열 배열 --%>
	#productDisplay{ width:1106px; height:auto; float:left; font-size:0.8em;}
	.category_area {width:95%; height:auto; margin:0 auto;}
	#productDisplay ul{ list-style-type:none; margin-left:-60px; margin-right:140px;}
	
	
	.item_display ul li{float:left;}
	.item{ width:auto; height:200px; }
	.item_image {width:200px; height:200px; margin:0 auto; border:1px solid gray;}
	.item_info {width:200px; height:100px; margin:0 auto;}
	.item_title{font-weight:bold; width:200px;}
	.item_price{margin-top:10px;}
	.item_tag{color: rgb(241, 160, 9);}
	
	<%-- hover 관련 --%>
	.item_show_menu{width:180px; height:40px; background:rgba(0,0,0,0.3); position:relative;top:-50px; left:10px; font-size:2em;}
	.item_show_menu .item_menu_btn{margin-left:12px; color:white;}
</style>
<section id="content">
	<div id="title">
		<h2>정기배송</h2>
		<hr>
		<div id="test">
			정기배송이란?&emsp;&emsp;&emsp;
			<form id="area_detail" action="<%=request.getContextPath() %>/regularDelivery/details" method="GET">
				<input class="button" id="detail" type="button" value="자세히보기">&emsp;&emsp;
			</form>
			
			<form id="area_apply" action="<%=request.getContextPath() %>/regularDelivery/apply" method="GET">
				<input class="button" id="apply" type="button" value="신청하기">&emsp;&emsp;
				<input type="hidden" name="id" value="<%=loginMember2.getId()%>">
				<input type="hidden" name="pwd" value="<%=loginMember2.getPassword()%>">
				<input type="hidden" name="loginMember2" value="<%=loginMember2 != null ? loginMember2 : ""%>">
			</form>
			
			<form id="area_cancel" action="<%=request.getContextPath() %>/regularDelivery/cancel" method="GET"> 
				<input class="button" id="cancel" type="button" value="취소하기">
				<input type="hidden" name="id" value="<%=loginMember2.getId()%>">
				<input type="hidden" name="pwd" value="<%=loginMember2.getPassword()%>">
				<input type="hidden" name="loginMember2" value="<%=loginMember2 != null ? loginMember2 : ""%>">
			</form>
			<hr>
		</div>
	</div>
	
	<%-- 정기배송 이미지 --%>
	<div class="main_image">
		<img id="picture" src="<%=request.getContextPath() %>/resources/images/regularDelivery.png">
	</div>
	<hr>
	상품목록<br>
	<span>상품 <%=list.size() %>개</span>
	<hr>
	
	<%-- 상품 목록 --%>
	<div id="productDisplay">
		<div class="item_display">
			<ul>
				<%
				for (Product product : list) {
				%>
				<li style="width: 25%;">
					<div class="item">
						<div class="item_image">
							<img
								src="<%=request.getContextPath()%>/resources/upload/product/<%=product.getRenamedFileName()%>"
								alt="상품사진" width="200px">
							<div class="item_show_menu">
								<i class="fa fa-info-circle item_detail item_menu_btn"
									aria-hidden="true"></i> <i
									class="fa fa-share-alt item_share item_menu_btn"
									aria-hidden="true"></i> <i class="fa fa-cart-plus item_cart_save item_menu_btn" aria-hidden="true" 
									onclick="if(confirm('장바구니에 추가하시겠습니까?'))location.href='<%=request.getContextPath()%>/cart/insert?productNo=<%= product.getProductNo() %>'"></i> <i
									class="fa fa-heart-o item_love_it item_menu_btn"
									aria-hidden="true"></i>
							</div>
						</div>
					</div>
					<div class="item_info">
						<p>
							<span class="item_tag">정기배송</span><br> <span
								class="item_title"><%=product.getProductName()%></span><br>
							<span class="item_price"><%=product.getPrice()%>원</span>
						</p>
					</div>
				</li>
				<%
				}
				%>
			</ul>
		</div>
	</div>

</section>
<script>
	$(document).ready(() => {
		$('#detail').on('click', (e) => {
			$('#area_detail').submit();
		});
		
		$('#apply').on('click', (e) => {
			if(<%= loginMember2 == null%>){
				alert("로그인해주세요");	
				location.href="<%= request.getContextPath()%>/member/login";
			}
			else if(<%= loginMember2.getRegular_delivery().equals("Y")%>){
				alert("정기배송 신청자입니다.");
				location.href="<%= request.getContextPath()%>/";
			}
			else{
				$('#area_apply').submit();
			}
		});
		
		$('#cancel').on('click', (e) => {
			if(<%= loginMember2.getRegular_delivery().equals("Y")%>){
				$('#area_cancel').submit();
			}
			else{
				alert("정기배송 등록이 없습니다.")
				location.href="<%= request.getContextPath()%>/";
			}
		});
	});
	
	$(document).ready(() => {
		$("div.item_show_menu").hide();
		$(".item_image").hover(function(){
			$(this).find(".item_show_menu").show();
		}, function(){
			$(this).find(".item_show_menu").hide();
		});
		$(".item_detail").on("click",function(event){
			alert("상품 상세보기 클릭!");
		});
		$(".item_share").on("click",function(event){
			alert("상품 공유 클릭!");
		});
		$(".item_cart_save").on("click",function(event){
			
		});
		$(".item_love_it").on("click",function(event){
			alert("상품 찜하기 클릭!");
		});
	});
</script>

<%@ include file="/views/common/footer.jsp" %>