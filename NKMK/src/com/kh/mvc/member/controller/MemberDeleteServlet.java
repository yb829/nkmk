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


@WebServlet(name="delete" ,urlPatterns="/member/delete")
public class MemberDeleteServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	private MemberService service = new MemberService();
   
    public MemberDeleteServlet() {
        
    }

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
			int result=0;
			HttpSession session = request.getSession(false);
			Member loginMember = session != null ? (Member)session.getAttribute("loginMember"): null;
			
			if(loginMember != null) {
					result = service.delete(loginMember.getNo());
			
				 if(result > 0) {
		                request.setAttribute("msg", "정상적으로 탈퇴되었습니다 그동안 냥꿀멍꿀을 사랑해주셔서 감사합니다!");
		                request.setAttribute("location", "/member/logout");
		            } else {
		                request.setAttribute("msg", "탈퇴에 실패하였습니다!");
		                request.setAttribute("location", "/member/view");
		            }

		        
		        }else {
		        		//잘못된 접근 
		        	request.setAttribute("msg", "잘못된 접근입니다!");
	                request.setAttribute("location", "/member/view");
		        }

			
			
			request.getRequestDispatcher("/views/common/msg.jsp").forward(request, response);	
	}

}
