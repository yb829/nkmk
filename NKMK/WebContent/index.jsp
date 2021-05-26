<%@page import="com.kh.mvc.common.util.Category"%>
<%@page import="java.sql.Connection"%>
<%@page import="com.kh.mvc.product.model.service.ProductService"%>
<%@page import="com.kh.mvc.product.model.dao.ProductDAO"%>
<%@page import="com.kh.mvc.common.util.PageInfo"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="com.kh.mvc.product.model.vo.Product"%>
<%@page import="static com.kh.mvc.common.jdbc.JDBCTemplate.*" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ include file="/views/common/header.jsp" %> 

<%
	ProductDAO dao = new ProductDAO();
	ProductService service = new ProductService();
	Connection connection = getConnection();

	int listCount = 0;
	PageInfo pageInfo = null;
	List<Product> list = null;
	
	listCount = service.getProductCount(); // 전체 상품 개수
	pageInfo = new PageInfo(1, 10, listCount, listCount);
	
	String str = "all";
	Category cg = new Category(str);
	list = service.getProductList(pageInfo, cg);
	
%>

<style type="text/css">
	section#content{
		width:auto;
	}
	#wrap{
		width:90%;
		height:auto;
		margin:0 auto;
	}
	.slider-wrap{
		width:100%;
		height:370px;
		background-color:#fff7e0;
	}
	.banner-slider{
		width:1100px;
		height:400px;
		margin:0 auto;
	}
	.banner-slider .prev{
  		/*position:absolute;
  		top:320px;left:5%;*/
  		font-size:3em;
  		color:#bf8e00;
  		cursor: pointer;
  		float:left;
  		margin-top:160px;
  		margin-left:10px;
  		margin-right:20px;
	}
	.banner-slider .next{
		/*position:absolute;
		top:320px;right:5%;*/
		font-size:3em;
		color:#bf8e00;
		cursor: pointer;
		float:left;
		margin-top:160px;
		margin-left:20px;
  		/*margin-right:10px;*/
	}
	.banner-slider .banner-wrapper{
		width:1000px;
		height:372px;
		margin:0 auto;
		float:left;
	}
	.banner-slider .banner-wrapper .banner{
		width:1000px;
		height:370px;
		margin:0 auto;
		/*background:#ffebb5;*/
	}
	
	.btn-header{
		text-align:center;
		font-size:1.5em;
		font-weight:bolder;	
	}
	
	.btn-wrap{
		width:100%;
		height:auto;
		text-align:center;
		margin-top:50px;
	}
	.btn-wrap .btn-main-page{
		width:170px;
		height:170px;
		display:inline-block;
		border-radius:50% 50% 50% 50%;
		margin-left:50px;
		background-color:#FCCDAE;
	}
	.btn-wrap .btn-main-page:first-child{
		margin-left:0px;
	}
	
	.btn-wrap .btn-main-page .btn-img{
		width:100px;
		height:100px;
		margin-top:20px;
	}
	.btn-wrap .btn-main-page .btn-name{
		font-size:1.3em;
		font-weight:bolder;
	}
	.product-wrap { width:95%; height:auto; overflow: hidden; border:1px solid gray; margin:50px auto 0 auto;}
	.product-wrap ul{ list-style-type:none;margin-left:-35px; margin-right:5px;}
	.product-wrap ul li{float:left;}
	.item_cont{ width:auto; height:300px;}
	.item_cont .item_photo_box {width:200px; height:200px; margin:0 auto; border:1px solid gray;}
	.item_cont .item_info_cont {width:200px; height:100px; margin:0 auto;}
	.item_cont .item_info_cont .item_title{font-weight:bold;}
	.item_cont .item_info_cont .item_price{margin-top:10px;}
	
	.item_show_menu{width:180px; height:40px; background:rgba(0,0,0,0.3); position:relative;top:-50px; left:10px; font-size:1.5em;}
	.item_show_menu .item_menu_btn{margin-left:12px; color:white;}
</style>

<section id="content">
	<div id="wrap">
		<div class="slider-wrap">
			<div class="banner-slider">
				<i class="fa fa-angle-left prev" aria-hidden="true"></i>
				<div class="banner-wrapper">
					<div class="banner">
						<img
							src="<%=request.getContextPath()%>/resources/images/banner_sample01.png"
							alt="banner01" onclick="location.href='<%=request.getContextPath()%>/member/enroll1'">
					</div>
					<div class="banner">
						<img
							src="<%=request.getContextPath()%>/resources/images/banner_sample02.png"
							alt="banner02" onclick="location.href='<%=request.getContextPath()%>/board/eventmain'">
					</div>
					<div class="banner">
						<img
							src="<%=request.getContextPath()%>/resources/images/banner_sample03.png"
							alt="banner03">
					</div>
					<div class="banner">
						<img
							src="<%=request.getContextPath()%>/resources/images/banner_sample04.png"
							alt="banner04" onclick="location.href='<%=request.getContextPath()%>/product/list?myCategory=dog'">
					</div>
					<div class="banner">
						<img
							src="<%=request.getContextPath()%>/resources/images/banner_sample05.png"
							alt="banner05" onclick="location.href='<%=request.getContextPath()%>/product/list?myCategory=cat'">
					</div>
				</div>
				<i class="fa fa-angle-right next" aria-hidden="true"></i>
			</div>
		</div>
		<div class="btn-header">
			<p>우리의 작은 가족을 위한 선택, 냥꿀멍꿀</p>
		</div>
		<div class="btn-wrap">
			<div class="btn-main-page dogProdLink" onclick="location.href='<%=request.getContextPath()%>/product/list?myCategory=dog'">
				<img class="btn-img" src="<%=request.getContextPath()%>/resources/images/main_page_dog.png" alt="dogProdLink">
				<br>
				<span class="btn-name">강아지</span>
			</div>
			<div class="btn-main-page catProdLink" onclick="location.href='<%=request.getContextPath()%>/product/list?myCategory=cat'">
				<img class="btn-img" src="<%=request.getContextPath()%>/resources/images/main_page_cat.png" alt="catProdLink"> 
				<br>
				<span class="btn-name">고양이</span>
			</div>
			<div class="btn-main-page dcProdLink" onclick="location.href='<%=request.getContextPath()%>/product/list?myCategory=dc'">
				<img class="btn-img" src="<%=request.getContextPath()%>/resources/images/main_page_discount.png" alt="dcProdLink"> 
				<br>
				<span class="btn-name">특가할인</span>
			</div>
			<div class="btn-main-page soldProdLink" onclick="location.href='<%=request.getContextPath()%>/product/list?myCategory=sold'">
				<img class="btn-img" src="<%=request.getContextPath()%>/resources/images/main_page_sold.png" alt="soldProdLink"> 
				<br>
				<span class="btn-name">품절임박</span>
			</div>
		</div>
		<div class="product-wrap">
			<ul>
			<% for(Product product : list){ %>
				<li style="width:25%;">
					<div class="item_cont">
						<div class="item_photo_box">
							<img src="<%= request.getContextPath() %>/resources/upload/product/<%= product.getRenamedFileName() %>" alt="상품사진" width="200px">
							<div class="item_show_menu">
								<i class="fa fa-info-circle item_detail item_menu_btn" aria-hidden="true"></i>
								<i class="fa fa-share-alt item_share item_menu_btn" aria-hidden="true"></i>
								<i class="fa fa-cart-plus item_cart_save item_menu_btn" aria-hidden="true" 
									onclick="if(confirm('장바구니에 추가하시겠습니까?'))location.href='<%=request.getContextPath()%>/cart/insert?productNo=<%= product.getProductNo() %>'"></i>
								<i class="fa fa-heart-o item_love_it item_menu_btn" aria-hidden="true"></i>
							</div>
						</div>
						<div class="item_info_cont">
							<p>
								<span class="item_title"><%= product.getProductName() %></span><br>
								<span class="item_price"><%= product.getPrice() %>원</span>
							</p>
						</div>
					</div>
				</li>
			<% } %>
			</ul>
		</div>
	</div>
	<script>
	$('.banner-wrapper').slick({
		slidesToShow: 1,
		slidesToScroll: 1,
		autoplay: true,
		speed: 1250,
		autoplaySpeed: 3000,
		nextArrow: $('.next'),
		prevArrow: $('.prev'),
	});
	$(document).ready(()=>{
		$("div.item_show_menu").hide();
		$(".item_photo_box").hover(function(){
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
</section>

<%@ include file="/views/common/footer.jsp" %>