package com.kh.mvc.regular_delivery.model.dao;

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

public class RegularDeliveryDAO {

	public int getProductCount(Connection connection) {
		int result = 0;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String query = null;
		
		try {
			query = "SELECT COUNT(*) FROM PRODUCT WHERE PRODUCT_STATUS='Y' AND REGULAR_DELIVERY_ATTR='Y'";
			pstmt = connection.prepareStatement(query);
			
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				result = rs.getInt(1);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rs);
			close(pstmt);
		}
		
		return result;
	}

	public List<Product> findAll(Connection connection, PageInfo pageInfo, Category category) {
		List<Product> list = new ArrayList<>();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String query = null;
		
		String myCategory_rd = category.getCategory();
		
		try {
			query = "SELECT RNUM, PRODUCT_NO, PRODUCT_CAT_NO, PRODUCT_NAME, PRICE, PRODUCT_AMOUNT, RENAMED_FILENAME, PRODUCT_STATUS, REGULAR_DELIVERY_ATTR "
					+ "FROM ( "
					+ "    SELECT ROWNUM AS RNUM, PRODUCT_NO, PRODUCT_CAT_NO, PRODUCT_NAME, PRICE, PRODUCT_AMOUNT, RENAMED_FILENAME, PRODUCT_STATUS , REGULAR_DELIVERY_ATTR "
					+ "    FROM ( "
					+ "        SELECT  P.PRODUCT_NO, P.PRODUCT_CAT_NO, P.PRODUCT_NAME, P.PRICE, P.PRODUCT_AMOUNT, "
					+ "				P.RENAMED_FILENAME, P.PRODUCT_STATUS, P.REGULAR_DELIVERY_ATTR  FROM PRODUCT P "
					+ "        WHERE ( P.PRODUCT_STATUS = 'Y' AND P.PRODUCT_CAT_NO LIKE '"+myCategory_rd+"' AND P.REGULAR_DELIVERY_ATTR = 'Y') ORDER BY P.PRODUCT_NO DESC "
					+ "    ) "
					+ ") "
					+ "WHERE RNUM BETWEEN ? and ?";
			pstmt = connection.prepareStatement(query);
			
			pstmt.setInt(1, pageInfo.getStartList());
			pstmt.setInt(2, pageInfo.getEndList());
			
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				Product product = new Product();
				
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

}
