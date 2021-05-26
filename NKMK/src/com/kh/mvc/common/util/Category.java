package com.kh.mvc.common.util;

public class Category {

	private String myCategory;
	
	private String selectFactor;
	/*
	 * @param myCategory 선택한 카테고리 
	 * 
	 * */
	public Category(String myCategory) {
		this.myCategory = myCategory;
	}
	
	public String getCategory() {
		// 넘겨 받은 파라미터의 값이 cat일 경우(카테고리가 고양이일 경우)
		if(this.myCategory.equals("cat")) {
			//쿼리문에 쓰일 인자값을 지정
			//(SELECT문의 WHERE절_P.PRODUCT_CAT_NO = 'C%') 
			selectFactor = "C%";
		} else if(this.myCategory.equals("dog")) {
		// 넘겨 받은 파라미터의 값이 dog일 경우(카테고리가 강아지일 경우)
			//쿼리문에 쓰일 인자값을 지정
			//(SELECT문의 WHERE절_P.PRODUCT_CAT_NO = 'D%')
			selectFactor = "D%";
		} else if(this.myCategory.equals("all")){
		// 넘겨 받은 파라미터의 값이 all일 경우(전체 카테고리일 경우)
			//쿼리문에 쓰일 인자값을 지정
			//(SELECT문의 WHERE절_P.PRODUCT_CAT_NO = '%')
			selectFactor = "%";
		} else if(this.myCategory.equals("dc")){
		// 넘겨 받은 파라미터의 값이 all일 경우(전체 카테고리일 경우)
			//쿼리문에 쓰일 인자값을 지정
			//(SELECT문의 WHERE절_P.PRODUCT_CAT_NO = '%')
			selectFactor = "_DC%";
		} else if(this.myCategory.equals("sold")){
		// 넘겨 받은 파라미터의 값이 all일 경우(전체 카테고리일 경우)
			//쿼리문에 쓰일 인자값을 지정
			//(SELECT문의 WHERE절_P.PRODUCT_CAT_NO = '%')
			selectFactor = "_SD%";
		} else {
			selectFactor = this.myCategory;
		}
		return selectFactor;
	}
	
	public String getMyCategory() {
		return myCategory;
	}

	public void setMyCategory(String myCategory) {
		this.myCategory = myCategory;
	}

	public String getSelectFactor() {
		return selectFactor;
	}

	public void setSelectFactor(String selectFactor) {
		this.selectFactor = selectFactor;
	}
	
	
}
