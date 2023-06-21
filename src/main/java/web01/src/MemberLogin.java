package web01.src;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class MemberLogin
 */
@WebServlet("/login")
public class MemberLogin extends HttpServlet {
	private static final long serialVersionUID = 1L;
	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		PrintWriter out = response.getWriter();
		HttpSession session = request.getSession();
		MemberDAO dao = new MemberDAO();
		List<SearchList> slist = new ArrayList<SearchList>();
		String id = request.getParameter("id");
		String pw = request.getParameter("password");
		System.out.println(id!=null&&pw!=null);
		
		if((id!=null&&!id.equals(""))&&(pw!=null&&!pw.equals(""))) {
			SearchList sl = new SearchList();
			sl.setSearch_opt("MEMBER_ID");
			sl.setSearch_text(id);
			slist.add(sl);
			sl = new SearchList();
			sl.setAnd_or("AND");
			sl.setSearch_opt("MEMBER_PW");
			sl.setSearch_text(pw);
			slist.add(sl);
			List<MemberVO> mlist = dao.searchMembers(slist);
			request.setAttribute("memberList", mlist);
			if(mlist.isEmpty()) {
				out.print("<script>alert('해당 아이디 존재하지 않음');</script>");
				out.print("<script>window.location.href='./user/login.jsp';</script>");
				session.invalidate();
			}
			else {
				if(session.isNew()) {
					System.out.println("new");
					if(id!=null&&pw!=null) {
						session.setAttribute("id", id);
						session.setAttribute("pw", pw);
						out.print("<script>alert('로그인 성공');</script>");
						response.sendRedirect("./user?info=page");
					}
					else {
						out.print("<a href='./user/login.jsp'>리턴</a>");
						session.invalidate();
					}
				} else {
					id = (String) session.getAttribute("id");
					pw = (String) session.getAttribute("pw");
					if(id != null && !id.isEmpty()) {
						response.sendRedirect("./user?info=page");
					}
					else {
						out.print("<a href='./user/login.jsp'>리턴</a>");
						session.invalidate();
					}
				}
			}
		} else {
			out.print("<script>alert('아이디 비밀번호 입력');</script>");
			out.print("<script>window.location.href='./user/login.jsp';</script>");
			session.invalidate();
		}
	}

}
