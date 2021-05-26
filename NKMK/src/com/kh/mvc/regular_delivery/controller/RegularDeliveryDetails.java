package com.kh.mvc.regular_delivery.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/regularDelivery/details")
public class RegularDeliveryDetails extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public RegularDeliveryDetails() {
        
    }

	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.getRequestDispatcher("/views/regular_delivery/regular_detail.jsp").forward(request, response);
	}

}
