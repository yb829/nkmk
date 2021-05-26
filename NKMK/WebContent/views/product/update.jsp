<%@page import="com.kh.mvc.common.util.Category"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="com.kh.mvc.product.model.vo.Product"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ include file="/views/common/header.jsp"%>

<%
	Product product = (Product) request.getAttribute("product");

	String categoryNo = request.getParameter("categoryNo");
	
	Category a = new Category(categoryNo);
%>

<style>
div#board-write-container {
	width: 600px;
	margin: 0 auto;
	text-align: center;
}

div#board-write-container h2 {
	margin: 10px 0;
}

table#tbl-board {
	width: 500px;
	margin: 0 auto;
	border: 1px solid black;
	border-collapse: collapse;
}

table#tbl-board th {
	width: 125px;
	border: 1px solid;
	padding: 5px 0;
	text-align: center;
}

table#tbl-board td {
	border: 1px solid;
	padding: 5px 0 5px 10px;
	text-align: left;
}
</style>

<section id="content">
	<div id='board-write-container'>
		<h2>상품 수정</h2>
		<form action="<%= request.getContextPath()%>/product/update" method="POST" enctype="multipart/form-data">
			 
			<input type="hidden" name="productNo" value="<%= product.getProductNo() %>">
			<input type="hidden" name="originalFileName" value="<%=product.getOriginalFileName()%>">
			<input type="hidden" name="renameFileName" value="<%=product.getRenamedFileName()%>">
			<table id='tbl-board'>
				<tr>
					<th>상품 카테고리 No</th>
					<td><input type="text" name="prodCatNo" id="prodCatNo"
						value="<%=product.getProductCatNo()%>"></td>
				</tr>
				<tr>
					<th>상품 이름</th>
					<td><input type="text" name="prodName" id="prodName"
						value="<%=product.getProductName()%>"></td>
				</tr>
				<tr>
					<th>상품 가격</th>
					<td><input type="text" name="price" id="price"
						value="<%=product.getPrice()%>"></td>
				</tr>
				<tr>
					<th>상품 수량</th>
					<td><input type="number" name="prodAmount" id="prodAmout"
						value="<%=product.getProductAmount()%>"></td>
				</tr>
				<tr>
					<th>상품 사진</th>
					<td><input type="file" name="reloadIMG"> 
				<%	if (product.getOriginalFileName() != null) {	%>
						<%=product.getOriginalFileName()%> 
				<%	}	%>
					</td>
				</tr>
				<tr>
					<th>정기배송 해당상품</th>
					<td>
					<% if(product.getRegularDeliveryAttr().equals("N")) {%>
						<label for="RDA_Y">유</label>
						<input type="radio" name="prodRegularDeliveryAttr" id="RDA_Y" value="Y">
						<label for="RDA_N">무</label>
						<input type="radio" name="prodRegularDeliveryAttr" id="RDA_N" value="N" checked="checked">
					<% } else { %>
						<label for="RDA_Y">유</label>
						<input type="radio" name="prodRegularDeliveryAttr" id="RDA_Y" value="Y" checked="checked">
						<label for="RDA_N">무</label>
						<input type="radio" name="prodRegularDeliveryAttr" id="RDA_N" value="N">
					<% } %>
					</td>
				</tr>
				<tr>
					<th>상품 설명</th>
					<td><textarea name="prodContents" cols="50" rows="15"><%=product.getProductContents()%></textarea></td>
				</tr>
				<tr>
					<th colspan="2">
						<input type="submit" value="수정"> 
						<input type="reset" onclick="location.replace('<%= request.getContextPath() %>/product/management')" value="이전 메뉴로">
					</th>
				</tr>
			</table>
		</form>
	</div>
</section>

<%@ include file="/views/common/footer.jsp"%>