package com.kh.mvc.member.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.mvc.member.model.vo.Member;


@WebServlet(name="enroll1" ,urlPatterns = "/member/enroll1")
public class MemberEnroll1Servlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
  
    public MemberEnroll1Servlet() {
       
    }

	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		
		//약관페이지
		request.getRequestDispatcher("/views/member/enroll1.jsp").forward(request, response);
		
	}

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.getRequestDispatcher("/views/member/enroll2.jsp").forward(request, response);
		//enroll2 hidden 값으로 넘김 

	
	}

}
