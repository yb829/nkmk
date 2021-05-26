package com.kh.mvc.product.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

//import com.kh.mvc.common.util.Category;
import com.kh.mvc.common.util.PageInfo;
import com.kh.mvc.member.model.vo.Member;
import com.kh.mvc.product.model.service.ProductService;
import com.kh.mvc.product.model.vo.Product;


@WebServlet("/product/management")
public class ProductManagementServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	private ProductService service = new ProductService();
	
    public ProductManagementServlet() {
       
    }

	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String viewName = "/views/product/management.jsp";
		HttpSession session = request.getSession(false);
		Member loginMember = session != null ? (Member)session.getAttribute("loginMember") : null;
		
		if(loginMember == null) {
    		// 로그인 되어있지 않았다고 메시지 보내기
			viewName = "/views/common/msg.jsp";
    		request.setAttribute("msg", "로그인 후 사용할 수 있습니다.");
    		request.setAttribute("location", "/member/login");
		}
		
		// 게시물 리스트 조회
    	// 페이징 처리
    	
    	int page = 0;
    	int listCount = 0;
    	PageInfo pageInfo = null;
    	List<Product> list = null;
    	
    	//TEST
    	//Category myCategory = new Category(request.getParameter("myCategory"));
    	
    	try {
    		page = Integer.parseInt(request.getParameter("page"));
    	} catch (NumberFormatException e) {
    		page = 1;
		}
    	
    	listCount = service.getProductCount();
        pageInfo = new PageInfo(page, 10, listCount, 10);
        list = service.getProductList(pageInfo);

    	request.setAttribute("management", list);
    	request.setAttribute("pageInfo", pageInfo);
		
		// 상품 통합 관리 페이지
		request.getRequestDispatcher(viewName).forward(request, response);
		
	}

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		doGet(request, response);
	}

}
