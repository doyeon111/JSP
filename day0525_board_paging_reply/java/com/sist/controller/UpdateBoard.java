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
		
		//�̹����� �ǰ��
		String path = request.getRealPath("image");
		
		//�� ��ü�� �����ϴ� ���� ���� ���簡 �̷������.
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
		
		//���ε��� ������ ���� ���� �ְ� ���� ���� �ְ�
		//���ε��� ������ ������ �� ������ vo�� ��� �׷��� ������ ���������� vo�� ��ƿ�.
		String fname = multi.getOriginalFileName("fname"); //���ε��� ����
		
		
		if(fname != null && !fname.equals("")) {
			b.setFname(fname);
		} else {
			b.setFname(oldFname);
		}
		
		BoardDAO dao = new BoardDAO();
		int re = dao.updateBoard(b);
		
		//������ �����ߴ�?
		if(re == 1) {
			//���ε��� ������ ������ ���ϵ� ����
			if(fname != null && !fname.equals("") && oldFname != null && !oldFname.equals("")) {
				//���� ������ �����ϴ� �ڵ�
				File file = new File(path + "/" + oldFname);
				file.delete();
				
			}
			
			response.sendRedirect("ListBoard");
		} else {
			if(fname != null && !fname.equals("")) {
				File file = new File(path + "/" + fname);
				file.delete();
			}
			
			request.setAttribute("msg", "�Խù� ������ �����Ͽ����ϴ�.");
			RequestDispatcher dispatcher = request.getRequestDispatcher("error.jsp");
			dispatcher.forward(request, response);
		}
	}

}
