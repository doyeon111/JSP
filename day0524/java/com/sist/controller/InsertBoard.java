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
		
		//���� ���ε带 ���Ͽ� ���� ���ø����̼ǿ� ������ image������ ������θ� �˾ƿ´�.
		String path = request.getRealPath("image");
		System.out.println(path);
		
		
		//�Է��� �����͸� ����ϸ� dopost�� ��. 
		//�� ��ü�� ������ ���� �� ��ġ�� ������ ���簡 �ȴ�.
		//��, MultipartRequest ��ü�� �����ϴ� ���� ���� ���簡 �̷������.
		MultipartRequest multi = new MultipartRequest(request, 
				path, //������ ������ ���
				1024*1024*5, //������ �ִ� ũ��
				"utf-8", 	//���ڵ� ���
				new DefaultFileRenamePolicy());  //�����ߺ�ó�� ==> �ߺ��� ������ ������ ��ü�� �˾Ƽ� �ߺ�ó������.
		
		//������ �������� multi ��ü�� ���ؼ� �޾ƿ´�.
		String title = multi.getParameter("title");
		String writer = multi.getParameter("writer");
		String pwd = multi.getParameter("pwd");
		String content = multi.getParameter("content");
		
		//String fname = multi.getParameter("fname"); �� �� �� ����. ������ �̸��� �ƴ� ������ �������� ���̱� ������ �̷��� ����� �� ����.
		//������ �̸��� �޾ƿ��� ���ؼ��� ������ �޼ҵ带 �̿��Ѵ�.
		String fname = multi.getOriginalFileName("fname"); //������ ������ ����������.
		
		BoardVO b = new BoardVO();
		b.setTitle(title);
		b.setWriter(writer);
		b.setPwd(pwd);
		b.setContent(content);
		b.setFname(fname);
		
		int re = dao.insertBoard(b);
		
		request.setAttribute("re", re);
		
		//���� insert�� �����Ͽ��ٸ� �ش������� �����ϵ��� �Ѵ�.
		if(re != 1) {
			File file = new File(path + "/" + fname);
			file.delete();
		}
		
		String viewPage = "insertBoardOK.jsp";
		
		
		RequestDispatcher dispatcher = request.getRequestDispatcher(viewPage);
		dispatcher.forward(request, response);
	}

}
