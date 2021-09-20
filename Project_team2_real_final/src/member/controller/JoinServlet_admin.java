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
 * Servlet implementation class JoinServlet
 */
@WebServlet("/join_admin.do")
public class JoinServlet_admin extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public JoinServlet_admin() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		//response.getWriter().append("Served at: ").append(request.getContextPath());
		RequestDispatcher dispatcher=request.getRequestDispatcher("admin/member/JoinForm_admin.jsp");
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
		
		
		MemVO mvo=new MemVO();
		mvo.setId(id);
		mvo.setPassword1(password1);
		mvo.setPassword2(password2);
		mvo.setName(name);
		mvo.setEmail(email);
		mvo.setPhone(phone);
		
		MemDAO mdao=MemDAO.getInstance(); // 객체 생성 다름(private=>static은 클래스.메소드 해서 불러온다)/ 메소드를 쓰기위해 객체생성
		int result=mdao.insertMember(mvo);
		
		HttpSession session=request.getSession(); //브라우저 닫을 때 까지 존재
		
		if(result == 1) {
			session.setAttribute("id",mvo.getId());
			request.setAttribute("message","회원 가입에 성공했습니다");
		}else {
			request.setAttribute("message","회원 가입에 실패했습니다");
		}
		
		//RequestDispatcher dispatcher=request.getRequestDispatcher("index.jsp?pageChange=MemberList_admin.jsp");
		RequestDispatcher dispatcher=request.getRequestDispatcher("admin/MemberJoinResult_admin.jsp"); // 회원 리스트를 바로 보기 위한 방법
		dispatcher.forward(request, response); //forward이용해 login.jsp로 보내겠다
		
		//response.sendRedirect("main.jsp");
	}

}
