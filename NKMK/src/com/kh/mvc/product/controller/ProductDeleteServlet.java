package com.kh.mvc.product.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.mvc.product.model.service.ProductService;

@WebServlet("/product/delete")
public class ProductDeleteServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	private ProductService service = new ProductService();
	
    public ProductDeleteServlet() {
    	
    }
    
    @Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    	
		// 로그인 체크 & 본인 게시글 삭제 여부 확인 (직접 적용시켜 보세요)
    	/*
    	 * 
    	 * asdasdasdasdasdasdasdasdasd
    	 * 
    	 * 
    	 * */
    	
    	int productNo = Integer.parseInt(request.getParameter("productNo"));
    	int result = service.delete(productNo);
    	
    	if(result > 0) {
    		request.setAttribute("msg", "상품 삭제 성공");
    		request.setAttribute("location", "/product/management");
    	} else {
    		request.setAttribute("msg", "상품 삭제 실패");
    		request.setAttribute("location", "/board/management");
    	}
    	
    	request.setAttribute("location", "/product/management");
    	request.getRequestDispatcher("/views/common/msg.jsp").forward(request, response);
	}

}
