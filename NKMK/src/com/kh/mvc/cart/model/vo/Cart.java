package com.kh.mvc.cart.model.vo;

import java.util.Date;
import java.util.List;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
@Data
@NoArgsConstructor
@AllArgsConstructor
public class Cart {
	
	private int cartNo;
	
	private int rowNum;
	
	private int productNo;
	
	private String productName;
	
	private int cartCount;
	
	private int priceSum;
	
	private String fileName;
	
	private Date buyDate;
	
	private String regularDeliveryAttr;
	
	private String status;
	
}
