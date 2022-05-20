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
		//dao���� list ��� ��û
		CustomerDAO dao = new CustomerDAO();
		ArrayList<CustomerVO> list = dao.listCustomer();
				
		//���� ����
		request.setAttribute("list", list); 
		request.setAttribute("title", "�� ���"); //��������� controller ����
				
				
		//����� ������ . jsp�� �����ش�. (jsp�� �����ֱ� ���� ��ü) request ��ü�� ���Ͽ� ����ó ��ü�� ���� �� �ִ�.
		RequestDispatcher dispatcher = request.getRequestDispatcher("listCustomer.jsp"); //�̵��� view page ��θ� ����.
				
		//���¸� �����ϰ� forward
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
