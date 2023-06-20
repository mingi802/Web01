package web01.src;

import java.io.IOException;
import java.util.List;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
/**
 * Servlet implementation class MemberServlet
 */
@WebServlet("/show_member")
public class MemberServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html;charset=utf-8");
		MemberDAO dao = new MemberDAO();
		String command = request.getParameter("command");
		if(command == null || command.isEmpty()) {
			List<MemberVO> list = dao.listMembers();
			request.setAttribute("memberList", list);
		}
		else if(command != null && !command.isEmpty() && command.equals("search")) {
			List<SearchList> slist = new ArrayList<SearchList>();
			String[] search_opt = request.getParameterValues("search-opt");
			String[] search_text = request.getParameterValues("search-text");
			for (int idx = 0; idx < search_opt.length; idx++) {
				SearchList sl = new SearchList();
				if(idx == 0) {
					sl.setAnd_or("");
				} else {
					String and_or = request.getParameter("and-or"+idx);	//라디오 형식이라 같은 네임이 안됐음
					sl.setAnd_or(and_or);
				}
				sl.setSearch_opt(search_opt[idx]);
				sl.setSearch_text(search_text[idx]);
				slist.add(sl);
			}
			for(int i = 0; i < slist.size(); i++) {
				System.out.println(slist.get(i).getAnd_or());
				System.out.println(slist.get(i).getSearch_opt());
				System.out.println(slist.get(i).getSearch_text());
			}
			List<MemberVO> list = dao.searchMembers(slist);
			request.setAttribute("memberList", list);
		}
		else if(command != null && !command.isEmpty() && command.equals("delete")) {
			//삭제 기능 구현
			String MEMBER_ID = request.getParameter("member_id"); 
			dao.deleteMember(MEMBER_ID);
			List<MemberVO> list = dao.listMembers();
			request.setAttribute("memberList", list);
		}
		RequestDispatcher dispatch = request.getRequestDispatcher("show_member_view");
		dispatch.forward(request, response);
		
	}

}
