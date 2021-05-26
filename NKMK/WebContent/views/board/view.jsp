<%@page import="com.kh.mvc.board.model.vo.Reply"%>
<%@page import="com.kh.mvc.board.model.vo.Board"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/views/common/header.jsp" %>

<%
	Board board = (Board) request.getAttribute("board");
%>

<style>
    section>div#board-write-container{width:600px; margin:0 auto; text-align:center;}
    section>div#board-write-container h2{margin:10px 0;}
    table#tbl-board{width:500px; margin:0 auto; border:1px solid black; border-collapse:collapse; clear:both; }
    table#tbl-board th {width: 125px; border:1px solid; padding: 5px 0; text-align:center;} 
    table#tbl-board td {border:1px solid; padding: 5px 0 5px 10px; text-align:left;}
    
   
</style>
<section id="content">   
	<div id="board-write-container">
		<h2>게시판</h2>
		<table id="tbl-board" style="width:100%">
			<tr>
				<th style="background-color:rgba(254, 242, 205, 0.95)">글번호</th>
				<td><%= board.getNo() %></td>
			</tr>
			<tr>
				<th style="background-color:rgba(254, 242, 205, 0.95)">제 목</th>
				<td><%= board.getTitle() %></td>
			</tr>
			<tr>
				<th style="background-color:rgba(254, 242, 205, 0.95)">작성자</th>
				<td><%= board.getWriterId() %></td>
			</tr>
			<tr>
				<th style="background-color:rgba(254, 242, 205, 0.95)" >조회수</th>
				<td><%= board.getReadCount() %></td>
			</tr>
			<tr>
				<th style="background-color:rgba(254, 242, 205, 0.95)">첨부파일</th>
				<td>
				<% if(board.getOriginalFileName() != null) { %>
					<a href="javascript:fileDownload('<%= board.getOriginalFileName() %>', '<%= board.getRenamedFileName() %>')">
						<img src="<%= request.getContextPath() %>/resources/images/file.png" width="20" height="20"/>
						<%= board.getOriginalFileName() %>
					</a>
					<script>
						function fileDownload(oriname, rename) {
							const url = "<%= request.getContextPath() %>/board/fileDown";
							
							let oName = encodeURIComponent(oriname);
							let rName = encodeURIComponent(rename);
							
							console.log(oName, rName);
							location.assign(url+"?oriname="+oName+"&rename="+rName);
						}
					</script>			
				<% } else { %>
					<span> - </span>
				<% } %>
				</td>
			</tr>
			<tr>
				<th style="background-color:rgba(254, 242, 205, 0.95)">내 용</th>
				<td style="height:500px; background-color:rgba(255, 251, 240, 1)"><%= board.getContent() %></td>
			</tr>
			<tr>
				<th colspan="2">
				<% if(loginMember != null && (loginMember.getId().equals(board.getWriterId())
							|| loginMember.getRole().equals("ROLE_ADMIN"))) { %>
					<button type="button" onclick="location.href='<%=request.getContextPath()%>/board/update?boardNo=<%=board.getNo()%>'">수정</button>
					<button type="button" id="btnDelete">삭제</button>
				<% } %>
					<button type="button" onclick="location.href='<%= request.getContextPath() %>/board/list'">목록으로</button>
				</th>
			</tr>
		</table>
		
    </div>
</section> 
<script>
	$(document).ready(()=>{
		$("#btnDelete").on("click",(e)=>{
			if(confirm("정말로 게시글을 삭제하시겠습니까?")){
				location.replace("<%=request.getContextPath()%>/board/delete?boardNo=<%=board.getNo()%>")
			}
		});
		
		$("#replyContent").on("focus",(e)=>{
			if(<%= loginMember == null %> ){
				alert("로그인 후 이용해 주세요");
				$("#userId").focus();
				}
		});
		
	});
</script>
<%@ include file="/views/common/footer.jsp" %>


