package com.kh.mvc.product.model.service;

import java.sql.Connection;
import java.util.List;

import com.kh.mvc.common.util.Category;
import com.kh.mvc.common.util.PageInfo;
import com.kh.mvc.product.model.dao.ProductDAO;
import com.kh.mvc.product.model.vo.Product;

import static com.kh.mvc.common.jdbc.JDBCTemplate.*;

public class ProductService {
	
	private ProductDAO dao = new ProductDAO();
	
	public int save(Product product) {
		int result = 0;
		Connection connection = getConnection();
		
		if(product.getProductNo() != 0) {
			result = dao.updateProduct(connection, product);
		} else {
			result = dao.insertProduct(connection, product);
		}
		
		if(result > 0) {
			commit(connection);
		} else {
			rollback(connection);
		}
		
		close(connection);
		
		return result;
	}

	public int getProductCount() {
		Connection connection = getConnection();
		int count = dao.getProductCount(connection);
		
		close(connection);
		
		return count;
	}

	public List<Product> getProductList(PageInfo pageInfo, Category category) {
		Connection connection = getConnection();
		List<Product> list = dao.findAll(connection, pageInfo, category);
		
		close(connection);
		
		return list;
	}
	
	public List<Product> getProductList(PageInfo pageInfo) {
		Connection connection = getConnection();
		List<Product> list = dao.findAll(connection, pageInfo);
		
		close(connection);
		
		return list;
	}
	
	public Product findProductByNo(String productCatNo, boolean b) {
		Product product = null;
		Connection connection = getConnection();

		product = dao.findProductByNo(connection, productCatNo);

		// 상품 조회수 증가 시키는 로직 필요없음 그렇지만 일단 복붙해놓겠습니당
		/*
		 * if(board != null && !hasRead) { int result = dao.updateReadCount(connection,
		 * board);
		 * 
		 * if(result > 0) { commit(connection); } else { rollback(connection); } }
		 */
		close(connection);

		return product;
	}

	public int delete(int productNo) {
		int result = 0;
		Connection connection = getConnection();
		
		result = dao.updateStatus(connection, productNo, "N");
		
		if(result > 0) {
			commit(connection);
		} else {
			rollback(connection);
		}
		
		close(connection);
		
		return result;
	}
}
