package web01.src;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class UserServlet
 */
@WebServlet("/user")
public class UserServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		MemberDAO dao = new MemberDAO();
		HttpSession session = request.getSession(false);
		String addr = request.getParameter("info");
		String id = (String) session.getAttribute("id");
		String pw = (String) session.getAttribute("pw");
		System.out.println(id+" "+pw);
		request.setAttribute("id", id);
		request.setAttribute("pw", pw);
		if(addr != null && addr.equals("page")) {
			RequestDispatcher dispatch = request.getRequestDispatcher("user_page");
			dispatch.forward(request, response);
		}
		else if(addr != null && addr.equals("info")) {
			List<MemberVO> list = dao.MemberInfo(id, pw);
			request.setAttribute("list", list);
			RequestDispatcher dispatch = request.getRequestDispatcher("user_info");
			dispatch.forward(request, response);
		}
	}
}
