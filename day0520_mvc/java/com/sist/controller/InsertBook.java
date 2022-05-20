package com.sist.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.sist.dao.BookDAO;
import com.sist.vo.BookVO;

/**
 * Servlet implementation class InsertBook
 */
@WebServlet("/InsertBook")
public class InsertBook extends HttpServlet {
	
	//멤버에 bookdao 선언
	BookDAO dao;
	
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public InsertBook() {
        super();
        // TODO Auto-generated constructor stub
        //생성자에서 dao를 생성
        dao = new BookDAO();
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int bookid = dao.getNextBookId();
		request.setAttribute("bookid", bookid);
		RequestDispatcher dispatcher = request.getRequestDispatcher("insertBook.jsp");
		dispatcher.forward(request, response);
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		request.setCharacterEncoding("utf-8");
		int bookid = Integer.parseInt(request.getParameter("bookid"));
		String bookname = request.getParameter("bookname");
		String publisher = request.getParameter("publisher");
		int price = Integer.parseInt(request.getParameter("price"));
		
		BookVO b = new BookVO(bookid, bookname, publisher, price);
		
		int re = dao.insertBook(b);
		String msg = "";
		if(re == 1) {
			msg = "도서 등록에 성공하였습니다.";
		} else {
			msg = "도서 등록에 실패하였습니다.";
		}
		request.setAttribute("msg", msg);
		
		RequestDispatcher dispatcher = request.getRequestDispatcher("insertBookOK.jsp");
		dispatcher.forward(request, response);
	
	}

}
