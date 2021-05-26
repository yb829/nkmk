package com.kh.mvc.cart.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.kh.mvc.cart.model.service.CartService;
import com.kh.mvc.cart.model.vo.Cart;
import com.kh.mvc.common.util.PageInfo;

@WebServlet("/cart/update")
public class CartUpdateServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	private CartService service = new CartService();
	
    public CartUpdateServlet() {
       
    }
    
    @Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    	int cartNo = Integer.parseInt(request.getParameter("cartNo"));
    	int cartProdCount = Integer.parseInt(request.getParameter("cartProdCount"));
    	int result = service.update(cartNo, cartProdCount);

    	if(result > 0) {
    		request.setAttribute("msg", "상품 수량 업데이트 성공");
    		request.setAttribute("location", "/cart/list");
    	} else {
    		request.setAttribute("msg", "상품 수량 업데이트 실패");
    		request.setAttribute("location", "/cart/list");
    	}
    	
    	request.getRequestDispatcher("/views/common/msg.jsp").forward(request, response);
	}

}
