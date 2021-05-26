
package com.kh.mvc.member.model.dao;


import java.sql.Connection;
import java.sql.Date;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import static com.kh.mvc.common.jdbc.JDBCTemplate.*;
import com.kh.mvc.member.model.vo.Member;

public class MemberDAO {

	public Member findMemberById(Connection connection, String userId) {
		Member member = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String query = null;
		
		try {
			query = "SELECT * FROM MEMBER WHERE ID=? AND STATUS='Y'";
			pstmt = connection.prepareStatement(query);
			pstmt.setString(1, userId);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				member = new Member();
				
				member.setNo(rs.getInt("NO"));
				member.setId(rs.getString("ID"));
				member.setRole(rs.getString("ROLE"));
				member.setEmail(rs.getString("EMAIL"));
				member.setPassword(rs.getString("PASSWORD"));
				member.setName(rs.getString("NAME"));
				member.setPhone(rs.getString("PHONE"));
				member.setNickName(rs.getString("NICKNAME"));
				member.setGender(rs.getString("GENDER"));
				member.setAge(rs.getInt("AGE"));
				member.setAddress(rs.getString("ADDRESS"));
				member.setEnrollDate(rs.getDate("ENROLLDATE"));
				member.setModifyDate(rs.getDate("MODIFYDATE"));
				member.setRegular_delivery(rs.getString("REGULAR_DELIVERY"));
				member.setPetName(rs.getString("PETNAME"));
				member.setPetBirth(rs.getString("PETBIRTH"));
				member.setPetType(rs.getString("PETTYPE"));
				member.setPetSort(rs.getString("PETSORT"));
				member.setPetGender(rs.getString("PETGENDER"));
				member.setPetNeutralization(rs.getString("PETNEUTRALIZATION"));
				member.setPetConcern(rs.getString("PETCONCERN"));
				
				//member.setPetConcern(rs.getString("EmailAgree"));
				//member.setPetConcern(rs.getString("SmsAgree"));
	
	
				
	       
	       
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rs);
			close(pstmt);
		}
		
		return member;
	}

	
	//회원가입
    public int insertMember(Connection connection, Member member) {
        int result = 0;
        PreparedStatement pstmt = null;
       
        String query = null;
        
        System.out.println("DAO의 Connection : " + connection);
        System.out.println("DAO의 member : " + member);
        
        try {
            query = "INSERT INTO MEMBER "
            		+ "(NO, ID, ROLE, EMAIL, PASSWORD, NAME, PHONE, NICKNAME, GENDER, AGE, ADDRESS, ENROLLDATE, MODIFYDATE, REGULAR_DELIVERY, STATUS, "
            		+ "PETNAME, PETBIRTH, PETTYPE, PETSORT, PETGENDER, PETNEUTRALIZATION, PETCONCERN, EMAILAGREE, SMSAGREE, TERMS1, TERMS2)"
            		+ "VALUES"
            		+ "(SEQ_UNO.NEXTVAL, ?, DEFAULT, ?, ?, ?, ?, ?, ?, ?, ?, DEFAULT, DEFAULT, DEFAULT, DEFAULT, "
            		+ "?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
            		
            pstmt = connection.prepareStatement(query);
            
            pstmt.setString(1, member.getId());
            pstmt.setString(2, member.getEmail());
            pstmt.setString(3, member.getPassword());
            pstmt.setString(4, member.getName());
            pstmt.setString(5, member.getPhone());
            pstmt.setString(6, member.getNickName());
            pstmt.setString(7, member.getGender());    
            pstmt.setInt(8, member.getAge());
            pstmt.setString(9, member.getAddress());
       
            pstmt.setString(10, member.getPetName());
            pstmt.setString(11, member.getPetBirth());
            pstmt.setString(12, member.getPetType());
            pstmt.setString(13, member.getPetSort());
            pstmt.setString(14, member.getPetGender());
            pstmt.setString(15, member.getPetNeutralization());
            pstmt.setString(16, member.getPetConcern());
          //  System.out.println("E넘어온값:"+member.getEmailAgree());
           // System.out.println("S넘어온값:"+member.getSmsAgree());
           // pstmt.setString(17, member.getEmailAgree());
           // pstmt.setString(18, member.getSmsAgree());
            if (member.getEmailAgree()==null) {
            	pstmt.setString(17, "N");
			}
            else {
            	pstmt.setString(17, member.getEmailAgree());
            }
            if (member.getSmsAgree()==null) {
            	pstmt.setString(18, "N");
			}
            else {
            	pstmt.setString(18, member.getSmsAgree());
            }
            
            
            pstmt.setString(19, member.getTerms1());
            pstmt.setString(20, member.getTerms2());
   
            
            result = pstmt.executeUpdate();
            
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            close(pstmt);
        }
        
        return result;
    }
    //마이페이지 정보 수정
    public int updateMember(Connection connection, Member member) {
        int result = 0;
        PreparedStatement pstmt = null;
        String query = null;
        
        try {
            query = "UPDATE MEMBER SET PHONE=?, GENDER=?,NICKNAME=?,EMAIL=?,ADDRESS=?,MODIFYDATE=SYSDATE WHERE NO=?";
            pstmt = connection.prepareStatement(query);
           
            pstmt.setString(1, member.getPhone());
            pstmt.setString(2, member.getGender());
            pstmt.setString(3, member.getNickName());
            pstmt.setString(4, member.getEmail());
            pstmt.setString(5, member.getAddress());
            pstmt.setInt(6,member.getNo());
     
            System.out.println("update될값: "+ member);
              
            result = pstmt.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            close(pstmt);
        }
        
        return result;
    }
    
    /////////////////////마이페이지 펫정보수정
	public int updateMember2(Connection connection, Member member) { 
        int result = 0;
        PreparedStatement pstmt = null;
        String query = null;
        
        try {
            query = "UPDATE MEMBER SET PETNAME=?,PETBIRTH=?, PETTYPE=?, PETSORT=?,PETGENDER=?,PETNEUTRALIZATION=?,PETCONCERN=?,MODIFYDATE=SYSDATE WHERE NO=?";
            pstmt = connection.prepareStatement(query);
           
     
            pstmt.setString(1, member.getPetName());
            pstmt.setString(2, member.getPetBirth());
            pstmt.setString(3, member.getPetType());
            pstmt.setString(4, member.getPetSort());
            pstmt.setString(5, member.getPetGender());
            pstmt.setString(6, member.getPetNeutralization());
            pstmt.setString(7, member.getPetConcern());
            pstmt.setInt(8,member.getNo());
            
           
            //System.out.println("update될값: "+ member);
            
            result = pstmt.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            close(pstmt);
        }
        
        return result;
  
}
	////////////////////////////////회원탈퇴 로직 
	public int updateStatus(Connection connection, int no, String status) { 
		 int result = 0;
	        PreparedStatement pstmt = null;
	        String query = null;
	        
	        try {
	            query = "UPDATE MEMBER SET STATUS =? WHERE NO=?"; 
	            pstmt = connection.prepareStatement(query);
	           
	            pstmt.setString(1, status);
	            pstmt.setInt(2, no);
	 
	              
	            result = pstmt.executeUpdate();
	        } catch (SQLException e) {
	            e.printStackTrace();
	        } finally {
	            close(pstmt);
	        }
	        
	        return result;
		
	
		
	}
	
	

	///////////////////////////////비밀번호 변경	
    public int updatePassword(Connection connection, int no, String password) {
        int result = 0;
        PreparedStatement pstmt = null;
        String query = null;
        
        try {
            query = "UPDATE MEMBER SET PASSWORD=? WHERE NO=?";
            pstmt = connection.prepareStatement(query);
            
            pstmt.setString(1, password);
            pstmt.setInt(2, no);
            
            result = pstmt.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            close(pstmt);
        }
        
        return result;
    }
    
    
	public Member findId(Connection connection, String userEmail) {
		Member member = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String query = null;
		
		try {
			query = "SELECT * FROM MEMBER WHERE EMAIL=? AND STATUS='Y'";
			pstmt = connection.prepareStatement(query);
			pstmt.setString(1, userEmail);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				member = new Member();
				
				member.setId(rs.getString("ID"));
				member.setRole(rs.getString("ROLE"));
				member.setEmail(rs.getString("EMAIL"));
				member.setPassword(rs.getString("PASSWORD"));
				member.setName(rs.getString("NAME"));
				member.setPhone(rs.getString("PHONE"));
				member.setNickName(rs.getString("NICKNAME"));
				member.setGender(rs.getString("GENDER"));
				member.setAge(rs.getInt("AGE"));
				member.setAddress(rs.getString("ADDRESS"));
				member.setEnrollDate(rs.getDate("ENROLL_DATE"));
				member.setModifyDate(rs.getDate("MODIFY_DATE"));
				member.setRegular_delivery(rs.getString("REGULAR_DELIVERY"));
				member.setStatus(rs.getString("STATUS"));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rs);
			close(pstmt);
		}
		
		return member;
	}

	public Member findPwd(Connection connection, String userId) {
		Member member = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String query = null;
		
		try {
			query = "SELECT * FROM MEMBER WHERE ID=? AND STATUS='Y'";
			pstmt = connection.prepareStatement(query);
			pstmt.setString(1, userId);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				member = new Member();
				
				member.setId(rs.getString("ID"));
				member.setRole(rs.getString("ROLE"));
				member.setEmail(rs.getString("EMAIL"));
				member.setPassword(rs.getString("PASSWORD"));
				member.setName(rs.getString("NAME"));
				member.setPhone(rs.getString("PHONE"));
				member.setNickName(rs.getString("NICKNAME"));
				member.setGender(rs.getString("GENDER"));
				member.setAge(rs.getInt("AGE"));
				member.setAddress(rs.getString("ADDRESS"));
				member.setEnrollDate(rs.getDate("ENROLL_DATE"));
				member.setModifyDate(rs.getDate("MODIFY_DATE"));
				member.setRegular_delivery(rs.getString("REGULAR_DELIVERY"));
				member.setStatus(rs.getString("STATUS"));
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rs);
			close(pstmt);
		}
		
		return member;
	}

	// regular_delivery값 변경 
	public int updateDelivery(Connection connection, String userId, String userPwd) {
		int result = 0;
		PreparedStatement pstmt = null;
		String query = null;
			
		try {
			query = "UPDATE MEMBER SET REGULAR_DELIVERY = 'Y' WHERE ID=? AND PASSWORD=?";
			pstmt = connection.prepareStatement(query);
				
			pstmt.setString(1, userId);
			pstmt.setString(2, userPwd);
				
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
			
		return result;
	}

	public int cancelDelivery(Connection connection, String userId, String userPwd) {
		int result = 0;
		PreparedStatement pstmt = null;
		String query = null;
			
		try {
			query = "UPDATE MEMBER SET REGULAR_DELIVERY = 'N' WHERE ID=? AND PASSWORD=?";
			pstmt = connection.prepareStatement(query);
				
			pstmt.setString(1, userId);
			pstmt.setString(2, userPwd);
				
			result = pstmt.executeUpdate();
				
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
			
		return result;
	}





	
}