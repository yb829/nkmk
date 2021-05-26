<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/views/common/header.jsp"%>
<script src="../resources/js/jquery-3.6.0.min.js"></script>

 
<head>
<style>


.board_list_event.ul {
    width: 80%;
    font-size: 5;
    margin:10px;
}

board_hot_list.ul {
    display: block;
    list-style-type: disc;
    margin-block-start: 1em;
    margin-block-end: 1em;
    margin-inline-start: 0px;
    margin-inline-end: 0px;
    padding-inline-start: 40px;
}
.area {
  margin: 0;
  padding: 0;
  display: -webkit-box;
  display: -moz-box;
  display: -ms-flexbox;
  display: -moz-flex;
  display: -webkit-flex;
  display: flex;
  justify-content: space-between;
  list-style: none;
}

.area:before {
  display: inline-block;
  width: 1px;
  content: '';
}

.area:after {
  display: inline-block;
  width: 1px;
  content: '';
}

.item {
  display: inline-block;
  color: #fff;
  text-align: center;
  line-height: 30px;
}

table td{
	width:400px;
	height:200px;
	text-align:center;
}


img#event{
	width:450px;
	height:200px;
	object-fit:cover;
	object-position:top;
	}
	
	
</style>
</head>

<body>
<section id="content">
<h2>이벤트</h2>
<div class="event_zone_list">
	<div class="board_list_event">
				<div class="board_hot_list">
					<ul style="width:80%; height:30px" class="area">	
							<!-- "" 기능안해요 참고용으로 남겨둡니다... -->						
							<li class="item"><a href=""><span><strong>진행중(3)</strong></span></a></li>
							<li class="item"><a href=""><span>종료(3)</span></a></li>
							<li class="item"><a href=""><span>전체(6)</span></a></li>
						</ul>
					</div>
				
	<table id="eventlist">
		<tr>
			<td><img id="event" src="<%= request.getContextPath()%>/resources/images/eventsupporterssmall.png" style="border:0;cursor:pointer" onclick="javascript:window.open('event_supporters','new','left=50, top=50, width=800, height=600')">클릭시 참여페이지로 이동합니다</td>
			<td><img id="event" src="<%= request.getContextPath()%>/resources/images/reviewevent1.png" style="border:0;cursor:pointer" onclick="javascript:window.open('/NKMK/board/review','new','left=50, top=50, width=800, height=600')">클릭시 참여페이지로 이동합니다</td>
		</tr>
		
		<tr>
			<td><img id="event" src="<%= request.getContextPath()%>/resources/images/reviewevent3.png" style="border:0;cursor:pointer" onclick="javascript:window.open('/NKMK/member/enroll1','new','left=50, top=50, width=800, height=600')">클릭시 참여페이지로 이동합니다</td>
			<td><img id="event" src="<%= request.getContextPath()%>/resources/images/reviewevent2.png" style="border:0;cursor:pointer" onclick="javascript:window.open('<%= request.getContextPath()%>/resources/images/eventpagedetail.png','new','left=50, top=50')">클릭시 참여페이지로 이동합니다</td>
		</tr>
		
		<tr>
			<td><img id="event" src="<%= request.getContextPath()%>/resources/images/reviewevnet.png" style="border:0;cursor:pointer" onclick="javascript:window.open('<%= request.getContextPath()%>/resources/images/eventpagedetail.png','new','left=50, top=50')">클릭시 참여페이지로 이동합니다</td>
			<td><img id="event" src="<%= request.getContextPath()%>/resources/images/reviewevnet.png" style="border:0;cursor:pointer" onclick="javascript:window.open('<%= request.getContextPath()%>/resources/images/eventpagedetail.png','new','left=50, top=50')">클릭시 참여페이지로 이동합니다</td>
		</tr>
		
		</table>
			<span class="btn_scroll_top"><a href="#TOP"><img src="<%=request.getContextPath()%>/resources/images/up_icon.png" style="width: 30px; height: 30px;"></a></span>
				</div>
 		</div>


</section>	

</body>

<%@ include file="/views/common/footer.jsp"%>