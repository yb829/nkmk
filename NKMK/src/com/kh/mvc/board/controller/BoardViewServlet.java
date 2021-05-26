package com.kh.mvc.board.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.mvc.board.model.service.BoardService;
import com.kh.mvc.board.model.vo.Board;

@WebServlet("/board/view")
public class BoardViewServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	private BoardService service = new BoardService();

    public BoardViewServlet() {
    }

    @Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    	Board board = null;  	
    	int boardNo = Integer.parseInt(request.getParameter("boardNo"));
    	
    	//새로고침 시 조회수가 증가하는 것을 방지하는 로직
    	// 쿠키에 조회한 내용을 기록하여 한 번 조회하면 그 뒤에는 조회수가 올라갈지 않게 설정
    	// 1. 쿠키에 조회한 이력이 있는지 확인
    	Cookie[] cookies = request.getCookies();
    	String boardHistory=""; // 쿠키에서 게시글 조회 이력을 읽어오는 변수 
    	boolean hasRead = false; // 읽은 글이면 true 읽지 않았으면 false
    	
    	if(cookies != null) {
    		String name = null;
    		String value = null;
    		
    		for(Cookie cookie : cookies) {
    			name = cookie.getName();
    			value = cookie.getValue();
    			
    			//boardHistory인 쿠키값을 찾기
    			if("boardHistory".equals(name)) {
    			 boardHistory = value;
    			 //현재 쿠키에 저장된 값
    			 if(boardHistory.contains("|"+boardNo+"|")) {
    				 //해당하는 내용이 포함되어 있다면(읽은 게시글)
    				 // boardHistory : |1||2||13| --> 존재한다면 true로 바뀌게 됨. || 안넣으면 망함
    				 hasRead=true;
    				 
    				 break; //포함되어 있는것 알았다면 여러번 실행할 필요 없음
    			 }
    		 }
    		}
    	}
    	
    	// 2. 읽지않은 게시글이면 cookie에 기록
    	if(!hasRead) {
    		Cookie cookie = new Cookie("boardHistory", boardHistory+"|"+boardNo+"|");
    		
    		cookie.setMaxAge(-1); //브라우저 종료시 쿠키 삭제
    		response.addCookie(cookie);
    	}
    	
    	board = service.findBoardByNo(boardNo,hasRead);
    	
    	
    	//System.out.println("boardNo : " + boardNo);
    	//board = service.findBoardByNo(boardNo);
    	
    	System.out.println(board);
    	
    	
    	request.setAttribute("board", board);
		request.getRequestDispatcher("/views/board/view.jsp").forward(request, response);
	}

}