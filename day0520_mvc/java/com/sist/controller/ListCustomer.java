package com.sist.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.sist.dao.BookDAO;
import com.sist.dao.CustomerDAO;
import com.sist.vo.BookVO;
import com.sist.vo.CustomerVO;

/**
 * Servlet implementation class ListCustomer
 */
@WebServlet("/ListCustomer")
public class ListCustomer extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ListCustomer() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//dao에게 list 목록 요청
		CustomerDAO dao = new CustomerDAO();
		ArrayList<CustomerVO> list = dao.listCustomer();
				
		//상태 유지
		request.setAttribute("list", list); 
		request.setAttribute("title", "고객 목록"); //여기까지가 controller 역할
				
				
		//결과를 보여줌 . jsp로 보내준다. (jsp로 보내주기 위한 객체) request 객체를 통하여 디스패처 객체를 만들 수 있다.
		RequestDispatcher dispatcher = request.getRequestDispatcher("listCustomer.jsp"); //이동할 view page 경로를 써줌.
				
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
