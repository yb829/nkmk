package com.kh.mvc.product.model.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.kh.mvc.common.util.Category;
import com.kh.mvc.common.util.PageInfo;
import com.kh.mvc.product.model.vo.Product;

import static com.kh.mvc.common.jdbc.JDBCTemplate.*;

public class ProductDAO {
	
	public int insertProduct(Connection connection, Product product) {
		
		int result = 0;
		PreparedStatement pstmt = null;
		String query = null;
		
		try {
			query = "INSERT INTO PRODUCT VALUES(SEQ_PRODUCT_NO.NEXTVAL, ?, ?, ?, ?, ?, ?, ?, DEFAULT, DEFAULT, DEFAULT, ?)";
			pstmt = connection.prepareStatement(query);
			
			pstmt.setString(1, product.getProductCatNo());
			pstmt.setString(2, product.getProductName());
			pstmt.setInt(3, product.getPrice());
			pstmt.setInt(4, product.getProductAmount());
			pstmt.setString(5, product.getOriginalFileName());
			pstmt.setString(6, product.getRenamedFileName());
			pstmt.setString(7, product.getProductContents());
			pstmt.setString(8, product.getRegularDeliveryAttr());
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
	}

	public int getProductCount(Connection connection) {
		int count = 0;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String query = null;
		
		try {
			query="SELECT COUNT(*) FROM PRODUCT WHERE PRODUCT_STATUS='Y'";
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
	public List<Product> findAll(Connection connection, PageInfo pageInfo) {
		List<Product> list = new ArrayList<>();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String query = null;
		
		try {
			query = "SELECT RNUM, PRODUCT_NO, PRODUCT_CAT_NO, PRODUCT_NAME, PRICE, PRODUCT_AMOUNT, RENAMED_FILENAME, PRODUCT_STATUS, REGULAR_DELIVERY_ATTR "
					+ "FROM ( "
					+ "    SELECT ROWNUM AS RNUM, PRODUCT_NO, PRODUCT_CAT_NO, PRODUCT_NAME, PRICE, PRODUCT_AMOUNT, RENAMED_FILENAME, PRODUCT_STATUS , REGULAR_DELIVERY_ATTR "
					+ "    FROM ( "
					+ "        SELECT  P.PRODUCT_NO, P.PRODUCT_CAT_NO, P.PRODUCT_NAME, P.PRICE, P.PRODUCT_AMOUNT, "
					+ "				P.RENAMED_FILENAME, P.PRODUCT_STATUS, P.REGULAR_DELIVERY_ATTR  FROM PRODUCT P "
					+ "        WHERE ( P.PRODUCT_STATUS = 'Y') ORDER BY P.PRODUCT_NO DESC "
					+ "    ) "
					+ ") "
					+ "WHERE RNUM BETWEEN ? and ?";
			
			pstmt = connection.prepareStatement(query);
			
			// ? 값을 set하는 구문
			pstmt.setInt(1, pageInfo.getStartList());
			pstmt.setInt(2, pageInfo.getEndList());
			
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				Product product = new Product();
				
				// product 테이블의 컬럼들을 product 객체에 Mapping 하는 구문
				product.setProductNo(rs.getInt("PRODUCT_NO"));
				product.setRowNum(rs.getInt("RNUM"));
				product.setProductCatNo(rs.getString("PRODUCT_CAT_NO"));
				product.setProductName(rs.getString("PRODUCT_NAME"));
				product.setPrice(rs.getInt("PRICE"));
				product.setProductAmount(rs.getInt("PRODUCT_AMOUNT"));
				product.setRenamedFileName(rs.getString("RENAMED_FILENAME"));
				product.setProductStatus(rs.getString("PRODUCT_STATUS"));
				product.setRegularDeliveryAttr(rs.getString("REGULAR_DELIVERY_ATTR"));
				
				list.add(product);
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rs);
			close(pstmt);
		}
		
		return list;
	}

	public List<Product> findAll(Connection connection, PageInfo pageInfo, Category category) {
		List<Product> list = new ArrayList<>();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String query = null;
		
		String myCategory = category.getCategory();
		
		try {
			query = "SELECT RNUM, PRODUCT_NO, PRODUCT_CAT_NO, PRODUCT_NAME, PRICE, PRODUCT_AMOUNT, RENAMED_FILENAME, PRODUCT_STATUS, REGULAR_DELIVERY_ATTR "
					+ "FROM ( "
					+ "    SELECT ROWNUM AS RNUM, PRODUCT_NO, PRODUCT_CAT_NO, PRODUCT_NAME, PRICE, PRODUCT_AMOUNT, RENAMED_FILENAME, PRODUCT_STATUS , REGULAR_DELIVERY_ATTR "
					+ "    FROM ( "
					+ "        SELECT  P.PRODUCT_NO, P.PRODUCT_CAT_NO, P.PRODUCT_NAME, P.PRICE, P.PRODUCT_AMOUNT, "
					+ "				P.RENAMED_FILENAME, P.PRODUCT_STATUS, P.REGULAR_DELIVERY_ATTR  FROM PRODUCT P "
					+ "        WHERE ( P.PRODUCT_STATUS = 'Y' AND P.PRODUCT_CAT_NO LIKE '"+myCategory+"') ORDER BY P.PRODUCT_NO DESC "
					+ "    ) "
					+ ") "
					+ "WHERE RNUM BETWEEN ? and ?";
			
			pstmt = connection.prepareStatement(query);
			
			// ? 값을 set하는 구문
			pstmt.setInt(1, pageInfo.getStartList());
			pstmt.setInt(2, pageInfo.getEndList());
			
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				Product product = new Product();
				
				// product 테이블의 컬럼들을 product 객체에 Mapping 하는 구문
				product.setProductNo(rs.getInt("PRODUCT_NO"));
				product.setRowNum(rs.getInt("RNUM"));
				product.setProductCatNo(rs.getString("PRODUCT_CAT_NO"));
				product.setProductName(rs.getString("PRODUCT_NAME"));
				product.setPrice(rs.getInt("PRICE"));
				product.setProductAmount(rs.getInt("PRODUCT_AMOUNT"));
				product.setRenamedFileName(rs.getString("RENAMED_FILENAME"));
				product.setProductStatus(rs.getString("PRODUCT_STATUS"));
				product.setRegularDeliveryAttr(rs.getString("REGULAR_DELIVERY_ATTR"));
				
				list.add(product);
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rs);
			close(pstmt);
		}
		
		return list;
	}
	
	public Product findProductByNo(Connection connection, String productCatNo) {
		Product product = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String query = null;

		try {

			query = "SELECT PRODUCT_NO, " 
					+ "PRODUCT_CAT_NO, " 
					+ "PRODUCT_NAME, " 
					+ "PRICE, " 
					+ "PRODUCT_AMOUNT, "
					+ "ORIGINAL_FILENAME, " 
					+ "RENAMED_FILENAME, " 
					+ "PRODUCT_CONTENTS, " 
					+ "PRODUCT_ENROLL_DATE, "
					+ "PRODUCT_GRADE, " 
					+ "PRODUCT_STATUS, "
					+ "REGULAR_DELIVERY_ATTR " 
					+ "FROM PRODUCT P " 
					+ "WHERE P.PRODUCT_STATUS = 'Y' AND P.PRODUCT_CAT_NO=?";

			pstmt = connection.prepareStatement(query);

			pstmt.setString(1, productCatNo);

			rs = pstmt.executeQuery();

			if (rs.next()) {
				product = new Product();

				product.setProductNo(rs.getInt("PRODUCT_NO"));
				product.setProductCatNo(rs.getString("PRODUCT_CAT_NO"));
				product.setProductName(rs.getString("PRODUCT_NAME"));
				product.setPrice(rs.getInt("PRICE"));
				product.setProductAmount(rs.getInt("PRODUCT_AMOUNT"));
				product.setOriginalFileName(rs.getString("ORIGINAL_FILENAME"));
				product.setRenamedFileName(rs.getString("RENAMED_FILENAME"));
				product.setProductContents(rs.getString("PRODUCT_CONTENTS"));
				product.setProductEnrollDate(rs.getDate("PRODUCT_ENROLL_DATE"));
				product.setProductGrade(rs.getInt("PRODUCT_GRADE"));
				product.setRegularDeliveryAttr(rs.getString("REGULAR_DELIVERY_ATTR"));
			}

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rs);
			close(pstmt);
		}

		return product;
	}
	
	public int updateProduct(Connection connection, Product product) {
		int result = 0;
		PreparedStatement pstmt = null;
		String query = null;

		try {
			query = "UPDATE PRODUCT SET " + "PRODUCT_NAME=?, " + "PRICE=?, " + "PRODUCT_AMOUNT=?, "
					+ "ORIGINAL_FILENAME=?, " + "RENAMED_FILENAME=?, " + "REGULAR_DELIVERY_ATTR=? " + "WHERE PRODUCT_NO=?";

			pstmt = connection.prepareStatement(query);
			
			pstmt.setString(1, product.getProductName());
			pstmt.setInt(2, product.getPrice());
			pstmt.setInt(3, product.getProductAmount());
			pstmt.setString(4, product.getOriginalFileName());
			pstmt.setString(5, product.getRenamedFileName());
			pstmt.setString(6, product.getRegularDeliveryAttr());
			pstmt.setInt(7, product.getProductNo());

			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}

		return result;
	}

	public int updateStatus(Connection connection, int productNo, String status) {
		int result = 0;
		PreparedStatement pstmt = null;
		String query = null;
		
		try {
			query = "UPDATE PRODUCT SET PRODUCT_STATUS=? WHERE PRODUCT_NO=?";
			pstmt = connection.prepareStatement(query);
			
			pstmt.setString(1, status);
			pstmt.setInt(2, productNo);
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return result;
	}
}
