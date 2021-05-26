<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ include file="/views/common/header.jsp" %>

<style>
	div#board-write-container
	{
		width:600px;
		margin:0 auto;
		text-align:center;
	}
	
	div#board-write-container h2
	{
		margin:10px 0;
	}
	
	table#tbl-board
	{
		width:500px;
		margin:0 auto;
		border:1px solid black;
		border-collapse:collapse;
	}
	
	table#tbl-board th
	{
		width:125px;
		border:1px solid;
		padding:5px 0;
		text-align:center;
	}
	
	table#tbl-board td
	{
		border:1px solid;
		padding:5px 0 5px 10px;
		text-align:left;
	}
</style>

<section id="content">
	<div id='board-write-container'>
		<h2>상품등록</h2>
		<form action="<%= request.getContextPath()%>/product/enroll" method="POST" 
					enctype="multipart/form-data">
			<table id='tbl-board'>
				<tr>
					<th>상품 카테고리 No</th>
					<td><input type="text" name="prodCatNo" id="prodCatNo"></td>
				</tr>
				<tr>
					<th>상품 이름</th>
					<td><input type="text" name="prodName" id="prodName"></td>
				</tr>
				<tr>
					<th>상품 가격</th>
					<td><input type="text" name="price" id="price"></td>
				</tr>
				<tr>
					<th>상품 수량</th>
					<td><input type="number" name="prodAmount" id="prodAmout"></td>
				</tr>
				<tr>
					<th>상품 사진</th>
					<td><input type="file" name="prodIMG"></td>
				</tr>
				<tr>
					<th>정기배송 해당상품</th>
					<td>
						<label for="RDA_Y">유</label>
						<input type="radio" name="prodRegularDeliveryAttr" id="RDA_Y" value="Y">
						<label for="RDA_N">무</label>
						<input type="radio" name="prodRegularDeliveryAttr" id="RDA_N" value="N" checked="checked">
					</td>
				</tr>
				<tr>
					<th>상품 설명</th>
					<td><textarea name="prodContents" cols="50" rows="15" ></textarea></td>
				</tr>
				<tr>
					<th colspan="2">
						<input type="submit" value="등록">
						<input type="reset" value="취소">
					</th>
				</tr>
			</table>
		</form>
	</div>
</section>

<%@ include file="/views/common/footer.jsp" %>