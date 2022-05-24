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
import com.sist.dao.GoodsDAO;
import com.sist.vo.GoodsVO;

/**
 * Servlet implementation class InsertGoods
 */
@WebServlet("/InsertGoods")
public class InsertGoods extends HttpServlet {
	GoodsDAO dao;
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public InsertGoods() {
        super();
        // TODO Auto-generated constructor stub
        dao = new GoodsDAO();
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int no = dao.getNextNo();
		request.setAttribute("no", no);
		RequestDispatcher dispatcher = request.getRequestDispatcher("insertGoods.jsp");
		dispatcher.forward(request, response);
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		String path = request.getRealPath("image");
		System.out.println(path);
		
		MultipartRequest multi = new MultipartRequest(request, 
				path, //파일을 저장할 경로
				1024*1024*5, //파일의 최대 크기
				"utf-8", 	//인코딩 방식
				new DefaultFileRenamePolicy());
		
		String item = multi.getParameter("item");
		int qty = Integer.parseInt(multi.getParameter("qty"));
		int price = Integer.parseInt(multi.getParameter("price"));
		
		String fname = multi.getOriginalFileName("fname");
		
		GoodsVO g = new GoodsVO();
		g.setItem(item);
		g.setQty(qty);
		g.setPrice(price);
		g.setFname(fname);
		
		
		int re = dao.insertGoods(g);
		
		request.setAttribute("re", re);
		
//		if(re == 1) {
//			request.setAttribute("msg", "상품 등록을 성공");
//		} else {
//			request.setAttribute("msg", "상품등록을 실패");
//		}
		
		
		if(re != 1) {
			File file = new File(path + "/" + fname);
			file.delete();
		}
		
		String viewPage = "insertGoodsOK.jsp";
		
		
		RequestDispatcher dispatcher = request.getRequestDispatcher(viewPage);
		dispatcher.forward(request, response);
		
		
	}

}
