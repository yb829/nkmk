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


@WebServlet(name="view", urlPatterns="/member/view")
public class MemeberViewServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
   private MemberService service = new MemberService();
   
    public MemeberViewServlet() {
 
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
		
		request.setAttribute("member", member);
		request.getRequestDispatcher("/views/member/view.jsp").forward(request,response);
	}

}
