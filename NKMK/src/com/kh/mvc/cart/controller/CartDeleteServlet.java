package com.kh.mvc.cart.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.mvc.board.model.service.BoardService;
import com.kh.mvc.cart.model.service.CartService;

@WebServlet("/cart/delete")
public class CartDeleteServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	private CartService service = new CartService();
	
    public CartDeleteServlet() {
    	
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
    	
    	int cartNo = Integer.parseInt(request.getParameter("cartNo"));
    	int result = service.delete(cartNo);
    	
    	if(result > 0) {
    		request.setAttribute("msg", "장바구니 삭제 성공");
    		request.setAttribute("location", "/cart/list");
    	} else {
    		request.setAttribute("msg", "장바구니 삭제 실패");
    		request.setAttribute("location", "/cart/list");
    	}
    	
    	request.getRequestDispatcher("/views/common/msg.jsp").forward(request, response);
	}

}
