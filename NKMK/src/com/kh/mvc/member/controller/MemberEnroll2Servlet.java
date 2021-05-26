package com.kh.mvc.member.controller;

import java.io.IOException;
import java.text.DateFormat;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.mvc.member.model.service.MemberService;
import com.kh.mvc.member.model.vo.Member;


@WebServlet(name="enroll2" ,urlPatterns = "/member/enroll2")
public class MemberEnroll2Servlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
  
	
	private MemberService service = new MemberService();
	
	
    public MemberEnroll2Servlet() {
      
    }

	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
			
		// 회원가입 페이지로 
    	request.getRequestDispatcher("/views/member/enroll2.jsp").forward(request, response);
    	
    	
    	
   
    	
	}

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException, NumberFormatException{
		
		
    	
    	
    	Member member= new Member();
		
		member.setId(request.getParameter("userId")); 
		member.setPassword(request.getParameter("userPwd"));
		member.setName(request.getParameter("userName"));
        member.setAge(Integer.parseInt(request.getParameter("age")));
        member.setGender(request.getParameter("gender"));    
        member.setNickName(request.getParameter("userNick"));
        member.setPhone(request.getParameter("phone"));
        member.setEmail(request.getParameter("email"));
        member.setAddress(request.getParameter("address"));
        
        String[] petConcern = request.getParameterValues("petConcern");
       
        member.setPetName(request.getParameter("petName"));
        member.setPetBirth(request.getParameter("petBirth"));  
        member.setPetType(request.getParameter("petType"));
        member.setPetSort(request.getParameter("petSort"));
        member.setPetNeutralization(request.getParameter("petNeutralization"));
        member.setPetGender(request.getParameter("petGender"));
        member.setPetConcern(petConcern != null ? String.join(",", petConcern) : null);
        member.setEmailAgree(request.getParameter("emailAgree"));
        member.setSmsAgree(request.getParameter("smsAgree"));
        member.setTerms1(request.getParameter("terms1"));
        member.setTerms2(request.getParameter("terms2"));
	
		
		System.out.println("Servlet : " + member);
		

        int result = service.save(member);
        
        
        if(result > 0) {
            request.setAttribute("msg", "회원가입성공!");
            request.setAttribute("location", "/member/enroll3");
        } else {
            request.setAttribute("msg", "회원가입실패!");
            request.setAttribute("location", "/member/enroll2");
        }

        request.getRequestDispatcher("/views/common/msg.jsp").forward(request, response);	


	}
}
	


