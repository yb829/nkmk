package com.kh.mvc.cart.model.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.kh.mvc.common.util.Category;
import com.kh.mvc.common.util.PageInfo;
import com.kh.mvc.cart.model.vo.Cart;
import com.kh.mvc.product.model.dao.ProductDAO;
import com.kh.mvc.product.model.vo.Product;

import static com.kh.mvc.common.jdbc.JDBCTemplate.*;

public class CartDAO {
	
	public int insertCart(Connection connection, int productNo) {
		
		int result = 0;
		PreparedStatement pstmt = null;
		String query = null;
		
		try {
			pstmt = connection.prepareStatement(
					"INSERT INTO CART(CART_NO, PRODUCT_NO, PRODUCT_NAME, PRICE_SUM, FILENAME, REGULAR_DELIVERY_ATTR) "
						+ "SELECT SEQ_CART_NO.nextval, PRODUCT_NO, PRODUCT_NAME, PRICE, RENAMED_FILENAME, REGULAR_DELIVERY_ATTR "
						+ "FROM PRODUCT WHERE PRODUCT_NO IN ("+ productNo +")"
					);
			System.out.println("파라미터 값 : "+productNo);
			result = pstmt.executeUpdate();
			System.out.println("쿼리문 실행 완료");
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
	}

	public int getCartCount(Connection connection) {
		int count = 0;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String query = null;
		
		try {
			query="SELECT COUNT(*) FROM CART WHERE STATUS='Y'";
			pstmt = connection.prepareStatement(query);
			
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				count = rs.getInt(1);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rs);
			close(pstmt);
		}
		
		return count;
	}
	
	public List<Cart> findAll(Connection connection, PageInfo pageInfo) {
		List<Cart> list = new ArrayList<>();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String query = null;
		
		try {
			query = "SELECT RNUM, CART_NO, PRODUCT_NO, PRODUCT_NAME, CART_COUNT, PRICE_SUM, FILENAME, REGULAR_DELIVERY_ATTR, STATUS "
					+ "FROM ( "
					+ "    SELECT ROWNUM AS RNUM, CART_NO, PRODUCT_NO, PRODUCT_NAME, CART_COUNT, PRICE_SUM, FILENAME, REGULAR_DELIVERY_ATTR, STATUS "
					+ "    FROM ( "
					+ "        SELECT  C.CART_NO, C.PRODUCT_NO, C.PRODUCT_NAME, C.CART_COUNT, C.PRICE_SUM, "
					+ "				C.FILENAME, C.REGULAR_DELIVERY_ATTR, C.STATUS FROM CART C "
					+ "        WHERE ( C.STATUS = 'Y') ORDER BY C.CART_NO DESC "
					+ "    ) "
					+ ") "
					+ "WHERE RNUM BETWEEN ? and ?";
			
			pstmt = connection.prepareStatement(query);
			
			// ? 값을 set하는 구문
			pstmt.setInt(1, pageInfo.getStartList());
			pstmt.setInt(2, pageInfo.getEndList());
			
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				//Product product = new Product();
				Cart cart = new Cart();
				
				// product 테이블의 컬럼들을 product 객체에 Mapping 하는 구문
				cart.setCartNo(rs.getInt("CART_NO"));
				cart.setRowNum(rs.getInt("RNUM"));
				cart.setProductNo(rs.getInt("PRODUCT_NO"));
				cart.setProductName(rs.getString("PRODUCT_NAME"));
				cart.setCartCount(rs.getInt("CART_COUNT"));
				cart.setPriceSum(rs.getInt("PRICE_SUM"));
				cart.setFileName(rs.getString("FILENAME"));
				cart.setRegularDeliveryAttr(rs.getString("REGULAR_DELIVERY_ATTR"));
				cart.setStatus(rs.getString("STATUS"));
				
				list.add(cart);
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rs);
			close(pstmt);
		}
		
		return list;
	}

//	public List<Product> findAll(Connection connection, PageInfo pageInfo, Category category) {
//		List<Product> list = new ArrayList<>();
//		PreparedStatement pstmt = null;
//		ResultSet rs = null;
//		String query = null;
//		
//		String myCategory = category.getCategory();
//		
//		try {
//			query = "SELECT RNUM, PRODUCT_NO, PRODUCT_CAT_NO, PRODUCT_NAME, PRICE, PRODUCT_AMOUNT, RENAMED_FILENAME, PRODUCT_STATUS, REGULAR_DELIVERY_ATTR "
//					+ "FROM ( "
//					+ "    SELECT ROWNUM AS RNUM, PRODUCT_NO, PRODUCT_CAT_NO, PRODUCT_NAME, PRICE, PRODUCT_AMOUNT, RENAMED_FILENAME, PRODUCT_STATUS , REGULAR_DELIVERY_ATTR "
//					+ "    FROM ( "
//					+ "        SELECT  P.PRODUCT_NO, P.PRODUCT_CAT_NO, P.PRODUCT_NAME, P.PRICE, P.PRODUCT_AMOUNT, "
//					+ "				P.RENAMED_FILENAME, P.PRODUCT_STATUS, P.REGULAR_DELIVERY_ATTR  FROM PRODUCT P "
//					+ "        WHERE ( P.PRODUCT_STATUS = 'Y' AND P.PRODUCT_CAT_NO LIKE '"+myCategory+"') ORDER BY P.PRODUCT_NO DESC "
//					+ "    ) "
//					+ ") "
//					+ "WHERE RNUM BETWEEN ? and ?";
//			
//			pstmt = connection.prepareStatement(query);
//			
//			// ? 값을 set하는 구문
//			pstmt.setInt(1, pageInfo.getStartList());
//			pstmt.setInt(2, pageInfo.getEndList());
//			
//			rs = pstmt.executeQuery();
//			
//			while(rs.next()) {
//				Product product = new Product();
//				
//				// product 테이블의 컬럼들을 product 객체에 Mapping 하는 구문
//				product.setProductNo(rs.getInt("PRODUCT_NO"));
//				product.setRowNum(rs.getInt("RNUM"));
//				product.setProductCatNo(rs.getString("PRODUCT_CAT_NO"));
//				product.setProductName(rs.getString("PRODUCT_NAME"));
//				product.setPrice(rs.getInt("PRICE"));
//				product.setProductAmount(rs.getInt("PRODUCT_AMOUNT"));
//				product.setRenamedFileName(rs.getString("RENAMED_FILENAME"));
//				product.setProductStatus(rs.getString("PRODUCT_STATUS"));
//				product.setRegularDeliveryAttr(rs.getString("REGULAR_DELIVERY_ATTR"));
//				
//				list.add(product);
//			}
//			
//		} catch (SQLException e) {
//			e.printStackTrace();
//		} finally {
//			close(rs);
//			close(pstmt);
//		}
//		
//		return list;
//	}
	
	public Cart findCartByNo(Connection connection, int cartNo) {
		Cart cart = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String query = null;

		try {

			query = "SELECT * FROM CART C " 
					+ "WHERE C.STATUS = 'Y' AND C.CART_NO=?";

			pstmt = connection.prepareStatement(query);

			pstmt.setInt(1, cartNo);

			rs = pstmt.executeQuery();

			if (rs.next()) {
				cart = new Cart();

				cart.setCartNo(rs.getInt("CART_NO"));
				cart.setRowNum(rs.getInt("RNUM"));
				cart.setProductNo(rs.getInt("PRODUCT_NO"));
				cart.setProductName(rs.getString("PRODUCT_NAME"));
				cart.setCartCount(rs.getInt("CART_COUNT"));
				cart.setPriceSum(rs.getInt("PRICE_SUM"));
				cart.setFileName(rs.getString("FILENAME"));
				cart.setRegularDeliveryAttr(rs.getString("REGULAR_DELIVERY_ATTR"));
				cart.setStatus(rs.getString("STATUS"));
			}

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rs);
			close(pstmt);
		}

		return cart;
	}
	
//	public int updateCartCount(Connection connection, Cart cart) {
//		int result = 0;
//		PreparedStatement pstmt = null;
//		String query = null;
//		
//		try {
//			query = "UPDATE CART SET CART_COUNT=? WHERE CART_NO=?";
//			pstmt = connection.prepareStatement(query);
//			
//			cart.setCartCount(cart.getCartCount() + 1);
//			
//			pstmt.setInt(1, cart.getCartCount());
//			pstmt.setInt(2, cart.getCartNo());
//			
//			result = pstmt.executeUpdate();	
//		} catch (SQLException e) {
//			e.printStackTrace();
//		} finally {
//			close(pstmt);
//		}		
//		
//		return result;
//	}
	
//	public int updatePriceSum(Connection connection, Cart cart) {
//		int result = 0;
//		PreparedStatement pstmt = null;
//		String query = null;
//		
//		try {
//			query = "UPDATE CART SET PRICE_SUM=? WHERE CART_NO=?";
//			pstmt = connection.prepareStatement(query);
//			
//			cart.setPriceSum(cart.getPriceSum() * cart.getCartCount());
//			
//			pstmt.setInt(1, cart.getPriceSum());
//			pstmt.setInt(2, cart.getCartNo());
//			
//			result = pstmt.executeUpdate();	
//		} catch (SQLException e) {
//			e.printStackTrace();
//		} finally {
//			close(pstmt);
//		}		
//		
//		return result;
//	}
	
	public int updateCart(Connection connection, int cartNo, int cartProdCount) {
		int result = 0;
		PreparedStatement pstmt = null;
		String query = null;

		try {
			query = "UPDATE CART SET CART_COUNT=? WHERE CART_NO=?";
			pstmt = connection.prepareStatement(query);
			
			pstmt.setInt(1, cartProdCount);
			pstmt.setInt(2, cartNo);

			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}

		return result;
	}

	public int updateStatus(Connection connection, int cartNo, String status) {
		int result = 0;
		PreparedStatement pstmt = null;
		String query = null;
		
		try {
			query = "UPDATE CART SET STATUS=? WHERE CART_NO=?";
			pstmt = connection.prepareStatement(query);
			
			pstmt.setString(1, status);
			pstmt.setInt(2, cartNo);
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return result;
	}
}
