package com.kh.mvc.member.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


@WebServlet(name="enroll3" ,urlPatterns= "/member/enroll3")
public class MemberEnroll3Servlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
   
    public MemberEnroll3Servlet() {
        
    }

	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		
		request.getRequestDispatcher("/views/member/enroll3.jsp").forward(request, response);
	}

}
