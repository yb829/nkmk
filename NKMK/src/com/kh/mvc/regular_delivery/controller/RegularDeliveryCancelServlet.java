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

@WebServlet("/regularDelivery/cancel")
public class RegularDeliveryCancelServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	private MemberService service = new MemberService();
	
    public RegularDeliveryCancelServlet() {

    }

	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int result = 0;
		//HttpSession session = request.getSession(false);
		//Member loginMember2 = session != null ? (Member)session.getAttribute("loginMember2") : null;
		String userId = request.getParameter("id");
    	String userPwd = request.getParameter("pwd");
    	Member loginMember2 = service.login(userId, userPwd);
		
		if(loginMember2 != null) {
			result = service.cancelDelivery(loginMember2.getId(), loginMember2.getPassword());
			
			if(result > 0) {
				request.setAttribute("msg", "정기배송이 취소되었습니다.");
				request.setAttribute("location", "/");
			}
			else {
				request.setAttribute("msg", "정기배송 취소에 실패하였습니다.");
				request.setAttribute("location", "/");
			}
			
			request.getRequestDispatcher("/views/common/msg.jsp").forward(request, response);
		}
		else {
			request.setAttribute("msg", "로그인 정보가 일치하지 않습니다.");
			request.setAttribute("location", "/");
			request.getRequestDispatcher("/views/common/msg.jsp").forward(request, response);
		}
	}

}
