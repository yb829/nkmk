<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/views/common/header.jsp" %>

<style>
	#productContainer{ width:1300px; height: 1100px; margin:0 auto; background-color:#fffbed;}
	
	#categoryBar{ width:180px; height:599px; margin-left:10px; font-size : 0.8em; float:left;}
	#categoryBar ul{ list-style-type : none;}
	#categoryBar ul li{ width:178px; height:auto; border-bottom:1px solid gray; margin-left:-40px; }
	#categoryBar ul li>.minTitle{ font-weight:bold; }
	/*#categoryBar ul li span.toggleBtn{ display:inline-block; position:absolute; left:180px;}*/
	
	#productDisplay{ width:1106px; height:auto; float:left; font-size:0.8em;}
	#productDisplay .category_area {width:95%; height:auto; margin:0 auto;}
	#productDisplay ul{ list-style-type:none; margin-left:-35px; margin-right:5px;}
	.item_display ul li{float:left;}
	.item_cont{ width:auto; height:300px; border:1px solid gray;}
	.item_cont .item_photo_box {width:200px; height:200px; margin:0 auto; border:1px solid gray;}
	.item_cont .item_info_cont {width:200px; height:100px; margin:0 auto;}
	.item_cont .item_info_cont .item_title{font-weight:bold;}
	.item_cont .item_info_cont .item_price{margin-top:10px;}
</style>

<section>
	
	<div id="productContainer">
		<!-- 카테고리 바 -->
		<div id="categoryBar">
			<hr>
			<h4>카테고리</h4>
			<hr>
			<!-- 강아지 용품 카테고리 -->
			<ul id="dogProduct">
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
				<h3>카테고리 이름</h3>
				<p>상품 00개</p>
				<hr>
			</div>
			
			<div class="product_list">
			<!-- 상품 리스트 -->
				<div class="product_list_cont">
				<!-- 상품 리스트 내역 -->
					<div class="item_display">
						<ul>
							<li style="width:25%;">
								<div class="item_cont">
									<div class="item_photo_box">
										<img src="<%=request.getContextPath() %>/resources/images/logo-orange.png" alt="desc" width="200px">
									</div>
									<div class="item_info_cont">
										<p>
											<span class="item_title">우리집 냥냥이가 좋아하는 정말 맛있는 간식!</span><br>
											<span class="item_price">10,000원</span>
										</p>
									</div>
								</div>
							</li>
							<li style="width:25%;">
								<div class="item_cont">
									<div class="item_photo_box">
										<img src="<%=request.getContextPath() %>/resources/images/logo-orange.png" alt="desc" width="200px">
									</div>
									<div class="item_info_cont">
										<p>
											<span class="item_title">우리집 냥냥이가 좋아하는 정말 맛있는 간식!</span><br>
											<span class="item_price">10,000원</span>
										</p>
									</div>
								</div>
							</li>
							<li style="width:25%;">
								<div class="item_cont">
									<div class="item_photo_box">
										<img src="<%=request.getContextPath() %>/resources/images/logo-orange.png" alt="desc" width="200px">
									</div>
									<div class="item_info_cont">
										<p>
											<span class="item_title">우리집 냥냥이가 좋아하는 정말 맛있는 간식!</span><br>
											<span class="item_price">10,000원</span>
										</p>
									</div>
								</div>
							</li>
							<li style="width:25%;">
								<div class="item_cont">
									<div class="item_photo_box">
										<img src="<%=request.getContextPath() %>/resources/images/logo-orange.png" alt="desc" width="200px">
									</div>
									<div class="item_info_cont">
										<p>
											<span class="item_title">우리집 냥냥이가 좋아하는 정말 맛있는 간식!</span><br>
											<span class="item_price">10,000원</span>
										</p>
									</div>
								</div>
							</li>
							<li style="width:25%;">
								<div class="item_cont">
									<div class="item_photo_box">
										<img src="<%=request.getContextPath() %>/resources/images/logo-orange.png" alt="desc" width="200px">
									</div>
									<div class="item_info_cont">
										<p>
											<span class="item_title">우리집 냥냥이가 좋아하는 정말 맛있는 간식!</span><br>
											<span class="item_price">10,000원</span>
										</p>
									</div>
								</div>
							</li>
							<li style="width:25%;">
								<div class="item_cont">
									<div class="item_photo_box">
										<img src="<%=request.getContextPath() %>/resources/images/logo-orange.png" alt="desc" width="200px">
									</div>
									<div class="item_info_cont">
										<p>
											<span class="item_title">우리집 냥냥이가 좋아하는 정말 맛있는 간식!</span><br>
											<span class="item_price">10,000원</span>
										</p>
									</div>
								</div>
							</li>
							<li style="width:25%;">
								<div class="item_cont">
									<div class="item_photo_box">
										<img src="<%=request.getContextPath() %>/resources/images/logo-orange.png" alt="desc" width="200px">
									</div>
									<div class="item_info_cont">
										<p>
											<span class="item_title">우리집 냥냥이가 좋아하는 정말 맛있는 간식!</span><br>
											<span class="item_price">10,000원</span>
										</p>
									</div>
								</div>
							</li>
							<li style="width:25%;">
								<div class="item_cont">
									<div class="item_photo_box">
										<img src="<%=request.getContextPath() %>/resources/images/logo-orange.png" alt="desc" width="200px">
									</div>
									<div class="item_info_cont">
										<p>
											<span class="item_title">우리집 냥냥이가 좋아하는 정말 맛있는 간식!</span><br>
											<span class="item_price">10,000원</span>
										</p>
									</div>
								</div>
							</li>

						</ul>
					</div>
				</div>
			</div>
		</div>
	</div>
	
</section>

<%@ include file="/views/common/footer.jsp" %>
