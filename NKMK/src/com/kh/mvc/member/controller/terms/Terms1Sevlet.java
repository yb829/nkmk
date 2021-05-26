package com.kh.mvc.member.controller.terms;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


@WebServlet(name="terms1", urlPatterns= "/terms/terms1")
public class Terms1Sevlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
   
    public Terms1Sevlet() {
      
    }

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.getRequestDispatcher("/member/terms/terms1.jsp").forward(request, response);
	}

}
