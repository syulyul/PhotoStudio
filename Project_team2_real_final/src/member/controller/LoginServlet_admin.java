package member.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import member.dao.MemDAO_admin;
import member.dto.MemVO_admin;

/**
 * Servlet implementation class LoginServlet
 */
@WebServlet("/login_admin.do")
public class LoginServlet_admin extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public LoginServlet_admin() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		//response.getWriter().append("Served at: ").append(request.getContextPath());

		String url="member/main.jsp";
		HttpSession session=request.getSession();
		
		if(session.getAttribute("loginAdmin") != null) { // 이미 로그인 된 사용자이면
			url="../admin/index.jsp"; // 메인 페이지로 이동
		}
		
		RequestDispatcher dispatcher=request.getRequestDispatcher(url);
		dispatcher.forward(request, response); 
	}
		
		
	

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		//doGet(request, response);
		
		String url="admin/member/main.jsp";
		String id=request.getParameter("id");
		String pass=request.getParameter("password");		
		MemDAO_admin mdao=MemDAO_admin.getInstance();
		int result=mdao.userCheck(id, pass);
		
		response.setContentType("text/html; charset=UTF-8"); 
		PrintWriter writer = response.getWriter();

		
		if(result == 1) {
			MemVO_admin mvo=mdao.getMember(id);
			HttpSession session=request.getSession();
			session.setAttribute("loginAdmin",mvo);
			/* url="/index.jsp"; */
			url="admin/index.jsp?main.jsp";
			writer.println("<script>alert('로그인에 성공했습니다.'); location.href='"+url+"';</script>"); 
			writer.close();
			
		}else if(result == 0) {
			writer.println("<script>alert('비밀 번호가 일치하지 않습니다.'); window.history.go(-1);</script>"); 
			writer.close();
		}else if(result == -1) {
			writer.println("<script>alert('계정이 존재하지 않습니다.'); window.history.go(-1);</script>"); 
			writer.close();
		}
		
		RequestDispatcher dispatcher=request.getRequestDispatcher(url);
		dispatcher.forward(request, response);
	}
	
	}


