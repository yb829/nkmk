package com.kh.mvc.board.controller;

import java.io.File;
import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.mvc.board.model.service.BoardService;
import com.kh.mvc.board.model.vo.Board;
import com.kh.mvc.common.util.FileRename;
import com.oreilly.servlet.MultipartRequest;

@WebServlet("/board/update")
public class BoardUpdateServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
    
	private BoardService service = new BoardService();
	
    public BoardUpdateServlet() {
    }
    
    @Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    	int boardNo = Integer.parseInt(request.getParameter("boardNo"));
    	Board board = service.findBoardByNo(boardNo, true);
    	//hasread는 게시글 상세조회할 때 조회수 올리려고 넣어둔 값.. 지금은 업뎃하는 구간이니까 조회수 올라갈 필요 없음. so true 로 넘김
    	
    	request.setAttribute("board", board);
    	request.getRequestDispatcher("/views/board/update.jsp").forward(request, response);
    }

    @Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    		int result = 0;
        	Board board = new Board();
    		String path = getServletContext().getRealPath("/resources/upload/board");
        	int maxSize = 10485760;
        	String encoding = "UTF-8";     
        	MultipartRequest mr = new MultipartRequest(request, path, maxSize, encoding, new FileRename());
        	
        	board.setNo(Integer.parseInt(mr.getParameter("boardNo")));
        	board.setTitle(mr.getParameter("title"));
        	board.setWriterId(mr.getParameter("writer"));
        	board.setContent(mr.getParameter("content"));
        	board.setOriginalFileName(mr.getParameter("originalFileName"));
        	board.setRenamedFileName(mr.getParameter("renameFileName"));
        	
        	//System.out.println(board);
    		
    		// 파일에 대한 정보를 가져올 때
    		String originalFileName = mr.getOriginalFileName("reloadFile");
    		String renamedFileName = mr.getFilesystemName("reloadFile");
    		
    		if(originalFileName != null && !originalFileName.equals("")) {
    			String deleteFilePath = path + "/"+ board.getRenamedFileName();
    			
    			deleteFile(deleteFilePath);
    			
    			board.setOriginalFileName(originalFileName);
    			board.setRenamedFileName(renamedFileName);
    			
    		}		
    		
    		result = service.save(board);
    		
    		if(result > 0) {
         		request.setAttribute("msg", "게시글 수정 성공");
         		request.setAttribute("location", "/board/list");
			} else {
         		request.setAttribute("msg", "게시글 수정 실패");
			}    			
    		
    		request.setAttribute("location", "/board/view?boardNo="+board.getNo());
        	request.getRequestDispatcher("/views/common/msg.jsp").forward(request, response);

    }

	private void deleteFile(String path) {
		File file = new File(path);
		
		if(file.exists()) {
			file.delete();
		}
		
	}

}
