package com.kh.mvc.coupon.model.service;

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

import java.sql.Connection;
import java.sql.Date;
import java.util.ArrayList;

import com.kh.mvc.coupon.model.dao.CouponDao;
import com.kh.mvc.coupon.model.vo.Coupon;


public class CouponService {
	
	
	/**산
	 * 통합관리자- 쿠폰리스트 조회용 서비스
	 * @return : 조회된 Coupon객체가 담긴 ArrayList
	 */
	public ArrayList<Coupon> selectCouponList(){
		
		Connection conn = getConnection();
		ArrayList<Coupon> list = new CouponDao().selectCouponList(conn);
		
		close(conn);
		return list;
		
	}
	
	
	
	/**산
	 * 통합관리자- 쿠폰명 검색 서비스
	 * @param searchName : 검색할 쿠폰명(키워드)
	 * @return : 조회된 Coupon객체가 담긴 ArrayList
	 */
	public ArrayList<Coupon> searchName(String searchName){
		
		Connection conn = getConnection();
		ArrayList<Coupon> list = new CouponDao().searchName(conn,searchName);
		
		close(conn);
		return list;
		
	}
	
	
	
	/**산
	 * 통합관리자- 쿠폰 기간별 조회 서비스
	 * @param startDate : 조회할 쿠폰기간 시작날짜
	 * @param endDate : 조회할 쿠폰기간 끝날짜
	 * @return : 조회된 Coupon객체가 담긴 ArrayList
	 */
	public ArrayList<Coupon> searchDate(Date startDate,Date endDate){
		Connection conn = getConnection();
		ArrayList<Coupon> list = new CouponDao().searchDate(conn,startDate,endDate);
		
		close(conn);
		return list;
	}
	
	
	/**산
	 * 통합관리자- 쿠폰 등록 서비스
	 * @param newC : 등록할 쿠폰 정보가 담긴 Coupon객체
	 * @return : 처리된 행의개수
	 */
	public int insertCoupon(Coupon newC) {
		
		Connection conn = getConnection();
		int result = new CouponDao().insertCoupon(conn,newC);
		
		if(result>0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		
		return result;
	}
	
	/**산
	 * 통합관리자- 선택쿠폰 삭제 서비스
	 * @param arr : 삭제할 쿠폰번호들이 담긴 int 배열
	 * @return : 처리된 행의 개수
	 */
	public int deleteCoupon(String cArr) {
		
		Connection conn = getConnection();
		int result = new CouponDao().deleteCoupon(conn,cArr);
		
		if(result>0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		close(conn);
		
		return result;
	}
	
	
	/**산
	 * 통합-쿠폰관리 쿠폰발송
	 * @param mList : 쿠폰을 발송할 회원번호가 담긴 String 배열
	 * @param cList : 발송할 쿠폰번호가 담긴 String 배열
	 * @return : 처리된 행의 개수
	 */
	public int sendCoupon(String[] mList,String[] cList) {
		Connection conn = getConnection();
		int result = new CouponDao().sendCoupon(conn,mList,cList);
		
		if(result>0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		close(conn);
		
		return result;
	}
}
