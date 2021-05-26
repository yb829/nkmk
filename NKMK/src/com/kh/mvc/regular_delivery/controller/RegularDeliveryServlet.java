package com.kh.mvc.regular_delivery.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.kh.mvc.common.util.Category;
import com.kh.mvc.common.util.PageInfo;
import com.kh.mvc.member.model.service.MemberService;
import com.kh.mvc.member.model.vo.Member;
import com.kh.mvc.product.model.vo.Product;
import com.kh.mvc.regular_delivery.model.service.RegularDeliveryService;

@WebServlet("/regular/delivery")
public class RegularDeliveryServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	private MemberService service = new MemberService();
	private RegularDeliveryService service_rd = new RegularDeliveryService();
	
    public RegularDeliveryServlet() {
        
    }

    @Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    	String userId = request.getParameter("id");
    	String userPwd = request.getParameter("pwd");
    	Member loginMember = service.login(userId, userPwd);
    	
    	// 페이징 처리 & 게시물 조회
    	int page = 0;
    	int listCount = 0;
    	PageInfo pageInfo = null;
    	List<Product> list = null;
    	
    	Category myCategory_rd = new Category(request.getParameter("myCategory_rd"));
    	
    	try {
    		page = Integer.parseInt(request.getParameter("page"));
    	} catch (NumberFormatException e) {
    		page = 1;
    	}
    	
    	listCount = service_rd.getProductCount();
    	pageInfo = new PageInfo(page, 10, listCount, listCount);
        list = service_rd.getProductList(pageInfo, myCategory_rd);
        
    	// 로그인 한 경우
    	if(loginMember != null && loginMember.getId().equals(userId) && loginMember.getPassword().equals(userPwd)) {
    		request.setAttribute("userId", userId);
        	request.setAttribute("userPwd", userPwd);
        	HttpSession session = request.getSession();
    		session.setAttribute("loginMember", loginMember);
    		
    		request.setAttribute("list", list);
        	request.setAttribute("pageInfo", pageInfo);
        	request.getRequestDispatcher("/views/regular_delivery/regular_main.jsp").forward(request, response);
    		//response.sendRedirect(request.getContextPath() + "/views/regular_delivery/regular_main.jsp");
    	}
    	
    	// 로그인 안 한 경우
    	if(userId.equals("a") && userPwd.equals("b")) {
    		request.setAttribute("msg", "로그인 먼저 해주세요");
    		request.setAttribute("location", "/");
    		request.getRequestDispatcher("/views/common/msg.jsp").forward(request, response);
    		
    	}
		
		/*
		else {
			String PageUrl= "/";
			response.setContentType("text/html;charset=UTF-8");
			PrintWriter writer = response.getWriter();
			writer.println("<script>alert('로그인 해주세요'); location.href='"+ PageUrl +"';</script>");
			writer.close();
			response.sendRedirect(request.getContextPath() + PageUrl);
		}
		*/
		//request.getRequestDispatcher("/views/regular_delivery/regular_main.jsp").forward(request, response);
	}

    @Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	}

}
