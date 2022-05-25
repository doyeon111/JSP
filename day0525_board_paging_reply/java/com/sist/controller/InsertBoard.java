package com.sist.controller;

import java.io.File;
import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;
import com.sist.dao.BoardDAO;
import com.sist.vo.BoardVO;

/**
 * Servlet implementation class InsertBoard
 */
@WebServlet("/InsertBoard")
public class InsertBoard extends HttpServlet {
	
	BoardDAO dao;
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public InsertBoard() {
        super();
        dao = new BoardDAO();
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int no = 0;
		//일반적으로는 새글작성으로 제목을 설정
		String title = "새글 작성";
		
		
		if(request.getParameter("no") != null) {
			//답글 작성 시 부모의 번호를 가져옴.
			no = Integer.parseInt(request.getParameter("no"));
			//답글작성 시 제목을 답글작성으로 설정
			title = "답글 작성";
		}
		
		request.setAttribute("no", no);
		request.setAttribute("title", title);
		
		RequestDispatcher dispatcher = request.getRequestDispatcher("insertBoard.jsp");
		dispatcher.forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		
		//파일 업로드를 위하여 현재 어플리케이션에 생성한 image폴더의 실제경로를 알아온다.
		String path = request.getRealPath("image");
		System.out.println(path);
		
		
		//입력한 데이터를 등록하면 dopost로 옴. 
		//이 객체를 생성한 순간 이 위치에 파일이 복사가 된다.
		//즉, MultipartRequest 객체를 생성하는 순간 파일 복사가 이루어진다.
		MultipartRequest multi = new MultipartRequest(request, 
				path, //파일을 저장할 경로
				1024*1024*5, //파일의 최대 크기
				"utf-8", 	//인코딩 방식
				new DefaultFileRenamePolicy());  //파일중복처리 ==> 중복된 파일이 있으면 객체가 알아서 중복처리해줌.
		
		//나머지 정보들은 multi 객체를 통해서 받아온다.
		String title = multi.getParameter("title");
		String writer = multi.getParameter("writer");
		String pwd = multi.getParameter("pwd");
		String content = multi.getParameter("content");
		
		//String fname = multi.getParameter("fname"); 은 할 수 없다. 파일의 이름이 아닌 내용을 가져오는 것이기 때문에 이렇게 사용할 수 없다.
		//파일의 이름을 받아오기 위해서는 다음의 메소드를 이용한다.
		String fname = multi.getOriginalFileName("fname"); //파일의 내용이 가져와진다.
	
		
		BoardVO b = new BoardVO();
		b.setTitle(title);
		b.setWriter(writer);
		b.setPwd(pwd);
		b.setContent(content);
		b.setFname(fname);
		
		
		//일단 새글이라고 보고 처리한다.
		int no = dao.getNextNo();
		int b_ref = no;
		int b_step = 0;
		int b_level = 0;
		
		
		//만약에 답글이라면
		int pno = Integer.parseInt(multi.getParameter("no"));
		if(pno != 0) {
			BoardVO p = dao.getBoard(pno);
			b_ref = p.getB_ref();
			b_step = p.getB_step();
			b_level = p.getB_level();
			
			//이미 달려있는 답글들의 b_step을 1씩 증가시킨다.
			dao.updateStep(b_ref, b_step);
			
			b_step++;
			b_level++;
		}
		
		b.setNo(no);
		b.setB_ref(b_ref);
		b.setB_step(b_step);
		b.setB_level(b_level);
		
		int re = dao.insertBoard(b);
		
		request.setAttribute("re", re);
		
		//만약 insert가 실패하였다면 해당파일을 삭제하도록 한다.
		if(re != 1) {
			File file = new File(path + "/" + fname);
			file.delete();
		}
		
		String viewPage = "insertBoardOK.jsp";
		
		
		RequestDispatcher dispatcher = request.getRequestDispatcher(viewPage);
		dispatcher.forward(request, response);
	}

}
