package com.kh.mvc.product.model.vo;

import java.util.Date;
import java.util.List;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
@Data
@NoArgsConstructor
@AllArgsConstructor
public class Product {
	
	private int productNo;
	
	private int rowNum;
	
	private String productCatNo;
	
	private String productName;
	
	private int price;
	
	private int productAmount;
	
	private String originalFileName;
	
	private String renamedFileName;
	
	private String productContents;
	
	private Date productEnrollDate;
	
	private int productGrade;
	
	private String productStatus;
	
	private String regularDeliveryAttr;
	
}
