package com.kh.mvc.regular_delivery.model.service;

import java.sql.Connection;
import java.util.List;

import com.kh.mvc.common.util.Category;
import com.kh.mvc.common.util.PageInfo;
import com.kh.mvc.product.model.vo.Product;
import com.kh.mvc.regular_delivery.model.dao.RegularDeliveryDAO;

import static com.kh.mvc.common.jdbc.JDBCTemplate.*;
public class RegularDeliveryService {
	
	private RegularDeliveryDAO dao = new RegularDeliveryDAO();
	
	public int getProductCount() {
		Connection connection = getConnection();
		int result = dao.getProductCount(connection);
		
		close(connection);
		
		return result;
	}

	public List<Product> getProductList(PageInfo pageInfo, Category category) {
		Connection connection = getConnection();
		
		List<Product> list = dao.findAll(connection, pageInfo, category);
		
		close(connection);
		
		return list;
	}

}
