package com.kh.mvc.coupon.controller;


import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;	

@WebServlet("/coupon/couponMgCouponList")
public class CouponMgListServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public CouponMgListServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    	request.getRequestDispatcher("/views/coupon/couponMgCouponList.jsp").forward(request, response);

		}
		
		
		
	

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
