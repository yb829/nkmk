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


@WebServlet(name= "update2", urlPatterns="/member/update2")
public class MemberUpdateServlet2 extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	private MemberService service = new MemberService();
	
    public MemberUpdateServlet2() {
        
    }

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    HttpSession session = request.getSession(false);
	
	Member loginMember = session != null ? (Member)session.getAttribute("loginMember"): null;
	Member member = null;
	//1.로그인 된 사용자인지 
	int result=0;
	if(loginMember != null) {
		member = new Member();   
		
		String[] petConcern = request.getParameterValues("petConcern");
		
		member.setId(request.getParameter("userId"));    
        member.setPetName(request.getParameter("petName"));
        member.setPetBirth(request.getParameter("petBirth"));  
        member.setPetType(request.getParameter("petType"));
        member.setPetSort(request.getParameter("petSort"));
        member.setPetNeutralization(request.getParameter("petNeutralization"));
        member.setPetGender(request.getParameter("petGender"));
        member.setPetConcern(petConcern != null ? String.join(",", petConcern) : null);
  

	
        
        //본인 계정 정보 확인 (파라미터 변조 방지)
        if(loginMember.getId().equals(member.getId())){
        	member.setNo(loginMember.getNo());
        //정보를 수정
        	result= service.updateMember2(member);
        	 
            if(result > 0) {
            	session.setAttribute("loginMember", service.findMemberById(member.getId()));
            	
                request.setAttribute("msg", "반려동물 정보수정이 완료되었습니다!");
                request.setAttribute("location", "/board/mypage");
            } else {
                request.setAttribute("msg", "반려동물 정보수정에 실패하였습니다!");
                request.setAttribute("location", "/board/mypage");
            }

        
        }else {
        		//잘못된 접근 
        	request.setAttribute("msg", "잘못된 접근입니다!");
            request.setAttribute("location", "/board/mypage");
        }
	}else {
		//
	}
	
	  request.getRequestDispatcher("/views/common/msg.jsp").forward(request, response);	
}

}
