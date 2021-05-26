<%@page import="com.kh.mvc.common.util.PageInfo"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.kh.mvc.product.model.vo.Product"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/views/common/header.jsp" %>

<%
	List<Product> management = (ArrayList)request.getAttribute("management");
	PageInfo pageInfo = (PageInfo)request.getAttribute("pageInfo");
%>
<style>
	section .prod_manage_wrap{}
	section .prod_manage_wrap .tap_wrap .tap{
		width:120px;
		height:50px;
		border-radius:25px;
		border:3px solid #c79200;
		display:inline-block;
		background-color:#f5d67f;
		margin-left:10px;
		position:absolute;
		padding-left:12px;
	}
	section .prod_manage_wrap .tap_wrap .tap .literal{
		margin-top:10px;
		font-size:1.2em;
		font-weight:bold;
	}
	section.product_list_wrap.product_list_container{width:600px; margin:0 auto; text-align:center;}
	section.product_list_wrap.product_list_container h2{margin:10px 0;}
	table#tbl-board{width:100%; margin:0 auto; border:1px solid black; border-collapse:collapse; clear:both; }
	table#tbl-board th, table#tbl-board td {border:1px solid; padding: 5px 0; text-align:center;}
	/*페이지바*/
	div#pageBar{margin-top:10px; text-align:center; background-color:#FFE56C;}
	
</style>

<section id="content">
	<div class="prod_manage_wrap">
		<h3>상품관리</h3>
		<hr>
		<div class="tap_wrap" onclick="location.href='<%= request.getContextPath() %>/product/enroll'">
			<div class="tap product_enroll">
				<div class="literal">
					<i class="fa fa-plus" aria-hidden="true"></i>
					<span>상품 등록</span>
				</div>
			</div>
		</div>
		<div class="prod_list_wrap">
			<h2 align="center">상품 리스트</h2>
			<div class="product_list_container">
				<table id="tbl-board">
					<tr>
						<th>번호</th>
						<th>상품번호</th>
						<th>카테고리No</th>
						<th>품명</th>
						<th>가격</th>
						<th>수량</th>
						<th>정기배송유무</th>
						<th colspan="2">관리</th>
					</tr>
					<%
					if (management.isEmpty()) {
					%>
					<tr>
						<td colspan="9">조회된 상품이 없습니다.</td>
					</tr>
					<%
					} else {
					for (Product product : management) {
					%>
					<tr>
						<td><%=product.getRowNum()%></td>
						<td><%=product.getProductNo()%></td>
						<td><%=product.getProductCatNo()%></td>
						<td><%=product.getProductName()%></td>
						<td><%=product.getPrice()%></td>
						<td><%=product.getProductAmount()%></td>
						<td><%=product.getRegularDeliveryAttr()%></td>
						<td>
							<input type="button" value="수정" onclick="location.href='<%=request.getContextPath()%>/product/update?categoryNo=<%=product.getProductCatNo()%>'">
							<!-- 
							<form id="updateProd" method="GET" action="<%=request.getContextPath()%>/product/update">
                            	<input type="hidden" name="categoryNo" value="<%=product.getProductCatNo()%>">
								<input type="submit" value="수정">
							</form>
							-->
						</td>
						<td><button class="btn-delete" onclick="location.replace('<%= request.getContextPath() %>/product/delete?productNo=<%=product.getProductNo()%>')">삭제</button></td>
					</tr>
			<%
					}
				}
			%>
				</table>
								
				<div id="pageBar">
					<!-- 맨 처음으로 -->
					<button onclick="location.href=' <%=request.getContextPath()%>/product/management?page=1'">&lt;&lt;</button>

					<!-- 이전 페이지로 -->
					<button onclick="location.href='<%=request.getContextPath()%>/product/management?page=<%=pageInfo.getPrvePage()%>'">&lt;</button>

					<!--  10개 페이지 목록 -->
					<%
					for (int p = pageInfo.getStartPage(); p <= pageInfo.getEndPage(); p++) {
					%>
					<%
					if (p == pageInfo.getCurrentPage()) {
					%>
					<button disabled><%=p%></button>
					<%
					} else {
					%>
					<button onclick="location.href='<%=request.getContextPath()%>/product/management?page=<%=p%>'"><%=p%></button>
					<%
					}
					%>
					<%
					}
					%>

					<!-- 다음 페이지로 -->
					<button onclick="location.href='<%=request.getContextPath()%>/product/management?page=<%=pageInfo.getNextPage()%>'">&gt;</button>

					<!-- 맨 끝으로 -->
					<button onclick="location.href='<%=request.getContextPath()%>/product/management?page=<%=pageInfo.getMaxPage()%>'">&gt;&gt;</button>
				</div>
			</div>
		</div>
	</div>
</section>
<%@ include file="/views/common/footer.jsp" %>