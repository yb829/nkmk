package com.kh.mvc.product.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.kh.mvc.common.util.FileRename;
import com.kh.mvc.member.model.vo.Member;
import com.kh.mvc.product.model.service.ProductService;
import com.kh.mvc.product.model.vo.Product;
import com.oreilly.servlet.MultipartRequest;

@WebServlet(name="productEnroll", urlPatterns="/product/enroll")
public class ProductEnrollServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
   
	private ProductService service = new ProductService();
	
    public ProductEnrollServlet() {
    	
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String viewName = "/views/product/enroll.jsp";
		HttpSession session = request.getSession(false);
		Member loginMember = session != null ? (Member)session.getAttribute("loginMember") : null;
		
		if(loginMember == null) {
    		// 로그인 되어있지 않았다고 메시지 보내기
			viewName = "/views/common/msg.jsp";
    		request.setAttribute("msg", "로그인 후 사용할 수 있습니다.");
    		request.setAttribute("location", "/member/login");
		}
		
		request.getRequestDispatcher(viewName).forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		// 파일이 저장될 경로
    	String path = getServletContext().getRealPath("/resources/upload/product");
    	
    	// 파일의 사이즈 지정 (10MB)
    	int maxSize = 10485760;
    	
    	// 문자에 대한 인코딩 설정
    	String encoding = "UTF-8";
    	
    	// DefaultFileRenamePolicy
    	//  - 업로드된 파일에 대한 rename 처리
    	//  - 중복되는 이름 뒤에 0 ~ 9999 붙인다.
//    	MultipartRequest mr = new MultipartRequest(request, path, maxSize, encoding, new DefaultFileRenamePolicy());
    	MultipartRequest mr = new MultipartRequest(request, path, maxSize, encoding, new FileRename());
    	
    	//클라이언트 폼 파라미터로 넘어온 값들(파일에 대한 정보는 없음)
    	String prodCatNo = mr.getParameter("prodCatNo");
    	String prodName = mr.getParameter("prodName");
    	int price = Integer.parseInt(mr.getParameter("price"));
    	int prodAmount = Integer.parseInt(mr.getParameter("prodAmount"));
    	String prodRegularDeliveryAttr = mr.getParameter("prodRegularDeliveryAttr");
    	String prodContents = mr.getParameter("prodContents");
		
    	// 파일에 대한 정보를 가져올 때
    	String originalFileName = mr.getOriginalFileName("prodIMG");
    	String renamedFileName = mr.getFilesystemName("prodIMG");
    	
    	// 로그인 안된 사용자나 다른 사용자가 접근해서 게시글 작성이 불가능하도록 체크하는 로직
    	HttpSession session = request.getSession(false);
    	Member loginMember = session != null ? (Member)session.getAttribute("loginMember") : null;
    	
    	if(loginMember != null) {
    		if(loginMember.getId().equals("admin")) {
    			Product product = new Product();
    			
    			product.setProductCatNo(prodCatNo);
    			product.setProductName(prodName);
    			product.setPrice(price);
    			product.setProductAmount(prodAmount);
    			product.setOriginalFileName(originalFileName);
    			product.setRenamedFileName(renamedFileName);
    			product.setRegularDeliveryAttr(prodRegularDeliveryAttr);
    			product.setProductContents(prodContents);
    			
    			int result = service.save(product);
    			
    			System.out.println(product);
    			
    			if(result > 0) {
             		request.setAttribute("msg", "상품 등록 성공");
             		request.setAttribute("location", "/");
    			} else {
             		request.setAttribute("msg", "상품 등록 실패");
             		request.setAttribute("location", "/");
    			}
    		} else {
         		request.setAttribute("msg", "잘못된 접근 입니다.");
         		request.setAttribute("location", "/board/list");
    		}
    	} else {
     		request.setAttribute("msg", "로그인 후 사용할 수 있습니다.");
     		request.setAttribute("location", "/");
    	}
    	
    	request.getRequestDispatcher("/views/common/msg.jsp").forward(request, response);
	}

}
