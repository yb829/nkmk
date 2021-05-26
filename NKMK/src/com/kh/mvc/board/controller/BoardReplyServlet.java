package com.kh.mvc.board.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.kh.mvc.board.model.service.BoardService;
import com.kh.mvc.board.model.vo.Reply;
import com.kh.mvc.member.model.vo.Member;

@WebServlet("/board/reply")
public class BoardReplyServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	private BoardService service = new BoardService();

    public BoardReplyServlet() {
    }

    @Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int boardNo = Integer.parseInt(request.getParameter("boardNo"));
		String writer = request.getParameter("writer");
		String content = request.getParameter("content");
    	HttpSession session = request.getSession(false);
    	Member loginMember = session != null ? (Member)session.getAttribute("loginMember") : null;

    	if(loginMember != null) {
    		if(loginMember.getId().equals(writer)) {
    			Reply reply = new Reply();
    			
    			reply.setBoardNo(boardNo);
    			reply.setWriterNo(loginMember.getNo());
    			reply.setWriterId(writer);
    			reply.setContent(content);
    			
    			int result = service.saveReply(reply);
    			
    			if(result > 0) {
             		request.setAttribute("msg", "댓글 등록 성공!");
             		request.setAttribute("location", "/board/view?boardNo=" + boardNo);
    			} else {
    				request.setAttribute("msg", "댓글 등록 실패!");
             		request.setAttribute("location", "/board/view?boardNo=" + boardNo);
    			}
    		}else {
         		request.setAttribute("msg", "잘못된 접근 입니다.");
         		request.setAttribute("location", "/");
    		}
    	} else {
     		request.setAttribute("msg", "로그인 후 사용할 수 있습니다.");
     		request.setAttribute("location", "/");
    	}
    	
    	request.getRequestDispatcher("/views/common/msg.jsp").forward(request, response);
   	}
    
    
    
    
    
    
    
    
    
    
    
    
}