package com.kh.mvc.board.controller;

import java.io.BufferedInputStream;
import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.net.URLEncoder;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/board/fileDown")
public class BoardFileDownServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public BoardFileDownServlet() {
    }

    @Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    	String oriname = request.getParameter("oriname");
    	String rename = request.getParameter("rename");
    	
    	System.out.println("oriname : " + oriname + ", rename : " + rename);
    	
    	// 1. 전송할 파일에 대한 경로와 파일명을 가져온다.
    	String path = getServletContext().getRealPath("/resources/upload/board");
    	String file = path + "/" + rename;
    	
    	// 2. 물리적인 저장소에 있는 파일을 메모리로 가져온다.
    	File downFile = new File(file);
    	
    	// 3. 메모리로 가져온 파일에 입력 스트림을 연결
    	BufferedInputStream bis = new BufferedInputStream(new FileInputStream(downFile));
    	
    	// 4. 클라이언트로 내보낼 출력 스트림을 연결
    	BufferedOutputStream bos = new BufferedOutputStream(response.getOutputStream());
    	
    	// 5. 브라우저별 인코딩 처리
    	// * 브라우저에 따라서 인코딩 방식이 다르기 때문에 파일명에 대한 인코딩 처리를 해야 한다.
    	String downName = null;
    	String header = request.getHeader("user-agent");
    	boolean isMSIE = header.indexOf("MSIE")!=-1||header.indexOf("Trident")!=-1;
    	 //헤더가 MSIE를 포함하고 있거나 Trident를 포함하고 있으면(-1이 아님 : 존재함) = true 문자열의 시작 index를 return : 존재함 : 0보다 크거나 같음
    	 // 지정하는 문자열이 없으면 -1을 리턴 (-1이 아님 : 내가 지정한 문자열 안에 해당 문자가 존재한다.)
    	
    	System.out.println(header);
    	
    	if (isMSIE) {
    		downName=URLEncoder.encode(oriname,"UTF-8").replaceAll("\\+", "%20");
    				//자바에서 제공. 공백 %20인데 얘를통해 인코딩하면 공백이 \\+로 들어가있음. 이걸 %20으로 바꾸겠다.
    	}else {
        	downName = new String(oriname.getBytes("UTF-8"),"ISO-8859-1");
    	}
    	
    	
    	// 응답 메세지 작성
    	// html(X) / file(O)
    	// octec-stream은 8비트로 된 데이터를 뜻한다.
    	response.setContentType("application/octec-stream");
    	// 파일 링크를 클릭했을 때 다운로드 화면이 출력되게 처리하는 부분
    	response.setHeader("Content-Disposition", "attachment;filename=" + downName);
    	
    	// 파일 출력(전송) 하기
    	int read = -1;
    	
    	while ((read = bis.read()) != -1) {
    		bos.write(read);
    	}
    	
    	bos.close();
    	bis.close();    	
	}

}