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
		int no = 0;
		//�Ϲ������δ� �����ۼ����� ������ ����
		String title = "���� �ۼ�";
		
		
		if(request.getParameter("no") != null) {
			//��� �ۼ� �� �θ��� ��ȣ�� ������.
			no = Integer.parseInt(request.getParameter("no"));
			//����ۼ� �� ������ ����ۼ����� ����
			title = "��� �ۼ�";
		}
		
		request.setAttribute("no", no);
		request.setAttribute("title", title);
		
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
		
		
		//�ϴ� �����̶�� ���� ó���Ѵ�.
		int no = dao.getNextNo();
		int b_ref = no;
		int b_step = 0;
		int b_level = 0;
		
		
		//���࿡ ����̶��
		int pno = Integer.parseInt(multi.getParameter("no"));
		if(pno != 0) {
			BoardVO p = dao.getBoard(pno);
			b_ref = p.getB_ref();
			b_step = p.getB_step();
			b_level = p.getB_level();
			
			//�̹� �޷��ִ� ��۵��� b_step�� 1�� ������Ų��.
			dao.updateStep(b_ref, b_step);
			
			b_step++;
			b_level++;
		}
		
		b.setNo(no);
		b.setB_ref(b_ref);
		b.setB_step(b_step);
		b.setB_level(b_level);
		
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
