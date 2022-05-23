package com.sist.controller;

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
		int no = dao.getNextNo();
		request.setAttribute("no", no);
		RequestDispatcher dispatcher = request.getRequestDispatcher("insertBoard.jsp");
		dispatcher.forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		String title = request.getParameter("title");
		String writer = request.getParameter("writer");
		String pwd = request.getParameter("pwd");
		String content = request.getParameter("content");
		
		BoardVO b = new BoardVO();
		b.setTitle(title);
		b.setWriter(writer);
		b.setPwd(pwd);
		b.setContent(content);
		
		int re = dao.insertBoard(b);
		
		request.setAttribute("re", re);
		String viewPage = "insertBoardOK.jsp";
		
		
		RequestDispatcher dispatcher = request.getRequestDispatcher(viewPage);
		dispatcher.forward(request, response);
	}

}
