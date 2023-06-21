package web01.src;

import java.io.IOException;
import java.util.Arrays;
import java.util.List;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet Filter implementation class LoginFilter
 */
@WebFilter("/user/*")
public class LoginFilter implements Filter {
       
	private static final List<String> ALLOWED_PATHS = Arrays.asList("", "/login.jsp", "/logout.jsp");
	
	/**
	 * @see Filter#doFilter(ServletRequest, ServletResponse, FilterChain)
	 */
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException {
		HttpServletRequest req = (HttpServletRequest) request;
        HttpServletResponse res = (HttpServletResponse) response;
        HttpSession session = req.getSession(false);
        String path = req.getServletPath().substring(5); 
        boolean loggedIn = (session != null && session.getAttribute("id") != null);
        boolean allowedPath = ALLOWED_PATHS.contains(path);

        System.out.println(loggedIn);
        System.out.println(path);
        System.out.println(allowedPath);
        
        if (loggedIn || allowedPath) {
            chain.doFilter(req, res);
        }
        else {
        	System.out.println("need login");
        	res.sendRedirect("./login.jsp");
        }
	}

}
