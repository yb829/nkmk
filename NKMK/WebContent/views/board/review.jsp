<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>    
<%@ include file="/views/common/header.jsp"%>
<!DOCTYPE html>

<head>
<meta charset="UTF-8">
<Meta Http-Equiv="Content-Type" Content="text/html; charset=utf-8">
 <script type="text/javascript" src="../resources/js/jquery-3.6.0.min.js"></script>

<style>
table#reviewTable{
	margin:auto;
	width:800px;
	height:1000px;
	border:1px solid black;
	border-collapse:separate;
	border-spacing:30px 30px;
	empty-cells:hide;
	table-layout:fixed;
	word-break:break-all;
	padding:inherit;
}
#review_select_box{	
	padding:20px;
	width:auto;
	background-color:#FFC325;
	}
table td{
	width:150px;
	border:1px solid black;
	text-align:center;
}
.wrap {
		overflow:scroll;
		}		
/** 리뷰창 내 스크롤바 안보이게 하는 기능**/
div::-webkit-scrollbar { 
    display: none !important; 
}
	
img#review{
	width:300px;
	height:200px;
	object-fit:cover;
	object-position:top;
	}
	
#reviewSubject{
	font-size:130%;
	font-weight:bold;
	color:#B5811F;
	line-height:3;
	}
#reviewContent{
	background-color:white;
	font-size:100%;
	line-height:2;
	text-align:left;
	margin:30px;
	padding:10;
	}
#ProductDetail{
	font-size:90%;
	font-weight:bold;
	line-height:3;	
	}
#reviewwrite{
  margin: 0;
  padding: 0.5rem 1rem;
  font-size: 1rem;
  font-weight: 400;
  text-align: center;
  text-decoration: none;
  display: inline-block;
  width: auto;
  border: none;
  border-radius: 4px;
  box-shadow: 0 4px 6px -1px rgba(0, 0, 0, 0.1), 0 2px 4px -1px rgba(0, 0, 0, 0.06);
  cursor: pointer;
  transition: 0.5s;
  position:relative;
  left:10%;
}

</style>
</head>


<body>
<section id="content" align="center">
	<div id="eventpage_img">
	<img src="<%= request.getContextPath() %>/resources/images/eventpagemain.jpg">
	</div>
	<div id="review_search">
	<div id="review_select_box">
	
	<select name="mainCategory" style="width:150px">
        <option value="">반려동물 선택</option>
    </select>
    
    <select name="subCategory" style="width:150px">
        <option value="">물품 선택</option>
    </select>
	
	<script type="text/javascript">
	$(document).ready(function() {	    
	    //Main 카테고리를 선택 할때 마다 AJAX를 호출할 수 있지만 DB접속을 매번 해야 하기 때문에 main, sub카테고리 전체을 들고온다.	    
	    //****************이부분은 DB로 셋팅하세요.
	    //Main 카테고리 셋팅 (DB에서 값을 가져와 셋팅 하세요.)
	    var mainCategoryArray = new Array();
	    var mainCategoryObject = new Object();
	    
	    mainCategoryObject = new Object();
	    mainCategoryObject.main_category_id = "1";
	    mainCategoryObject.main_category_name = "강아지";
	    mainCategoryArray.push(mainCategoryObject);
	    
	    mainCategoryObject = new Object();
	    mainCategoryObject.main_category_id = "2";
	    mainCategoryObject.main_category_name = "고양이";
	    mainCategoryArray.push(mainCategoryObject);
	    
	    mainCategoryObject = new Object();
	    mainCategoryObject.main_category_id = "3";
	    mainCategoryObject.main_category_name = "공용용품";
	    mainCategoryArray.push(mainCategoryObject);
	    
	    //Sub 카테고리 셋팅 (DB에서 값을 가져와 셋팅 하세요.)
	    var subCategoryArray = new Array();
	    var subCategoryObject = new Object();
	    
	    //강아지에 해당하는 sub category 리스트
	    subCategoryObject = new Object();
	    subCategoryObject.main_category_id = "1";
	    subCategoryObject.sub_category_id = "1"
	    subCategoryObject.sub_category_name = "사료"    
	    subCategoryArray.push(subCategoryObject);
	    
	    subCategoryObject = new Object();
	    subCategoryObject.main_category_id = "1";
	    subCategoryObject.sub_category_id = "2"
	    subCategoryObject.sub_category_name = "간식"    
	    subCategoryArray.push(subCategoryObject);
	    
	    subCategoryObject = new Object();
	    subCategoryObject.main_category_id = "1";
	    subCategoryObject.sub_category_id = "3"
	    subCategoryObject.sub_category_name = "건강관리"    
	    subCategoryArray.push(subCategoryObject);
	    
	    subCategoryObject = new Object();
	    subCategoryObject.main_category_id = "1";
	    subCategoryObject.sub_category_id = "4"
	    subCategoryObject.sub_category_name = "장난감/훈련"    
	    subCategoryArray.push(subCategoryObject);
	    
	    subCategoryObject = new Object();
	    subCategoryObject.main_category_id = "1";
	    subCategoryObject.sub_category_id = "5"
	    subCategoryObject.sub_category_name = "배변용품"    
	    subCategoryArray.push(subCategoryObject);
	    
	    subCategoryObject = new Object();
	    subCategoryObject.main_category_id = "1";
	    subCategoryObject.sub_category_id = "6"
	    subCategoryObject.sub_category_name = "미용/목욕"    
	    subCategoryArray.push(subCategoryObject);
	    
	    //고양이에 해당하는 sub category 리스트
	    subCategoryObject = new Object();
	    subCategoryObject.main_category_id = "2";
	    subCategoryObject.sub_category_id = "1"
	    subCategoryObject.sub_category_name = "사료"    
	    subCategoryArray.push(subCategoryObject);
	    
	    subCategoryObject = new Object();
	    subCategoryObject.main_category_id = "2";
	    subCategoryObject.sub_category_id = "2"
	    subCategoryObject.sub_category_name = "간식"    
	    subCategoryArray.push(subCategoryObject);
	    
	    subCategoryObject = new Object();
	    subCategoryObject.main_category_id = "2";
	    subCategoryObject.sub_category_id = "3"
	    subCategoryObject.sub_category_name = "건강관리"    
	    subCategoryArray.push(subCategoryObject);
	    
	    subCategoryObject = new Object();
	    subCategoryObject.main_category_id = "2";
	    subCategoryObject.sub_category_id = "4"
	    subCategoryObject.sub_category_name = "배변용품"    
	    subCategoryArray.push(subCategoryObject);
	    
	    subCategoryObject = new Object();
	    subCategoryObject.main_category_id = "2";
	    subCategoryObject.sub_category_id = "5"
	    subCategoryObject.sub_category_name = "장난감/스크래쳐"    
	    subCategoryArray.push(subCategoryObject);
	    
	    subCategoryObject = new Object();
	    subCategoryObject.main_category_id = "2";
	    subCategoryObject.sub_category_id = "6"
	    subCategoryObject.sub_category_name = "캣타워"    
	    subCategoryArray.push(subCategoryObject);
	    
	    subCategoryObject = new Object();
	    subCategoryObject.main_category_id = "2";
	    subCategoryObject.sub_category_id = "7"
	    subCategoryObject.sub_category_name = "미용/목욕"    
	    subCategoryArray.push(subCategoryObject);
	    
	    //공용용품에 해당하는 sub category 리스트
	    subCategoryObject = new Object();
	    subCategoryObject.main_category_id = "3";
	    subCategoryObject.sub_category_id = "1"
	    subCategoryObject.sub_category_name = "줄/인식표"    
	    subCategoryArray.push(subCategoryObject);
	    
	    subCategoryObject = new Object();
	    subCategoryObject.main_category_id = "3";
	    subCategoryObject.sub_category_id = "2"
	    subCategoryObject.sub_category_name = "하우스/실내용품"    
	    subCategoryArray.push(subCategoryObject);
	    
	    subCategoryObject = new Object();
	    subCategoryObject.main_category_id = "3";
	    subCategoryObject.sub_category_id = "3"
	    subCategoryObject.sub_category_name = "이동장/캐리어"    
	    subCategoryArray.push(subCategoryObject);
	    
	    subCategoryObject = new Object();
	    subCategoryObject.main_category_id = "3";
	    subCategoryObject.sub_category_id = "4"
	    subCategoryObject.sub_category_name = "식기/급수기"    
	    subCategoryArray.push(subCategoryObject);
	    
	    subCategoryObject = new Object();
	    subCategoryObject.main_category_id = "3";
	    subCategoryObject.sub_category_id = "5"
	    subCategoryObject.sub_category_name = "패션용품"    
	    subCategoryArray.push(subCategoryObject);
	    
	    //****************이부분은 DB로 셋팅하세요.
	    
	    
	    //메인 카테고리 셋팅
	    var mainCategorySelectBox = $("select[name='mainCategory']");
	    
	    for(var i=0;i<mainCategoryArray.length;i++){
	        mainCategorySelectBox.append("<option value='"+mainCategoryArray[i].main_category_id+"'>"+mainCategoryArray[i].main_category_name+"</option>");
	    }
	    
	    //*********** 1depth카테고리 선택 후 2depth 생성 START ***********
	    $(document).on("change","select[name='mainCategory']",function(){
	        
	        //두번째 셀렉트 박스를 삭제 시킨다.
	        var subCategorySelectBox = $("select[name='subCategory']");
	        subCategorySelectBox.children().remove(); //기존 리스트 삭제
	        
	        //선택한 첫번째 박스의 값을 가져와 일치하는 값을 두번째 셀렉트 박스에 넣는다.
	        $("option:selected", this).each(function(){
	            var selectValue = $(this).val(); //main category 에서 선택한 값
	            subCategorySelectBox.append("<option value=''>전체</option>");
	            for(var i=0;i<subCategoryArray.length;i++){
	                if(selectValue == subCategoryArray[i].main_category_id){	                    
	                    subCategorySelectBox.append("<option value='"+subCategoryArray[i].sub_category_id+"'>"+subCategoryArray[i].sub_category_name+"</option>");	                    
	                }
	            }
	        });        
	    });
	    //*********** 1depth카테고리 선택 후 2depth 생성 END ***********	        
	});
	
	</script>
	<input type="text" name="reviewsearch" placeholder="검색하실 제품명"/>
	<button>검색</button>
	<button id="reviewwrite" style="background-color: #8ac4d0;
	border: none;
	color: white;
	padding: 8px 16px;
	text-align: center;
	text-decoration: none;
	display: inline-block;
	font-size: 15px;
	margin: 4px 2px;
	cursor: pointer;">리뷰 작성하기</button>
	
	</div>
	
	<div id="reviewContents">
		<table id="reviewTable">
			<tr>
				<td>
				<div id="review">
				<img id="review" src="<%= request.getContextPath() %>/resources/images/productimage_sample.png">
				</div>
				<div id="reviewDetail"> 
					<div class="wrap column3" id="ProductDetail">
					냥꿀멍꿀 핵맛있는 강아지사료 10kg
					</div>
					<div class="wrap column1" id="reviewSubject">
					우리 봄이가 좋아해요
					</div>
					<div class="wrap column2" id="reviewContent">
					 우리 봄이가 이걸 너무너무 잘 먹어요
					하루에 4개씩 뽀시고 덩달아 같이 키우는 개 코코까지 먹게되고 거기다 길냥이들도 이걸 좋아라해서 너도나도 챙겨주다보니 엄청나게 빨리빨리 소진이 되어버리는 중이네요
					</div>
				</div>
				</td>
				<td><div id="review">
				<img id="review" src="<%= request.getContextPath() %>/resources/images/productimage_sample.png">
				</div>
				<div id="reviewDetail"> 
					<div class="wrap column3" id="ProductDetail">
					냥꿀멍꿀 핵맛있는 강아지사료 10kg
					</div>
					<div class="wrap column1" id="reviewSubject">
					우리 여름이가 좋아해요
					</div>
					<div class="wrap column2" id="reviewContent">
					 우리 여름이가 이걸 너무너무 잘 먹어요
					하루에 4개씩 뽀시고 덩달아 같이 키우는 개 코코까지 먹게되고 거기다 길냥이들도 이걸 좋아라해서 너도나도 챙겨주다보니 엄청나게 빨리빨리 소진이 되어버리는 중이네요
					</div>
				</div></td>
			</tr>
			<tr>
				<td><div id="review">
				<img id="review" src="<%= request.getContextPath() %>/resources/images/productimage_sample.png">
				</div>
				<div id="reviewDetail"> 
					<div class="wrap column3" id="ProductDetail">
					냥꿀멍꿀 핵맛있는 고양이사료 10kg
					</div>
					<div class="wrap column1" id="reviewSubject">
					우리 가을이가 좋아해요
					</div>
					<div class="wrap column2" id="reviewContent">
					 우리 가을이가 이걸 너무너무 잘 먹어요
					하루에 4개씩 뽀시고 덩달아 같이 키우는 개 코코까지 먹게되고 거기다 길냥이들도 이걸 좋아라해서 너도나도 챙겨주다보니 엄청나게 빨리빨리 소진이 되어버리는 중이네요
					</div>
				</div></td>
				<td><div id="review">
				<img id="review" src="<%= request.getContextPath() %>/resources/images/productimage_sample.png">
				</div>
				<div id="reviewDetail"> 
					<div class="wrap column3" id="ProductDetail">
					냥꿀멍꿀 핵맛있는 고양이 간식 10kg
					</div>
					<div class="wrap column1" id="reviewSubject">
					우리 겨울이가 좋아해요
					</div>
					<div class="wrap column2" id="reviewContent">
					 우리 겨울이가 이걸 너무너무 잘 먹어요
					하루에 4개씩 뽀시고 덩달아 같이 키우는 개 코코까지 먹게되고 거기다 길냥이들도 이걸 좋아라해서 너도나도 챙겨주다보니 엄청나게 빨리빨리 소진이 되어버리는 중이네요
					</div>
				</div></td>
			</tr>
		</table>

	</div>
	
	</div>
	<span class="btn_scroll_top"><a href="#TOP"><img src="<%=request.getContextPath()%>/resources/images/up_icon.png" style="width: 30px; height: 30px;"></a></span>
	
</section>
</body>

<%@ include file="/views/common/footer.jsp" %>