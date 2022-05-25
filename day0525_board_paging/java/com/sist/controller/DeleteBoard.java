package com.sist.controller;

import java.io.File;
import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.sist.dao.BoardDAO;
import com.sist.vo.BoardVO;

/**
 * Servlet implementation class DeleteBoard
 */
@WebServlet("/DeleteBoard")
public class DeleteBoard extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DeleteBoard() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int no = Integer.parseInt(request.getParameter("no"));
		request.setAttribute("no", no);
		RequestDispatcher dispatcher = request.getRequestDispatcher("deleteBoard.jsp");
		dispatcher.forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		int no = Integer.parseInt(request.getParameter("no"));
		String pwd = request.getParameter("pwd");
		BoardDAO dao = new BoardDAO();
		
		//삭제할 시 파일이름을 담아올 수 있다.
		String oldFname = dao.getBoard(no).getFname();
		
		//삭제시키기
		int re = dao.deleteBoard(no, pwd);
		
		if(re == 1) {
			//게시물의 파일이 있었다면(null도 아니고 ""이 아니면)
			if(oldFname != null && !oldFname.equals("")) {
				String path = request.getRealPath("image"); //파일의 경로를 가져옴
				File file = new File(path + "/" + oldFname); 
				file.delete(); //파일삭제
						
			}
			
			response.sendRedirect("ListBoard");
		} else {
			request.setAttribute("msg", "게시물 삭제에 실패하였습니다.");
			RequestDispatcher dispatcher = request.getRequestDispatcher("error.jsp");
			dispatcher.forward(request, response);
		}
	}

}
