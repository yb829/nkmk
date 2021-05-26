package com.kh.mvc.cart.controller;
import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.mvc.cart.model.service.CartService;
import com.kh.mvc.cart.model.vo.Cart;
import com.kh.mvc.common.util.PageInfo;
@WebServlet("/cart/list")
public class CartListServlet extends HttpServlet {
	
	private static final long serialVersionUID = 1L;
	
	private CartService service = new CartService();
	
	  public CartListServlet() {
	  }

	  protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		  
		  int listCount = 0;
		  PageInfo pageInfo = null;
		  List<Cart> cartList = null;
		  
		  listCount = service.getCartCount(); // 전체 상품 개수
		  pageInfo = new PageInfo(1, 10, listCount, listCount);
		  cartList = service.getCartList(pageInfo);
		  
		  request.setAttribute("cartList", cartList);
		  request.getRequestDispatcher("/views/cart/list.jsp").forward(request, response);
	  }
}