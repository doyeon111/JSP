package com.sist.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class InsertMember
 */
@WebServlet("/Insert.do")
public class InsertMember extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public InsertMember() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//response 객체를 통하여 응답방식을 설정합니다.
				response.setContentType("text/html; charset=utf-8");
				
				//response 객체를 통하여 출력스트림을 생성합니다.
				PrintWriter out = response.getWriter();
				
				//스트림을 통해 html를 브라우저에 출력합니다.
				out.print("<html>");
				out.print("<h1>get방식의 요청입니다.</h1>");
				out.print("</html>");
				
				//스트림을 닫아줍니다.
				out.close();
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//response 객체를 통하여 응답방식을 설정합니다.
		response.setContentType("text/html; charset=utf-8");
		
		
		
		
		request.setCharacterEncoding("utf-8");
		String p_id = request.getParameter("p_id");
		String p_pw = request.getParameter("p_pw");
		String p_name = request.getParameter("p_name");
		String p_choice = request.getParameter("p_choice");
		String p_phone1 = request.getParameter("p_phone1");
		String p_phone2 = request.getParameter("p_phone2");
		String p_phone3 = request.getParameter("p_phone3");
		String p_gender = request.getParameter("p_gender");
		String []p_hobby = request.getParameterValues("p_hobby");
		String p_introduction = request.getParameter("p_introduction");
		
		//response 객체를 통하여 출력스트림을 생성합니다.
		PrintWriter out = response.getWriter();
		
		
		//스트림을 통해 html를 브라우저에 출력합니다.
		out.print("<html>");
		out.print("<h1>post방식의 요청입니다.</h1>");
		out.print("아이디:" +p_id+"<br>");
		out.print("암호:" +p_pw+"<br>");
		out.print("이름:" +p_name+"<br>");
		out.print("성별:" +p_gender+"<br>");
		out.print("연락처:" +p_choice+" " +p_phone1+"-"+p_phone2+"-"+p_phone3+"<br>");
		out.print("취미:");
		for(int i=0; i<p_hobby.length; i++) {
			out.print(p_hobby[i]+ " ");
		}
		out.print("<br>");
		out.print("본인소개:"+p_introduction);
		out.print("</html>");
		
		//스트림을 닫아줍니다.
		out.close();
	}

}
