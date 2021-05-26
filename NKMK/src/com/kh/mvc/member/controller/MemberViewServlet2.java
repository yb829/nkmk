package com.kh.mvc.member.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.kh.mvc.member.model.service.MemberService;
import com.kh.mvc.member.model.vo.Member;


@WebServlet(name="view2", urlPatterns="/member/view2")
public class MemberViewServlet2 extends HttpServlet {
	private static final long serialVersionUID = 1L;
	 
	private MemberService service = new MemberService();
	
    public MemberViewServlet2() {
       
    }

	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		 HttpSession session = request.getSession(false);
		 
			Member loginMember = session != null ? (Member)session.getAttribute("loginMember"): null;
			Member member = null;
			
		
			if(loginMember != null) {
				member =service.findMemberById(loginMember.getId());
			}else {
				 
			}
			System.out.println(member);
			request.setAttribute("member", member);

			request.getRequestDispatcher("/views/member/view2.jsp").forward(request,response);
	}

}
