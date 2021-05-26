<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/views/common/header.jsp"%>


<link rel="stylesheet" href="<%= request.getContextPath() %>/resources/css/cart2.css" >






<h2>장바구니</h2>
				
	<h4 align= "right">01 장바구니 > 02 주문서 작성 결제> 03 주문완료 </h4>
				
	<table border ="1" width="70%" bgcolor=white bordercolor="gray" cellspacing="5" margin=20px;>
								
		<tr>
		<th ><a href="<%=request.getContextPath()%>/cart/cart1">일반주문</a></th>
		<th ><a href="<%=request.getContextPath()%>/cart/cart2">정기배송</a></th>
										
		</tr>
		</table>
		
		<h4 align="left" bgcolor="white">일반구매상품</h4>
		



<form name="orderform" id="orderform" method="post" class="orderform" action="/Order" onsubmit="return false;">

    <div class="basket" id="basket"></div>

        <!-- "장바구니 헤더" -->

        <div class="rowhead">

        <div class="check">선택</div>
        <div class="img">이미지</div>
        <div class="pname">상품명</div>
        <div class="basketprice">가격</div>
        <div class="num">수량</div>
        <div class="sum">합계</div>

        </div>

        <!-- "장바구니 상품 목록" -->

        <div class="rowdata">

            <div class="check"><input type="checkbox" name="buy" value="260" checked="">&nbsp;</div>
            
            <div class="img"><img src="<%=request.getContextPath()%>/resources/images/chew.PNG" width="60"></div>

            <div class="pname">

                <span>개껌(XJ-92214/3)</span>

            </div>

            <div class="basketprice"><input type="hidden" name="p_price" id="p_price1" class="p_price" value="20000">20,000원</div>

            <div class="num">
           <input id="target" type="name" />
           <script>
           var t = document.getElementById('target');
           t.addEventListener('change', function(event){
           document.getElementById('result').innerHTML=event.target.value;
           });
           </script>           
           </div>
        
        <div class="sum" id="test"></div>
         <script>
           var t = document.getElementById('test');
           t.addEventListener('change', function(event){
           document.getElementById('result').innerHTML=event.target.value;
           });
          </script>

      </div>   
    
    <!-- "장바구니 전체 합계 정보" -->

	<section>
	<div id="cart-container">
	<div id="cart-sidebar">
    <div class="bigtext right-align sumcount" id="sum_p_num">상품갯수:<p id="result"></p></div>
    <h5> 30,000원 이상 구매 시 무료배송</h5>
    <div class="bigtext right-align delivery">배송비:3,000원</div>
	<hr/>
	 <div class="bigtext right-align box blue summoney" id="sum_p_price">합계금액: <p id="test"></p></div>
   </div>
   </div>
   </section>
    
    <div class="right-align basketrowcmd">
    
     <div align="left" ><a href="#" class="abutton">선택상품삭제</a><a href="#" class="abutton">장바구니비우기</a></div>
     
    </div>
    
    
     <div id="goorder" class="">

    <div class="clear"></div>

    <div class="buttongroup center-align cmd"><a href="href=<%=request.getContextPath()%>/member/login">선택한 상품 주문</a></div>

    </div>

</form>

 

<script>
//이벤트 리스너 등록

document.addEventListener('DOMContentLoaded', function(){

  // "선택 상품 삭제" 버튼 클릭

  document.querySelector('.basketrowcmd a:first-child').addEventListener('click', function(){

   basket.delCheckedItem();

  });

  // "장바구니 비우기" 버튼 클릭

  document.querySelector('.basketrowcmd a:nth-child(2)').addEventListener('click', function(){

      basket.delAllItem();

  });
  
  

  

  // 수량변경 - 이벤트 델리게이션으로 이벤트 종류 구분해 처리
  
  //function calculateOrderPrice(){
	 // var tbody
     //}
  
  
  
  
    
  
  
  
  
  

  document.querySelectorAll('.bigtext right-align sumcount').forEach(

      function(item, idx){

          //수량 입력 필드 값 변경

          item.querySelector('input').addEventListener('keyup', function(){

           basket.changePNum(idx+1);

          });



      }

  );

  
  
  //앵커 # 대체해 스크롤 탑 차단

  document.querySelectorAll('a[href="#"]').forEach(function(item){

      item.setAttribute('href','javascript:void(0)');

  });

});


let basket = {

    totalCount: 0, //전체 갯수 변수

    totalPrice: 0, //전체 합계액 변수

    //체크한 장바구니 상품 비우기

    delCheckedItem: function(){

        document.querySelectorAll("input[name=buy]:checked").forEach(function (item) {

            item.parentElement.parentElement.parentElement.remove();

        });

        //AJAX 서버 업데이트 전송

    

        //전송 처리 결과가 성공이면

        this.reCalc();

        this.updateUI();

    },

    //장바구니 전체 비우기

    delAllItem: function(){

        document.querySelectorAll('.rowdata').forEach(function (item) {

            item.remove();

          });

          //AJAX 서버 업데이트 전송

        

          //전송 처리 결과가 성공이면

          this.totalCount = 0;

          this.totalPrice = 0;

          this.reCalc();

          this.updateUI();

    },

    //재계산

    reCalc: function(){

        this.totalCount = 0;

        this.totalPrice = 0;

        document.querySelectorAll(".p_num").forEach(function (item) {

            var count = parseInt(item.getAttribute('value'));9999

            this.totalCount += count;

            var price = item.parentElement.parentElement.previousElementSibling.firstElementChild.getAttribute('value');

            this.totalPrice += count * price;

        }, this); // forEach 2번째 파라메터로 객체를 넘겨서 this 가 객체리터럴을 가리키도록 함. - thisArg

    },

    //화면 업데이트

    updateUI: function () {

        document.querySelector('#sum_p_num').textContent = '상품갯수: ' + this.totalCount.formatNumber() + '개';

        document.querySelector('#sum_p_price').textContent = '합계금액: ' + this.totalPrice.formatNumber() + '원';

    },

    //개별 수량 변경

    changePNum: function (pos) {

        var item = document.querySelector('input[name=p_num'+pos+']');

        var p_num = parseInt(item.getAttribute('value'));

        var newval = event.target.classList.contains('up') ? p_num+1 : event.target.classList.contains('down') ? 

p_num-1 : event.target.value;

        

        if (parseInt(newval) < 1 || parseInt(newval) > 99) { return false; }



        item.setAttribute('value', newval);

        item.value = newval;



        var price = item.parentElement.parentElement.previousElementSibling.firstElementChild.getAttribute('value');

        item.parentElement.parentElement.nextElementSibling.textContent = (newval * price).formatNumber()+"원";

        //AJAX 업데이트 전송



        //전송 처리 결과가 성공이면    

        this.reCalc();

        this.updateUI();

    },

    //상품 삭제

    delItem: function () {

        event.target.parentElement.parentElement.parentElement.remove();

    }

}



</script>

<script>

function updateAll(){
	varn1=document.getElementById("").value;
}


</script>


<%@ include file="/views/common/footer.jsp"%>