package com.kh.mvc.product.controller;

import java.io.File;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.kh.mvc.product.model.service.ProductService;
import com.kh.mvc.product.model.vo.Product;
import com.kh.mvc.common.util.Category;
import com.kh.mvc.common.util.FileRename;
import com.oreilly.servlet.MultipartRequest;

@WebServlet("/product/update")
public class ProductUpdateServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	private ProductService service = new ProductService();
	
	public ProductUpdateServlet() {

	}

	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String categoryNo = request.getParameter("categoryNo");
		Category a = new Category(categoryNo);
		Product product = service.findProductByNo(a.getCategory(), true);

		// 요청이 forward - jsp로 데이터 전달
		request.setAttribute("product", product);
		request.getRequestDispatcher("/views/product/update.jsp").forward(request, response);
	}

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		int result = 0;
		Product product = new Product();
		String path = getServletContext().getRealPath("/resources/upload/product");
		int maxSize = 10485760;
		String encoding = "UTF-8";
		// DefaultFileRenamePolicy
		MultipartRequest mr = new MultipartRequest(request, path, maxSize, encoding, new FileRename());

		// 클라이언트 폼 파라미터로 넘어온 값들(파일에 대한 정보X)
		product.setProductNo(Integer.parseInt(mr.getParameter("productNo")));
		product.setProductCatNo(mr.getParameter("categoryNo"));
		product.setProductName(mr.getParameter("prodName"));
		product.setPrice(Integer.parseInt(mr.getParameter("price")));
		product.setProductAmount(Integer.parseInt(mr.getParameter("prodAmount")));
		product.setProductContents(mr.getParameter("prodContents"));
		product.setOriginalFileName(mr.getParameter("originalFileName"));
		product.setRenamedFileName(mr.getParameter("renameFileName"));
		product.setRegularDeliveryAttr(mr.getParameter("prodRegularDeliveryAttr"));

		// 파일에 대한 정보를 가져올 때
		String originalFileName = mr.getOriginalFileName("reloadIMG");
		String renamedFileName = mr.getFilesystemName("reloadIMG");

		// 새로운 파일 업로드할 때
		// 먼저 원래 있던 파일이 있을 때 (if)
		if (originalFileName != null && !originalFileName.equals("")) {

			String deleteFilePath = path + "/" + product.getRenamedFileName();

			System.out.println(deleteFilePath);
			deleteFile(deleteFilePath);

			product.setOriginalFileName(originalFileName);
			product.setRenamedFileName(renamedFileName);
		}

		result = service.save(product);

		if (result > 0) {
			request.setAttribute("msg", "게시글 수정 성공");
		} else {
			request.setAttribute("msg", "게시글 수정 실패");
		}

		//ㄴㅇㅁㄴㅇㅁㄴㅇ여기도 잘 봐야해요ㅕ~~~~명심 꼮 명심 ~
		/**
		 * ㄴㅇㅁㄴㅇㅁㄴㅇㅁㄴㅇㅁㄴㅇㅁㄴㅇㅁㄴㅇㅁㄴㅇㅁㄴㅇ꼮 잘 ㅗ바ㅗ아 봐봅 바ㅗ바 ㅏㅂㅂ바ㅏ바
		 */
		request.setAttribute("location", "/product/management");
		request.getRequestDispatcher("/views/common/msg.jsp").forward(request, response);

//로그인 체크 로직 구현하기 (스스로)

		/*
		*
		*
		*
		*
		*
		* */
	}

	private void deleteFile(String path) {

		File file = new File(path);

		if (file.exists()) {
			file.delete();
		}

	}

}