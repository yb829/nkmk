package com.kh.mvc.board.model.dao;

import static com.kh.mvc.common.jdbc.JDBCTemplate.close;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.kh.mvc.board.model.vo.Board;
import com.kh.mvc.board.model.vo.Reply;
import com.kh.mvc.common.util.PageInfo;

public class BoardDAO {

	public int getBoardCount(Connection connection) {
		int count = 0;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String query = null;
		
		try {
			query = "SELECT COUNT(*) FROM BOARD WHERE STATUS='Y'";
			pstmt = connection.prepareStatement(query);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				count = rs.getInt(1);
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rs);
			close(pstmt);			
		}
		
		return count;
	}

	public List<Board> findAll(Connection connection, PageInfo pageInfo) {
		List<Board> list= new ArrayList<>();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String query = null;
		
		try {
			 query = "SELECT RNUM, NO, TITLE, ID, CREATE_DATE, ORIGINAL_FILENAME, READCOUNT, STATUS "
		               + "FROM ( "
		               + "    SELECT ROWNUM AS RNUM, NO, TITLE, ID, CREATE_DATE, ORIGINAL_FILENAME, READCOUNT, STATUS "
		               + "    FROM ( "
		               + "        SELECT  B.NO, B.TITLE, M.ID, B.CREATE_DATE, B.ORIGINAL_FILENAME, B.READCOUNT, B.STATUS "
		               + "        FROM BOARD B JOIN MEMBER M ON(B.WRITER_NO = M.NO) "
		               + "        WHERE B.STATUS = 'Y'  ORDER BY B.NO DESC "
		               + "    ) "
		               + ") "
		               + "WHERE RNUM BETWEEN ? and ?";


			pstmt = connection.prepareStatement(query);
			
			// ? 값을 set하는 구문
			pstmt.setInt(1, pageInfo.getStartList());
			pstmt.setInt(2, pageInfo.getEndList());
			
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				Board board = new Board();
				
				// BOARD 테이블의 컬럼들을 Board 객체에 Mapping 하는 구문
				board.setNo(rs.getInt("NO"));
				board.setRowNum(rs.getInt("RNUM"));
				board.setWriterId(rs.getString("ID"));
				board.setTitle(rs.getString("TITLE"));
				board.setCreateDate(rs.getDate("CREATE_DATE"));
				board.setOriginalFileName(rs.getString("ORIGINAL_FILENAME"));
				board.setReadCount(rs.getInt("READCOUNT"));
				board.setStatus(rs.getString("STATUS"));				
				
				list.add(board);
			}			
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rs);
			close(pstmt);			
		}		
		
		return list;
	}

	public int insertBoard(Connection connection, Board board) {
		int result = 0;
		PreparedStatement pstmt = null;
		String query = null;
		
		try {
			query = "INSERT INTO BOARD VALUES(SEQ_BOARD_NO.NEXTVAL,?,?,?,?,?,DEFAULT,DEFAULT,DEFAULT,DEFAULT)";
	         pstmt = connection.prepareStatement(query);
	         
	         pstmt.setInt(1, board.getWriterNo());
	         pstmt.setString(2, board.getTitle());
	         pstmt.setString(3, board.getContent());
	         pstmt.setString(4, board.getOriginalFileName());
	         pstmt.setString(5, board.getRenamedFileName());

			
			result = pstmt.executeUpdate();				
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
	}

	public Board findBoardByNo(Connection connection, int boardNo) {
		Board board = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String query = null;
		
		try {
			query = 
					"SELECT  B.NO, "
						  + "B.TITLE, "
						  + "M.ID, "
						  + "B.READCOUNT, "
						  + "B.ORIGINAL_FILENAME, "
						  + "B.RENAMED_FILENAME, "
						  + "B.CONTENT, "
						  + "B.CREATE_DATE, "
						  + "B.MODIFY_DATE "
				  + "FROM BOARD B "
				  + "JOIN MEMBER M ON(B.WRITER_NO = M.NO) "
				  + "WHERE B.STATUS = 'Y' AND B.NO=?";
			
			pstmt = connection.prepareStatement(query);
			
			pstmt.setInt(1, boardNo);
			
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				board = new Board();
				
				board.setNo(rs.getInt("NO"));
				board.setTitle(rs.getString("TITLE"));
				board.setWriterId(rs.getString("ID"));
				board.setReadCount(rs.getInt("READCOUNT"));
				board.setOriginalFileName(rs.getString("ORIGINAL_FILENAME"));
				board.setRenamedFileName(rs.getString("RENAMED_FILENAME"));
				board.setContent(rs.getString("CONTENT"));
				board.setReplies(this.getRepliesByNo(connection, boardNo));
				board.setCreateDate(rs.getDate("CREATE_DATE"));
				board.setModifyDate(rs.getDate("MODIFY_DATE"));
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rs);
			close(pstmt);
		}
		
		return board;
	}

	
	public int updateReadCount(Connection connection, Board board) {
		int result = 0;
		PreparedStatement pstmt = null;
		String query=null;
		
		try {
			query = "UPDATE BOARD SET READCOUNT=? WHERE NO=?";
			pstmt = connection.prepareStatement(query);
			
			board.setReadCount(board.getReadCount()+1);
			
			pstmt.setInt(1, board.getReadCount());
			pstmt.setInt(2, board.getNo());
			
			result = pstmt.executeUpdate();
			
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		
		return result;
	}

	public int updateStatus(Connection connection, int boardNo, String status) {
		int result=0;
		PreparedStatement pstmt = null;
		String query = null;
		
		try {
			query = "UPDATE BOARD SET STATUS=? WHERE NO=?";
			pstmt = connection.prepareStatement(query);
			
			pstmt.setString(1, status);;
			pstmt.setInt(2, boardNo);
			
			result = pstmt.executeUpdate();
			
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		
		
		
		return result;
	}

	public int updateBoard(Connection connection, Board board) {
		int result = 0;
		PreparedStatement pstmt=null;
		String query = null;
		
		try {
			query = "UPDATE BOARD SET TITLE=?,CONTENT=?,ORIGINAL_FILENAME=?,RENAMED_FILENAME=?,MODIFY_DATE=SYSDATE WHERE NO=?";
			pstmt=connection.prepareStatement(query);
			
			pstmt.setString(1, board.getTitle());
			pstmt.setString(2, board.getContent());
			pstmt.setString(3, board.getOriginalFileName());
			pstmt.setString(4, board.getRenamedFileName());
			pstmt.setInt(5, board.getNo());
			
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		
		return result;
	}

	public List<Reply> getRepliesByNo(Connection connection, int boardNo) {
		List<Reply> replies = new ArrayList<>();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String query = null;
		
		try {
			query = "SELECT R.NO, R.BOARD_NO, R.CONTENT, M.ID, R.CREATE_DATE, R.MODIFY_DATE, R.STATUS "
					+ "FROM REPLY R "
					+ "JOIN MEMBER M ON(R.WRITER_NO = M.NO) "
					+ "WHERE R.STATUS='Y' AND BOARD_NO = ? "
					+ "ORDER BY R.NO DESC";
			
			pstmt = connection.prepareStatement(query);
			
			pstmt.setInt(1, boardNo);
			
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				Reply reply = new Reply();
				
				reply.setNo(rs.getInt("NO"));
				reply.setBoardNo(rs.getInt("BOARD_NO"));
				reply.setContent(rs.getString("CONTENT"));
				reply.setWriterId(rs.getString("ID"));
				reply.setCreateDate(rs.getDate("CREATE_DATE"));
				reply.setModifyDate(rs.getDate("MODIFY_DATE"));
				
				replies.add(reply);
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(rs);
			close(pstmt);
		}
		return replies;
	}


	public int insertReply(Connection connection, Reply reply) {
		int result = 0;
		PreparedStatement pstmt = null;
		String query = null;
		
		try {
			query = "INSERT INTO REPLY VALUES(SEQ_REPLY_NO.NEXTVAL, ?, ?, ?, DEFAULT, DEFAULT, DEFAULT)";
			pstmt = connection.prepareStatement(query);
			
			pstmt.setInt(1, reply.getBoardNo());
			pstmt.setInt(2, reply.getWriterNo());
			pstmt.setString(3, reply.getContent());

			result=pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		
		return result;
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	

}