package com.kh.mvc.regular_delivery.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.kh.mvc.member.model.service.MemberService;
import com.kh.mvc.member.model.vo.Member;

@WebServlet(name="apply", urlPatterns="/regularDelivery/apply")
public class RegularDeliveryApplyServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
     
	private MemberService service = new MemberService();
   
    public RegularDeliveryApplyServlet() {
        
    }

	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String userId = request.getParameter("id");
		String userPwd = request.getParameter("pwd");
		Member loginMember2 = service.login(userId, userPwd);
		
		request.setAttribute("userId", userId);
		request.setAttribute("userPwd", userPwd);
		HttpSession session = request.getSession();
		session.setAttribute("loginMember2", loginMember2);
		
		response.sendRedirect(request.getContextPath() + "/views/regular_delivery/regular_apply.jsp");
		
		//request.getRequestDispatcher("/views/regular_delivery/regular_apply.jsp").forward(request, response);;
	}

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String userId = request.getParameter("id");
		String userPwd = request.getParameter("pwd");
		Member loginMember2 = service.login(userId, userPwd);
		
		request.setAttribute("userId", userId);
		request.setAttribute("userPwd", userPwd);
		HttpSession session = request.getSession();
		session.setAttribute("loginMember2", loginMember2);
		
		request.getRequestDispatcher("/views/regular_delivery/popup.jsp").forward(request, response);
	}

}
