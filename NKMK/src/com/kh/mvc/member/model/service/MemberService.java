package com.kh.mvc.member.model.service;

import java.sql.Connection;

import static com.kh.mvc.common.jdbc.JDBCTemplate.*;
import static com.kh.mvc.common.jdbc.JDBCTemplate.close;
import com.kh.mvc.member.model.dao.MemberDAO;
import com.kh.mvc.member.model.vo.Member;

public class MemberService {
	

private MemberDAO dao = new MemberDAO();
	
	public Member login(String userId, String userPwd) {
		//Connection connection = getConnection();
		Member member = this.findMemberById(userId);
		//close(connection);
		
		if(member != null && member.getPassword().equals(userPwd)) {
			return member;
		}
		else {
			return null;
		}
	}

    
    
    
    public int save(Member member) {    //저장 - 회원가입등록(insertMember) or 회원정보수정(updateMember)
        int result = 0;
        Connection connection = getConnection();
        System.out.println("memberservice통과");
        if(member.getNo() != 0) {
            result = dao.updateMember(connection, member);
        } else {
            result = dao.insertMember(connection, member);
        }
        
        if(result > 0) {
            commit(connection);
        } else {
            rollback(connection);
        }
        
        close(connection);
        
        return result;
    }


    public int updateMember2(Member member) {   ///펫정보수정 (마이페이지updateMember2)
    
        int result = 0;
        Connection connection = getConnection();
        result = dao.updateMember2(connection, member);
        if(result > 0) {
            commit(connection);
        } else {
            rollback(connection);
        }
        
        System.out.println("서비스로 넘어온값"+member); //잘찍힘
        close(connection);
        
        return result;
    }

    
    
    public int delete(int no) {   //  회탈탈퇴로직
		Connection connection = getConnection();
		int result = dao.updateStatus(connection, no, "N");
		
		if(result > 0) {
			commit(connection);
		} else {
			rollback(connection);
		}
		
		close(connection);
		
		return result;
	}


    
    
    public int updatePassword(int no, String password) { //비밀번호 변경
        Connection connection = getConnection();
        int result = dao.updatePassword(connection, no, password);
        
        if(result > 0) {
            commit(connection);
        } else {
            rollback(connection);
        }
        
        close(connection);
        
        return result;
    }
    
    
    
    
    public boolean isDuplicated(String userId) {  //아이디중복
        Connection conn = getConnection();
        
        Member member = dao.findMemberById(conn, userId);
        
        close(conn);
        
        return member != null;
    }




  
    public Member findMemberById(String id) {  
        Connection connection = getConnection();        
        
        Member member = dao.findMemberById(connection, id);
        
        close(connection);
                
        return member;
    }


	public Member findId(String userEmail, String userName) {
		Connection connection = getConnection();
		Member member = dao.findId(connection, userEmail);
		close(connection);
		
		if(member != null && member.getName().equals(userName)) {
			return member;
		}
		else {
			return null;
		}
	}

	public Member findPwd(String userEmail, String userId) {
		Connection connection = getConnection();
		Member member = dao.findPwd(connection, userId);
		close(connection);
		
		if(member != null && member.getEmail().equals(userEmail)) {
			return member;
		}
		else {
			return null;
		}
	}

	public int updateDelivery(String userId, String userPwd) {
		Connection connection = getConnection();
		int result = dao.updateDelivery(connection, userId, userPwd);
		
		if(result > 0) {
			commit(connection);
		}
		else {
			rollback(connection);
		}
		
		close(connection);
		
		return result;
	}

	public int cancelDelivery(String userId, String userPwd) {
		Connection connection = getConnection();
		int result = dao.cancelDelivery(connection, userId, userPwd);
		
		if(result > 0) {
			commit(connection);
		}
		else {
			rollback(connection);
		}
		
		close(connection);
		
		return result;
	
	}


	
}



	


	










