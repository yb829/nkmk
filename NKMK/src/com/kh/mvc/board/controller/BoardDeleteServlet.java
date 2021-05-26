package com.kh.mvc.board.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.mvc.board.model.service.BoardService;

@WebServlet("/board/delete")
public class BoardDeleteServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
      
	private BoardService service = new BoardService();
	
    public BoardDeleteServlet() {
    }
    
    @Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    	// 로그인 체크 & 본인 게시글 삭제 여부 확인 : 알아서하래...말..방구..?
    	
    	int boardNo = Integer.parseInt(request.getParameter("boardNo"));
    	int result = service.delete(boardNo);
    	
    	if(result > 0) {
    		request.setAttribute("msg", "게시글 삭제 성공");
     		request.setAttribute("location", "/board/list");
    	}else {
    		request.setAttribute("msg", "게시글 삭제 실패");
     		request.setAttribute("location", "/board/list");
    	}
    	request.getRequestDispatcher("/views/common/msg.jsp").forward(request, response);

    }

}
