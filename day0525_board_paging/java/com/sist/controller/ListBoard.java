package com.sist.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.sist.dao.BoardDAO;
import com.sist.vo.BoardVO;

/**
 * Servlet implementation class ListBoard
 */
@WebServlet("/ListBoard")
public class ListBoard extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ListBoard() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		//일단 1페이지라고 설정
		int pageNUM = 1;
				
		//pagenum이 넘어온 후에 null이 아니면 페이지 수 출력
		if(request.getParameter("pageNUM") != null) {
			pageNUM = Integer.parseInt(request.getParameter("pageNUM"));
		}
		
		BoardDAO dao = new BoardDAO();
		ArrayList<BoardVO> list = dao.listBoard(pageNUM);
		
		
		request.setAttribute("list", list); 
		request.setAttribute("totalPage", dao.totalPage);
		
		String viewPage = "listBoard.jsp";
		RequestDispatcher dispatcher = request.getRequestDispatcher(viewPage);
		
		//상태를 유지하고 forward
		dispatcher.forward(request, response);
				
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
