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

import oracle.net.aso.b;

/**
 * Servlet implementation class UpdateBoard
 */
@WebServlet("/UpdateBoard")
public class UpdateBoard extends HttpServlet {
	BoardDAO dao;
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UpdateBoard() {
        super();
        // TODO Auto-generated constructor stub
        dao = new BoardDAO();
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//수정할 게시물번호를 받아온다.
		int no = Integer.parseInt(request.getParameter("no"));
		
		//그 게시물 번호에 대항하는 게시물 정보를 dao에 받아온다.
		BoardVO b = dao.getBoard(no);
		
		//이것을 상태유지한다.
		request.setAttribute("b", b);
		
		//수정할 뷰페이지로 이동
		String viewPage = "updateBoard.jsp";
		
		RequestDispatcher dispatcher = request.getRequestDispatcher(viewPage);
		dispatcher.forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		
		//이미지의 실경로
		String path = request.getRealPath("image");
		
		//이 객체를 생성하는 순간 파일 복사가 이루어진다.
		MultipartRequest multi = new MultipartRequest(request, path, 1024*1024*5, "utf-8", new DefaultFileRenamePolicy());
		
		
		
		int no = Integer.parseInt(multi.getParameter("no"));
		String pwd = multi.getParameter("pwd");
		String title = multi.getParameter("title");
		String content = multi.getParameter("content");
		String oldFname = multi.getParameter("oldFname");
		
		BoardVO b = new BoardVO();
		b.setNo(no);
		b.setPwd(pwd);
		b.setTitle(title);
		b.setContent(content);
		
		//업로드한 사진이 있을 수도 있고 없을 수도 있고
		//업로드한 사진이 있으면 그 사진을 vo에 담고 그렇지 않으면 원래사진을 vo에 담아요.
		String fname = multi.getOriginalFileName("fname"); //업로드한 사진
		
		
		if(fname != null && !fname.equals("")) {
			b.setFname(fname);
		} else {
			b.setFname(oldFname);
		}
		
		BoardDAO dao = new BoardDAO();
		int re = dao.updateBoard(b);
		
		//수정에 성공했니?
		if(re == 1) {
			//업로드한 사진이 있으면 파일도 수정
			if(fname != null && !fname.equals("") && oldFname != null && !oldFname.equals("")) {
				//옛날 사진을 삭제하는 코드
				File file = new File(path + "/" + oldFname);
				file.delete();
				
			}
			
			response.sendRedirect("ListBoard");
		} else {
			if(fname != null && !fname.equals("")) {
				File file = new File(path + "/" + fname);
				file.delete();
			}
			
			request.setAttribute("msg", "게시물 수정에 실패하였습니다.");
			RequestDispatcher dispatcher = request.getRequestDispatcher("error.jsp");
			dispatcher.forward(request, response);
		}
	}

}
