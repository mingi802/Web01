package web01.src;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
/**
 * Servlet implementation class UserViewServlet
 */
@WebServlet("/user_page")
public class UserViewServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		PrintWriter out = response.getWriter();
		String id = (String) request.getAttribute("id");
		out.print("<html>\r\n"
				+ "<head>\r\n"
				+ "<title>Insert title here</title>\r\n"
				+ "<script  src=\"http://code.jquery.com/jquery-latest.min.js\"></script>\r\n"
				+ "<script>\r\n"
				+ "$(document).ready(function(){\r\n"
				+ "	$('#logout').click(function (){\r\n"
				+ "		alert(\"로그아웃 되었습니다.\");\r\n"
				+ "		window.location.replace(\"./logout\");\r\n"
				+ "	});\r\n"
				+ "});\r\n"
				+ "</script>\r\n"
				+ "</head>\r\n"
				+ "<body>\r\n"
				+ "<h1 id=\"login_result\"></h1>\r\n"
				+ "<p id=\"hello_name\">어서오세요 "+id+"님.</p>\r\n"
				+ "<form action=\"./user\">\r\n"
				+ "	<input type='hidden' id='info' name='info' value='info'>\r\n"
				+ "	<input type='submit' value='내 정보'>&nbsp;\r\n"
				+ "	<input type='button' value='로그아웃' id='logout'>\r\n"
				+ "</form>\r\n"
				+ "</body>\r\n"
				+ "</html>");
	}
}
