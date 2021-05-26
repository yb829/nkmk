package com.kh.mvc.cart.model.service;

import java.sql.Connection;
import java.util.ArrayList;
import java.util.List;

import com.kh.mvc.cart.model.dao.CartDAO;
import com.kh.mvc.cart.model.vo.Cart;
import com.kh.mvc.common.util.Category;
import com.kh.mvc.common.util.PageInfo;
import com.kh.mvc.product.model.dao.ProductDAO;
import com.kh.mvc.product.model.vo.Product;

import static com.kh.mvc.common.jdbc.JDBCTemplate.*;

public class CartService {
	
	private CartDAO dao = new CartDAO();
	
	public int update(int cartNo, int cartProdCount) {
		int result = 0;
		Connection connection = getConnection();
		
		result = dao.updateCart(connection, cartNo, cartProdCount);
		
		if(result > 0) {
			commit(connection);
			System.out.println("result값 : "+ result +", 쿼리문 실행 완료");
		} else {
			rollback(connection);
			System.out.println("result값 : "+ result +", 쿼리문 실행 실패");
		}
		
		close(connection);
		
		return result;
	}
	
	public int insert(int productNo) {
		int result = 0;
		Connection connection = getConnection();
		
		result = dao.insertCart(connection, productNo);
		
		if(result > 0) {
			commit(connection);
			System.out.println("result값 : "+ result +", 쿼리문 실행 완료");
		} else {
			rollback(connection);
			System.out.println("result값 : "+ result +", 쿼리문 실행 실패");
		}
		
		close(connection);
		
		return result;
	}

	public int getCartCount() {
		Connection connection = getConnection();
		int count = dao.getCartCount(connection);
		
		close(connection);
		
		return count;
	}

//	public List<Product> getProductList(PageInfo pageInfo, Category category) {
//		Connection connection = getConnection();
//		List<Product> list = dao.findAll(connection, pageInfo, category);
//		
//		close(connection);
//		
//		return list;
//	}
	
	public List<Cart> getCartList(PageInfo pageInfo) {
		Connection connection = getConnection();
		List<Cart> list = dao.findAll(connection, pageInfo);
		
		close(connection);
		
		return list;
	}
	
	public Cart findCartByNo(int cartNo, boolean b) {
		Cart cart = null;
		Connection connection = getConnection();

		cart = dao.findCartByNo(connection, cartNo);

		// 상품 조회수 증가 시키는 로직 필요없음 그렇지만 일단 복붙해놓겠습니당
		/*
		 * if(board != null && !hasRead) { int result = dao.updateReadCount(connection,
		 * board);
		 * 
		 * if(result > 0) { commit(connection); } else { rollback(connection); } }
		 */
		close(connection);

		return cart;
	}

	//구매 완료 시 status = n;
	public int delete(int cartNo) {
		int result = 0;
		Connection connection = getConnection();
		
		result = dao.updateStatus(connection, cartNo, "N");
		
		if(result > 0) {
			commit(connection);
		} else {
			rollback(connection);
		}
		
		close(connection);
		
		return result;
	}
}
