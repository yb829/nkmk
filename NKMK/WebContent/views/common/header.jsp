<%@page import="com.kh.mvc.member.model.vo.Member"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
    
<%
	Member loginMember = (Member)session.getAttribute("loginMember");

	String saveId = null;
	
	Cookie[] cookies = request.getCookies();
	
	if(cookies != null){
		for(Cookie cookie : cookies){
			if(cookie.getName().equals("saveId")){
				saveId = cookie.getValue();
				break;
			}
		}
	}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>냥꿀멍꿀</title>
<link rel="stylesheet" href="<%= request.getContextPath() %>/resources/css/style.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
<script src="<%= request.getContextPath() %>/resources/js/jquery-3.6.0.min.js"></script>

<!-- slick 슬라이드 라이브러리 CSS -->
<link rel="stylesheet" type="text/css" href="https://cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.css"/>
<!-- slick 슬라이드 라이브러리 JS -->
<script type="text/javascript" src="https://cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.min.js"></script>

</head>
<body>
	<header>
		<div id="headerContainer">
			<div id="mainLogo" onclick="location.href='<%= request.getContextPath() %>/'">
				<img src="<%= request.getContextPath() %>/resources/images/main_logo.png"> <!-- 냥꿀멍꿀 로고 이미지 삽입 -->
				<p>냥꿀멍꿀</p>
			</div>
			<div id="headerSearch">
				<input type="text" id="searchTab" placeholder="검색하세요.">
				<button type="submit" id="searchButton"><i class="fa fa-search" aria-hidden="true"></i></button>
			</div>
			<div id="headerMiniMenu">
                <div id="myPageBtn" onclick ="location.href='<%= request.getContextPath() %>/board/mypage'">
					<i class="fa fa-user" aria-hidden="true"></i>
					<br>
					<span>마이페이지</span>
				</div>
				<div id="myCartBtn" onclick ="location.href='<%= request.getContextPath() %>/cart/list'">
					<i class="fa fa-shopping-basket" aria-hidden="true"></i>
					<br>
					<span>장바구니</span>
				</div>
				<div id="myProdBtn" onclick="location.href='<%= request.getContextPath() %>/product/management'">
					<i class="fa fa-gift" aria-hidden="true"></i>
					<br>
					<span>상품관리</span>
				</div>
			</div>
			<% if(loginMember != null){ %>
				<div class="user">
					<span><%= loginMember.getName() %>님, 환영합니다!</span>
				</div>
			<% } else {%>
				<div class="user">
					<span>고객님, 환영합니다!</span>
				</div>
			<% } %>
		</div>
		<nav>
		    <!--    <form id="header_nav" method="POST" action="">    -->
                <ul class="main-nav">
                	<li>
                        <form id="header_nav" method="GET" action="<%=request.getContextPath()%>/product/list">
                            <input type="hidden" name="myCategory" value="all">
                            <input type="submit" value="전체 카테고리" style="border:none;background:none;font-size:1em;">
                        </form>
                    </li>
                    <li>
                        <form id="header_nav" method="GET" action="<%=request.getContextPath()%>/product/list">
                            <input type="hidden" name="myCategory" value="dog">
                            <input type="submit" value="강아지" style="border:none;background:none;font-size:1em;">
                        </form>
                    </li>
                    <li>
                        <form id="header_nav" method="GET" action="<%=request.getContextPath()%>/product/list">
                            <input type="hidden" name="myCategory" value="cat">
                            <input type="submit" value="고양이" style="border:none;background:none;font-size:1em;">
                        </form>
                    </li>
                   
                    <li>
                    	<form id="regularDelivery" method="GET" action="<%=request.getContextPath()%>/regular/delivery">
                    		<input type="hidden" name="id" value="<%=loginMember != null ? loginMember.getId() : "a"%>">
                    		<input type="hidden" name="pwd" value="<%=loginMember != null ? loginMember.getPassword() : "b"%>">
                    		<input type="hidden" name="login" value="<%=loginMember != null ? loginMember : "c"%>">
                    		<input type="hidden" name="myCategory_rd" value="all">
                    		<input type="submit" value="정기배송" style="border:none;background:none;font-size:1em;">
                    	</form>
                    </li>
                    <li><a href="<%=request.getContextPath()%>/board/eventmain">이벤트</a></li>
                    <li><a href="<%=request.getContextPath()%>/board/review">리뷰게시판</a></li>
                	<li><a href="<%=request.getContextPath()%>/member/enroll1">회원가입</a></li>
                	<li><a href="<%=request.getContextPath()%>/member/login">로그인</a></li>
                    <% if(loginMember != null){ %>
                        <li><a href="<%= request.getContextPath()%>/member/logout">로그아웃</a></li>
                    <%} %>
                    <li><a href="<%=request.getContextPath()%>/board/list">고객센터</a></li>
                </ul>
        <!-- </form>  -->
		</nav>
	</header>
