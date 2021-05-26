<%@page import="com.kh.mvc.common.util.PageInfo"%>
<%@page import="com.kh.mvc.product.model.vo.Product"%>
<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/views/common/header.jsp" %>

<%
	List<Product> list = (ArrayList)request.getAttribute("list");
	PageInfo pageInfo = (PageInfo)request.getAttribute("pageInfo");
    String myCategoryName = "";
%>         
<style>
	#pageTopBanner{width:1535px; height:auto; margin:0 auto; background:#FFF3BC;}
    #productContainer{ width:1300px; height: auto; margin:0 auto; background-color:#fffbed;}
    	
	#categoryBar{ width:180px; height:599px; margin-left:10px; font-size : 0.8em; float:left;}
	#categoryBar ul{ list-style-type : none;}
	#categoryBar ul li{ width:178px; height:auto; border-bottom:1px solid gray; margin-left:-40px; }
	#categoryBar ul li>.minTitle{ font-weight:bold; }
	/*#categoryBar ul li span.toggleBtn{ display:inline-block; position:absolute; left:180px;}*/
	
	#productDisplay{ width:1106px; height:auto; float:left; font-size:0.8em;}
	#productDisplay .category_area {width:95%; height:auto; margin:0 auto;}
	#productDisplay ul{ list-style-type:none; margin-left:-35px; margin-right:5px;}
	.item_display ul li{float:left;}
	.item_cont{ width:auto; height:300px;}
	.item_cont .item_photo_box {width:200px; height:200px; margin:0 auto; border:1px solid gray;}
	.item_cont .item_info_cont {width:200px; height:100px; margin:0 auto;}
	.item_cont .item_info_cont .item_title{font-weight:bold;}
	.item_cont .item_info_cont .item_price{margin-top:10px;}
	
	.item_show_menu{width:180px; height:40px; background:rgba(0,0,0,0.3); position:relative;top:-50px; left:10px; font-size:2em;}
	.item_show_menu .item_menu_btn{margin-left:12px; color:white;}
</style>

<section>
	<!-- 페이지 위 배너 이미지 -->
	<div align= "center" id="pageTopBanner">
		<% if(request.getParameter("myCategory").equals("dc") || request.getParameter("myCategory").equals("sold")) {%>
			<img src="<%= request.getContextPath() %>/resources/images/categorybanner_all.png">
		<% } else { %>
			<img src="<%= request.getContextPath() %>/resources/images/categorybanner_<%=request.getParameter("myCategory")%>.png">
		<% } %>
 	</div>
	<div id="productContainer">
		<!-- 카테고리 바 -->
		<div id="categoryBar">
			<hr>
			<h4>카테고리</h4>
			<hr>
			
			<!-- 강아지 용품 카테고리 -->
			<ul id="dogProduct">
			    <!-- 강아지 용품 카테고리 -->
                <% if(request.getParameter("myCategory").equals("dog")){ 
                    myCategoryName = "강아지";%>
                
				<li><span class="minTitle"><a>강아지</a></span></li>
				<li>
					<a>사료</a>
				</li>
				<li>
					<a>간식</a>
				</li>
				<li>
					<a>건강관리</a>
				</li>
				<li>
					<a>장난감/훈련</a>
				</li>
				<li>
					<a>배변 용품</a>
				</li>
				<li>
					<a>미용/목욕</a>
				</li>
				<%    } else if (request.getParameter("myCategory").equals("cat")){ 
                    myCategoryName="고양이";%>
                <!-- 고양이 용품 카테고리 -->
                
                <li><span class="minTitle"><a>고양이</a></span></li>
                <li>
                    <a>사료</a>
                </li>
                <li>
                    <a>간식</a>
                </li>
                <li>
                    <a>건강관리</a>
                </li>
                <li>
                    <a>배변용품</a>
                </li>
                <li>
                    <a>장난감/스크래쳐</a>
                </li>
                <li>
                    <a>캣타워</a>
                </li>
                <li>
                    <a>미용/목욕</a>
                </li>
                <% } else if(
                		request.getParameter("myCategory").equals("all") 
                	|| request.getParameter("myCategory").equals("dc")
                	|| request.getParameter("myCategory").equals("sold")
                	){ 
                	if(request.getParameter("myCategory").equals("all")) {myCategoryName="전체";}
                	else if(request.getParameter("myCategory").equals("dc")){myCategoryName="할인";}
                	else if(request.getParameter("myCategory").equals("sold")){myCategoryName="품절 임박";}%>
                <li><span class="minTitle"><a>전체</a></span></li>
				<li>
					<a>사료</a>
				</li>
				<li>
					<a>간식</a>
				</li>
				<li>
					<a>건강관리</a>
				</li>
				<li>
					<a>장난감/훈련</a>
				</li>
				<li>
					<a>배변 용품</a>
				</li>
				<li>
                    <a>장난감/스크래쳐</a>
                </li>
                <li>
                    <a>캣타워</a>
                </li>
				<li>
					<a>미용/목욕</a>
				</li>
				
				
				<% } %>
                
			</ul>
			<!-- 공용 용품 카테고리 -->
			<ul id="commonProduct">
				<li><span class="minTitle"><a>공용 용품</a></span></li>
				<li>
					<a>줄/인식표</a>
				</li>
				<li>
					<a>하우스/실내용품</a>
				</li>
				<li>
					<a>이동장/캐리어</a>
				</li>
				<li>
					<a>식기/급수기</a>
				</li>
				<li>
					<a>패션용품</a>
				</li>
			</ul>
			
		</div>
		<!-- 상품 진열 구역 -->
		<div id="productDisplay">
			<div class="category_area">
				<h3><%= myCategoryName %> 상품</h3>
				<p>상품 <%= list.size() %>개</p>
				<hr>
			</div>
			<div class="product_list">
			<!-- 상품 리스트 -->
				<div class="product_list_cont">
				<!-- 상품 리스트 내역 -->
					<div class="item_display">
						<ul>
						<%-- if(list.isEmpty()) { --%>
						<!-- <li style="width:25%;">
								<div class="item_cont">
									<div class="item_photo_box">
										<img src="<%=request.getContextPath() %>/resources/images/logo-orange.png" alt="desc" width="200px">
									</div>
									<div class="item_info_cont">
										<p>
											<span class="item_title">상품이 등록되지 않았습니다.</span><br>
											<span class="item_price">NONE!</span>
										</p>
									</div>
								</div>
							</li>
						-->	
						<%--} else { 
								for(Product product : list) {
						--%>
						<% 
						for(Product product : list) {
							%>	
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
						<%--
								}
							}
						--%>
						<% 
						}
						%>
						<script>
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
						</ul>
					</div>
				</div>
			</div>
		</div>
	</div>
	
</section>

<%@ include file="/views/common/footer.jsp" %>
