package com.kh.mvc.member.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.mvc.member.model.service.MemberService;
import com.kh.mvc.member.model.vo.Member;

@WebServlet(name="findPwd", urlPatterns="/member/findPwd")
public class MemberFindPwdServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	private MemberService service = new MemberService();
	
    public MemberFindPwdServlet() {
        
    }

	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.getRequestDispatcher("/views/member/findPwd.jsp").forward(request, response);
	}

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String userEmail = request.getParameter("email");
		String userId = request.getParameter("id");
		String identify2 = request.getParameter("identify2");
		
		System.out.println("이메일 : " + userEmail);
		System.out.println("아이디 : " + userId);
		System.out.println("식별값 : " + identify2);
		
		Member findMember = service.findPwd(userEmail, userId); 
		
		if(findMember != null) {
			request.setAttribute("identify2", identify2);
			request.setAttribute("findMember", findMember);
			request.getRequestDispatcher("/views/member/popup.jsp").forward(request, response);
		}
		else {
			request.setAttribute("msg", "정보가 일치하지 않습니다.");
			request.setAttribute("script", "self.close()");
			request.getRequestDispatcher("/views/common/msg.jsp").forward(request, response);
		}
		
		
	}

}
