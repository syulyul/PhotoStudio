package member.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import member.dao.MemDAO;
import member.dto.MemVO;

/**
 * Servlet implementation class MemberUpdateServlet
 */
@WebServlet("/memberUpdate.do")
public class MemberUpdateServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public MemberUpdateServlet() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		// response.getWriter().append("Served at: ").append(request.getContextPath());

		String id = request.getParameter("id");

		MemDAO mdao = MemDAO.getInstance();
		MemVO mvo = mdao.getMember(id);

		request.setAttribute("mvo", mvo);

		RequestDispatcher dispatcher = request.getRequestDispatcher("member/Update.jsp");
		dispatcher.forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		// doGet(request, response);

		request.setCharacterEncoding("UTF-8");

		
		String id = request.getParameter("id");
		String password1 = request.getParameter("password1");
		String password2 = request.getParameter("password2");
		String name = request.getParameter("name");
		String email = request.getParameter("email");
		String phone = request.getParameter("phone");
		// 입력된 정보를 가져와서 String타입으로 저장해두고

		MemVO mvo = new MemVO();
		// 바뀐 정보를 다시 DB에 넣어준다.
		mvo.setId(id);
		mvo.setPassword1(password1);
		mvo.setPassword2(password2);
		mvo.setName(name);
		mvo.setEmail(email);
		mvo.setPhone(phone);

		MemDAO mdao = MemDAO.getInstance();
		mdao.updateMember(mvo);

		response.sendRedirect("main.jsp"); 
	}

}
