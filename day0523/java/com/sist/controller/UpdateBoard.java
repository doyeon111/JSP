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
		//������ �Խù���ȣ�� �޾ƿ´�.
		int no = Integer.parseInt(request.getParameter("no"));
		
		//�� �Խù� ��ȣ�� �����ϴ� �Խù� ������ dao�� �޾ƿ´�.
		BoardVO b = dao.getBoard(no);
		
		//�̰��� ���������Ѵ�.
		request.setAttribute("b", b);
		
		//������ ���������� �̵�
		String viewPage = "updateBoard.jsp";
		
		RequestDispatcher dispatcher = request.getRequestDispatcher(viewPage);
		dispatcher.forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		int no = Integer.parseInt(request.getParameter("no"));
		String pwd = request.getParameter("pwd");
		String title = request.getParameter("title");
		String content = request.getParameter("content");
		
		BoardVO b = new BoardVO();
		b.setNo(no);
		b.setPwd(pwd);
		b.setTitle(title);
		b.setContent(content);
		
		BoardDAO dao = new BoardDAO();
		int re = dao.updateBoard(b);
		
		if(re == 1) {
			response.sendRedirect("ListBoard");
		} else {
			request.setAttribute("msg", "�Խù� ������ �����Ͽ����ϴ�.");
			RequestDispatcher dispatcher = request.getRequestDispatcher("error.jsp");
			dispatcher.forward(request, response);
		}
	}

}
