package com.kh.mvc.member.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.mvc.member.model.service.MemberService;
import com.kh.mvc.member.model.vo.Member;

@WebServlet(name="findId", urlPatterns="/member/findId")
public class MemberFindIdServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	private MemberService service = new MemberService();
	
    public MemberFindIdServlet() {
        
    }

	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.getRequestDispatcher("/views/member/findId.jsp").forward(request, response);
	}

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String userEmail = request.getParameter("email");
		String userName = request.getParameter("name");
		String identify1 = request.getParameter("identify1");
		System.out.println("이메일 : " + userEmail + " 이름 : " + userName + " 식별값 : " + identify1);
		
		Member findMember = service.findId(userEmail, userName);
		
		System.out.println(findMember);
		
		if(findMember != null) {
			request.setAttribute("identify1", identify1);
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
