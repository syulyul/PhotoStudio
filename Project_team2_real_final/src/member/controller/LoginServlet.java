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

import member.dao.MemDAO;
import member.dto.MemVO;

/**
 * Servlet implementation class LoginServlet
 */
@WebServlet("/login.do")
public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public LoginServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		//response.getWriter().append("Served at: ").append(request.getContextPath());

		String url="member/Login.jsp";
		HttpSession session=request.getSession();
		
		if(session.getAttribute("loginUser") != null) { // 이미 로그인 된 사용자이면
			url="index.jsp"; // 메인 페이지로 이동
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
		response.setContentType("text/html; charset=UTF-8");

		String url="member/Login.jsp";
		String id=request.getParameter("id");
		String pass1=request.getParameter("password1");		
		MemDAO mdao=MemDAO.getInstance();
		int result=mdao.userCheck(id, pass1);
		PrintWriter writer = response.getWriter();

		
		if(result == 1) {
			MemVO mvo=mdao.getMember(id);
			HttpSession session=request.getSession();
			session.setAttribute("loginUser",mvo);
			url="main.jsp";
			writer.println("<script>alert('로그인에 성공했습니다.'); location.href='"+url+"';</script>"); 
			
			writer.close();

		}else if(result == 0) {
			writer.println("<script>alert('비밀 번호가 맞지 않습니다.'); history.go(-1);</script>"); 
			writer.close();
			
		} else /* if(result == -1) */ {
			writer.println("<script>alert('존재하지 않는 회원입니다.'); history.go(-1);</script>"); 
			writer.close();
		}
		
		response.sendRedirect("main.jsp");
		/*
		 * RequestDispatcher dispatcher=request.getRequestDispatcher(url);
		 * dispatcher.forward(request, response);
		 */
		 
	}
	
	}


