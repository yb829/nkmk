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

@WebServlet("/cart/insert")
public class CartInsertServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	private CartService service = new CartService();
	
    public CartInsertServlet() {
       
    }
    
    @Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    	int productNo = Integer.parseInt(request.getParameter("productNo"));

    	int result = service.insert(productNo);
    	
    	if(result > 0) {
     		request.setAttribute("msg", "장바구니 등록 성공");
     		request.setAttribute("location", "/cart/list");
		} else {
     		request.setAttribute("msg", "장바구니 등록 실패");
     		request.setAttribute("location", "/cart/list");
		} 

    	request.getRequestDispatcher("/views/common/msg.jsp").forward(request, response);
	}

}
