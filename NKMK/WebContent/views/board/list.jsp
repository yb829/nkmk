<%@page import="com.kh.mvc.common.util.PageInfo"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.kh.mvc.board.model.vo.Board"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%> 
    
<%@ include file="/views/common/header.jsp" %>

<%
	List<Board> list = (ArrayList) request.getAttribute("list");
	PageInfo pageInfo = (PageInfo) request.getAttribute("pageInfo");
%>

<style>
	table#tbl-board{width:100%; margin:0 auto; border:1px solid black; border-collapse:collapse; background-color:rgba(254, 242, 205, 0.95); }
	table#tbl-board th, table#tbl-board td {border:1px solid; padding: 5px 0; text-align:center;} 
	/*글쓰기버튼*/
	input#btn-add{float:right; margin: 0 0 15px;}
	/*페이지바*/
	div#pageBar{margin-top:10px; text-align:center; background-color:rgba(186, 238, 242, 0.88);}

#board-container {
	width: 100%;
	margin: 0px auto;
	padding: auto;
}

#board-content {
	width: 700px;
	padding: 20px;
	margin-bottom: 20px;
	float: left;
	border: 1px solid #bcbcbc;
}

#board-sidebar {
	width: 200px;
	padding: 30px;
	margin-bottom: 10px;
	float: left;
	border: 1px solid #bcbcbc;
}

#board-content, board-sidebar {
	text-align: center;
}



	
</style>
<section>
	<div id="board-container">
		<div id="board-sidebar">
			<h2>고객센터</h2>
			<ul>
				<li><a href="<%=request.getContextPath()%>/board/list">공지사항</a></li>
				<li><a href="<%=request.getContextPath()%>/board/11board">1:1문의</a></li>
				<li><a href="<%=request.getContextPath()%>/board/fqa">자주묻는질문</a></li>
			</ul>
		</div>
		
<section id="content">
	<h2 align="center">공지사항 </h2>
	<div id="board-list-container">
	<% if (loginMember != null) {%>
		<button type="button" id="btn-add"
			onclick="location.href='<%= request.getContextPath() %>/board/write'">공지사항글쓰기</button>
	<% } %>
		<table id="tbl-board">
			<tr style="background-color:rgba(241, 214, 116, 1);">
				<th style="width:5%;">번호</th>
				<th style="width:60%;">제목</th>
				<th style="width:10%;">작성자</th>
				<th style="width:10%;">작성일</th>
				<th style="width:8%;">첨부파일</th>
				<th style="width:5%;">조회수</th>
			</tr>
		<% if(list.isEmpty()) {%>
			<tr>
				<td colspan="6">
					조회된 게시글이 없습니다.
				</td>
			</tr>	
		<% } else {
				for(Board board : list) {
		%>
			<tr>
				<td><%= board.getRowNum() %></td>
				<td>
					<a href="<%= request.getContextPath() %>/board/view?boardNo=<%= board.getNo() %>">
						<%= board.getTitle() %>					
					</a>
				</td>
				<td><%= board.getWriterId() %></td>
				<td><%= board.getCreateDate() %></td>
				<td>
				<% if(board.getOriginalFileName() != null) { %>
					<img src="<%= request.getContextPath() %>/resources/images/file.png" width="20" height="20"/>
				<% } else { %>
					<span> - </span>
				<% } %>
				</td>
				<td><%= board.getReadCount() %></td>
			</tr>
		<% 
				}
			} 
		%>
		</table>
		<div id="pageBar">
			<!-- 맨 처음으로 -->
			<button onclick="location.href='<%= request.getContextPath() %>/board/list?page=1'">&lt;&lt;</button>
			
			<!-- 이전 페이지로 -->
			<button onclick="location.href='<%= request.getContextPath() %>/board/list?page=<%= pageInfo.getPrvePage() %>'">&lt;</button>

			<!--  10개 페이지 목록 -->
			<% for (int p = pageInfo.getStartPage(); p <= pageInfo.getEndPage(); p++) { %>
				<% if(p == pageInfo.getCurrentPage()) { %>
					<button disabled><%= p %></button>
				<% } else { %>
					<button onclick="location.href='<%= request.getContextPath() %>/board/list?page=<%= p %>'"><%= p %></button>
				<% } %>
			<% } %>
			
			<!-- 다음 페이지로 -->
			<button onclick="location.href='<%= request.getContextPath() %>/board/list?page=<%= pageInfo.getNextPage()%>'">&gt;</button>
			
			<!-- 맨 끝으로 -->
			<button onclick="location.href='<%= request.getContextPath() %>/board/list?page=<%= pageInfo.getMaxPage() %>'">&gt;&gt;</button>
		</div>
	</div>
</section>
</div>

</section>
<%@ include file="/views/common/footer.jsp" %>