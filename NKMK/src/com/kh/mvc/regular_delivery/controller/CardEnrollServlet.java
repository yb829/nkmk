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

@WebServlet(name="card", urlPatterns="/card/enroll")
public class CardEnrollServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
    
	private MemberService service = new MemberService();
	
    public CardEnrollServlet() {
        
    }

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		/*
		 * 카드 등록하는 부분은 아직 구현 못함
		 */
		int result = 0;
		HttpSession session = request.getSession(false);
		Member loginMember2 = session != null ? (Member)session.getAttribute("loginMember2") : null;
		
		if(loginMember2 != null) {
			result = service.updateDelivery(loginMember2.getId(), loginMember2.getPassword());
			
			if(result > 0) {
				request.setAttribute("msg", "정기배송 등록이 완료되었습니다.");
				request.setAttribute("script", "self.close()");
				request.setAttribute("location_parent", "/");
			}
			else {
				request.setAttribute("msg", "정보가 일치하지 않습니다.");
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
