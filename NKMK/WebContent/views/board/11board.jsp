<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/views/common/header.jsp"%>

<link rel="stylesheet"
	href="http://code.jquery.com/ui/1.8.18/themes/base/jquery-ui.css"
	type="text/css">

<script
	src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"></script>

<script src="http://code.jquery.com/ui/1.8.18/jquery-ui.min.js"></script>

<head>
<style>
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

#board-sidebar ul li {
	list-style-type: none;
}
</style>
</head>
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
			<div class="content">
				<div class="board_zone_tit">
					<h2>1:1문의</h2>
					<div class="btn_right_box">
						<button type="button" class="btn_write" onclick="" 
							style="background-color: #8ac4d0; border: none; color: white; padding: 8px 16px; text-align: center; text-decoration: none; display: inline-block; font-size: 15px; margin: 4px 2px; cursor: pointer;">
							<strong>문의하기</strong>
						</button>
					<div class="board_zone_list">
						<div class="date_check_box">
							<form name="frmSearch" method="get" action="list.php">
								<input type="hidden" name="bdId" value="qa" /> <input
									type="hidden" name="memNo" value="10370" /> <input
									type="hidden" name="noheader" value="y" />

								<script type="text/javascript">
									$(function() {
										$("#date1").datepicker({
											changeMonth : true,
											changeYear : true,
											nextText : '다음 달',
											prevText : '이전 달',
											showButtonPanel : true,
											currnetText : '오늘 날짜',
											closeText : '닫기',
											dateFormat : "yymmdd"
										});
									});
								</script>

								<script type="text/javascript">
									$(function() {
										$("#date2").datepicker({
											changeMonth : true,
											changeYear : true,
											nextText : '다음 달',
											prevText : '이전 달',
											showButtonPanel : true,
											currnetText : '오늘 날짜',
											closeText : '닫기',
											dateFormat : "yymmdd"
										});
									});
								</script>
								<h3>조회기간</h3>
								<div class="date_check_list" data-target-name="rangDate[]">
									<button type="button" data-value="0">오늘</button>
									<button type="button" data-value="7">7일</button>
									<button type="button" data-value="15">15일</button>
									<button type="button" data-value="30">1개월</button>
									<button type="button" data-value="90">3개월</button>
									<button type="button" data-value="365">1년</button>
								   
									<input type="text" name="rangDate[]" id="date1" size="12" /> ~
									<input type="text" name="rangDate[]" id="date2" size="12" />

									<button type="submit" class="btn_date_check">
										<em>조회</em>
									</button>
								</div>
							</form>
						</div>
	<br><br>
						<div class="board_list_qa" align="center">
							<table class="board_list_table" style="width: 100%" border=1px;>
								<colgroup>
									<col style="width: 10%">
									<!-- 문의날짜 -->
									<col style="width: 15%">
									<!-- 카테고리 -->
									<col>
									<!-- 제목 -->
									<col style="width: 10%">
									<!-- 문의상태 -->
								</colgroup>
								<thead>
									<tr style="background-color:#fbeeac">
										<th>문의날짜</th>
										<th>카테고리</th>
										<th>제목</th>
										<th>문의상태</th>
									</tr>
								</thead>
								<tbody style="text-align:center;">
									<tr>
										<td>2021-03-02</td>
										<td>주문/배송</td>
										<td>문의합니다</td>
										<td>답변완료</td>
									</tr>

								</tbody>
							</table>

						</div>
						<!-- //board_list_qa -->
					</div>
					<!-- //board_zone_list -->

					
					</div>
				</div>
			</div>
			<!-- //content -->
			<!-- 절대! 지우지마세요 : Start -->
			<iframe name="ifrmProcess" src='/blank.php' style="display: none"
				width="900" height="500"></iframe>
			<!-- 절대! 지우지마세요 : End -->
		</section>
	</div>
</section>

<%@ include file="/views/common/footer.jsp"%>