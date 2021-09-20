package member.controller;

import java.io.IOException;

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
 * Servlet implementation class memberDeleteServlet
 */
@WebServlet("/memberDelete.do")
public class MemberDeleteServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MemberDeleteServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		//response.getWriter().append("Served at: ").append(request.getContextPath());
	
		
		String id=request.getParameter("id");
		
		MemDAO mdao=MemDAO.getInstance();
		MemVO mvo=mdao.getMember(id);
		
		request.setAttribute("mvo", mvo);
		
		RequestDispatcher dispatcher=request.getRequestDispatcher("member/Delete.jsp");
		dispatcher.forward(request, response);
	}
	
	

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		//doGet(request, response);
		
		request.setCharacterEncoding("UTF-8");
		
		String id=request.getParameter("id");
		String password1=request.getParameter("password1");
		String password2=request.getParameter("password2");
		String name=request.getParameter("name"); 
		String email=request.getParameter("email");
		String phone=request.getParameter("phone");
		
		MemDAO mdao = MemDAO.getInstance();
		MemVO mvo=new MemVO();
		
			mvo.setId(id);
			mvo.setPassword1(password1);
			mvo.setPassword2(password2);
			mvo.setName(name);
			mvo.setEmail(email);
			mvo.setPhone(phone);
			
			/*
			mvo.setPassword1(password1);
			mvo.setPassword2(password2);
			mvo.setName(name);
			mvo.setEmail(email);
			mvo.setPhone(phone);
			*/
			
			mdao.deleteMember(id);

			HttpSession session=request.getSession();
			session.invalidate();
			
			response.sendRedirect("main.jsp");
		
	}

}
	


	


