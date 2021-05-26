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
    div#comment-container button#btn-insert{width:60px;height:50px; color:white; background-color:#3300FF;position:relative;top:-20px;}
    
    /*댓글테이블*/
    table#tbl-comment{width:580px; margin:0 auto; border-collapse:collapse; clear:both; } 
    table#tbl-comment tr td{border-bottom:1px solid; border-top:1px solid; padding:5px; text-align:left; line-height:120%;}
    table#tbl-comment tr td:first-of-type{padding: 5px 5px 5px 50px;}
    table#tbl-comment tr td:last-of-type {text-align:right; width: 100px;}
    table#tbl-comment button.btn-delete{display:none;}
    table#tbl-comment tr:hover {background:lightgray;}
    table#tbl-comment tr:hover button.btn-delete{display:inline;}
    table#tbl-comment sub.comment-writer {color:navy; font-size:14px}
    table#tbl-comment sub.comment-date {color:tomato; font-size:10px}
</style>
<section id="content">   
	<div id="board-write-container">
		<h2>게시판</h2>
		<table id="tbl-board">
			<tr>
				<th>글번호</th>
				<td><%= board.getNo() %></td>
			</tr>
			<tr>
				<th>제 목</th>
				<td><%= board.getTitle() %></td>
			</tr>
			<tr>
				<th>작성자</th>
				<td><%= board.getWriterId() %></td>
			</tr>
			<tr>
				<th>조회수</th>
				<td><%= board.getReadCount() %></td>
			</tr>
			<tr>
				<th>첨부파일</th>
				<td>
				<% if(board.getOriginalFileName() != null) { %>
					<a href="javascript:fileDownload('<%= board.getOriginalFileName() %>', '<%= board.getRenamedFileName() %>')">
						<img src="<%= request.getContextPath() %>/resources/images/file.png" width="20" height="20"/>
						<%= board.getOriginalFileName() %>
					</a>
					<script>
						function fileDownload(oriname, rename) {
							const url = "<%= request.getContextPath() %>/board/fileDown";
							
							// 아스키문자(a~z, A~Z, 1~9, . - _  ...) 그대로 전달하고 기타 문자만 %XX와 같이 변환된다.
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
				<th>내 용</th>
				<td><%= board.getContent() %></td>
			</tr>
			<%--글작성자/관리자인경우 수정삭제 가능 --%>
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
		<div id="comment-container">
	    	<div class="comment-editor">
	    		<form action="<%= request.getContextPath() %>/board/reply" method="POST">
	    			<input type="hidden" name="boardNo" value="<%= board.getNo() %>">
	    			<input type="hidden" name="writer" value="<%= loginMember!=null ? loginMember.getId() : "" %>">
	    			<%-- 댓글 누가 썼는지 굳이 알려줄 필요는 없지만 서버에 전송될 필요는 있으니까 input hidden type --%>
	    			<%-- 로그인이 되어있다면 로그인멤버 아이디 넣어주고 안되어있다면 빈문자열 넣어라 (널포인트익셉션 방지) --%>
					<textarea name="content" id="replyContent" cols="55" rows="3"></textarea>
					<button type="submit" id="btn-insert">등록</button>	    			
	    		</form>
	    	</div>
	    </div>
	    <table id="tbl-comment">
	    <% for(Reply reply : board.getReplies()) { %>
    	   	<tr class="level1">
	    		<td>
	    			<sub class="comment-writer"><%= reply.getWriterId() %></sub>
	    			<sub class="comment-date"><%= reply.getCreateDate() %></sub>
	    			<br>
	    			<%= reply.getContent() %>
	    		</td>
	    		<td>
	    		<% if(loginMember!=null && loginMember.getId().equals(reply.getWriterId())) { %>
    				<button class="btn-delete">삭제</button>
	    		<% } %>
	    		</td>
	    	</tr>
	    <% } %>
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
		
		// $("#replyContent").focus(()=>{
		//	}); 비표준 방식
		
		$("#replyContent").on("focus",(e)=>{
			if(<%= loginMember == null %> ){
				alert("로그인 후 이용해 주세요");
				$("#userId").focus();
				}
		});
		
	});
</script>
<%@ include file="/views/common/footer.jsp" %>


