package com.kh.mvc.board.model.service;

import static com.kh.mvc.common.jdbc.JDBCTemplate.close;
import static com.kh.mvc.common.jdbc.JDBCTemplate.commit;
import static com.kh.mvc.common.jdbc.JDBCTemplate.getConnection;
import static com.kh.mvc.common.jdbc.JDBCTemplate.rollback;

import java.sql.Connection;
import java.util.List;

import com.kh.mvc.board.model.dao.BoardDAO;
import com.kh.mvc.board.model.vo.Board;
import com.kh.mvc.board.model.vo.Reply;
import com.kh.mvc.common.util.PageInfo;

public class BoardService {
	
	private BoardDAO dao = new BoardDAO();

	public int getBoardCount() {
		Connection connection = getConnection();
		int count = dao.getBoardCount(connection);
		
		close(connection);
		
		return count;
	}

	public List<Board> getBoardList(PageInfo pageInfo) {
		Connection connection = getConnection();
		List<Board> list = dao.findAll(connection, pageInfo);
		
		close(connection);
		
		return list;
	}
	
	public int save(Board board) {
		
			int result=0;
			Connection connection = getConnection();
			
			if(board.getNo()!=0) {
				result=dao.updateBoard(connection, board);
			}else {
				result = dao.insertBoard(connection,board);
			}
			
			if(result>0) {
				commit(connection);
			}else {
				rollback(connection);
			}
			
			close(connection);
			return result;
		
	}
	//리플 가져오기용
	public Board findBoardByNo(int boardNo, boolean hasRead) {
		Board board = null;
		Connection connection = getConnection();
		
		board = dao.findBoardByNo(connection,boardNo);

		board.setReplies(dao.getRepliesByNo(connection,boardNo));
		
		
		
		// 게시글 조회수 증가시키는 로직. 게시글이 존재하고 hasRead가 false일 경우에만 조회수 증가
		if(board!=null && !hasRead) {
			int result = dao.updateReadCount(connection,board);
			if(result > 0) {
				commit(connection);
			}else {
				rollback(connection);
			}
		}
		close(connection);
		
		return board;
	}

	public int delete(int boardNo) {
		int result = 0;
		Connection connection = getConnection();
		
		result = dao.updateStatus(connection,boardNo,"N");
		
		if(result>0) {
			commit(connection);
		}else {
			rollback(connection);
		}
		
		
		close(connection);
		
		return result;
	}

	public int saveReply(Reply reply) {
		int result = 0;
		
		Connection connection = getConnection();
		
		result = dao.insertReply(connection,reply);
		
		if(result>0) {
			commit(connection);
		}else {
			rollback(connection);
		}
		close(connection);
		
		return result;
	}
}