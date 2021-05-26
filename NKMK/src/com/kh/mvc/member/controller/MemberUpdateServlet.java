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


@WebServlet(name= "update" , urlPatterns="/member/update")
public class MemberUpdateServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	private MemberService service = new MemberService();
	
    public MemberUpdateServlet() {
      
    }


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	
		
		//1.로그인 된 사용자인지 
		int result = 0;
		Member member = null;
    	HttpSession session = request.getSession(false);
    	Member loginMember = session != null ? (Member)session.getAttribute("loginMember") : null;
    	
		if(loginMember != null) {
			
			member = new Member();   
			
			member.setId(request.getParameter("userId")); 
			member.setName(request.getParameter("userName"));
			member.setPhone(request.getParameter("phone"));
			member.setAge(Integer.parseInt(request.getParameter("age")));
	        member.setGender(request.getParameter("gender"));    
	        member.setNickName(request.getParameter("userNick"));
	        member.setEmail(request.getParameter("email"));
	        member.setAddress(request.getParameter("address"));
	  
	   
	        
	        //본인 계정 정보 확인 (파라미터 변조 방지)
	        if(loginMember.getId().equals(member.getId())){
	        	member.setNo(loginMember.getNo());
	        	
	        	System.out.println("서블렛넘어오는값"+member);
	        //회원정보를 수정
	        	result= service.save(member);
	        	 
	            if(result > 0) {
	            	session.setAttribute("loginMember", service.findMemberById(member.getId()));
	            	
	                request.setAttribute("msg", "회원정보수정이 완료되었습니다!");
	                request.setAttribute("location", "/");
	            } else {
	                request.setAttribute("msg", "회원정보수정에 실패하였습니다!");
	                request.setAttribute("location", "/board/mypage");
	            }

	        
	        }else {
	        		//잘못된 접근 
	        	request.setAttribute("msg", "잘못된 접근입니다!");
                request.setAttribute("location", "/board/mypage");
	        }
		}else {
			request.setAttribute("msg", "로그인 후 수정해주세요.");
    		request.setAttribute("location", "/");
		}
		
		  request.getRequestDispatcher("/views/common/msg.jsp").forward(request, response);	
	}

	}
