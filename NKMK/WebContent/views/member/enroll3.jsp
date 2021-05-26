<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ include file="/views/common/header.jsp"%>
 

  <section id="content" >
 <h1 align ="center">회원가입 완료 </h1> 
  <hr>


 <form name= "memberEnroll3"  action="<%=request.getContextPath()%>/member/enroll3" method ="get"></form>
 
 <table align="center">
<tr>

<td>
 <br> <!--닉네임 불러오기 기능 추가해야됨   -->
<!--
<input type = "hidden" name="userNick" id="userNick"  value="userNick"/>
-->  
  냥꿀멍꿀의 회원이 되신것을 <br>
  진심으로 환영합니다!<br>
</td>
</tr>
</table>
<br><Br>

<div align="center">
<input type = "button" value="홈으로" onclick="location.href='<%= request.getContextPath() %>/'">
<input type = "button" value="로그인" onclick="location.href='<%= request.getContextPath() %>/member/login'">
</div>





 
 </section>
 
 
 
 
 <br><br>
 <%@ include file="/views/common/footer.jsp"%>
    