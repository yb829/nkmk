package com.kh.mvc.product.controller;
import java.io.IOException;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.mvc.common.util.Category;
import com.kh.mvc.common.util.PageInfo;
import com.kh.mvc.product.model.service.ProductService;
import com.kh.mvc.product.model.vo.Product;
@WebServlet("/product/list")
public class ProductListServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	private ProductService service = new ProductService();
    public ProductListServlet() {
    }
    @Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    	// 게시물 리스트 조회
    	// 페이징 처리
    	
    	int page = 0;
    	int listCount = 0;
    	PageInfo pageInfo = null;
    	List<Product> list = null;
    	
    	//TEST
    	Category myCategory = new Category(request.getParameter("myCategory"));
    	
    	try {
    		page = Integer.parseInt(request.getParameter("page"));
    	} catch (NumberFormatException e) {
    		page = 1;
		}
    	
    	listCount = service.getProductCount();
        pageInfo = new PageInfo(page, 10, listCount, listCount);
        //pageInfo = new PageInfo(1, 10, 전체상품개수, 전체상품개수);
        list = service.getProductList(pageInfo, myCategory);
        //list = service.getProductList(new PageInfo(1,10,전체상품개수,전체상품개수));

    	request.setAttribute("list", list);
    	request.setAttribute("pageInfo", pageInfo);
    	request.getRequestDispatcher("/views/product/list.jsp").forward(request, response);
	}
}