package member;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/IdCheck")
public class IdCheck extends HttpServlet{
	private static final long serialVersionUID = 1L;
	
	@Override
	protected void doGet(HttpServletRequest reqeust, HttpServletResponse response) throws ServletException, IOException {
		
		doPost(reqeust, response);
	}
	
	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html;charset=UTF-8");
		
		String id = request.getParameter("id");
		
		MemberDAO memberDAO = new MemberDAO();
		boolean result1 = memberDAO.idCheck(id);
		
		response.getWriter().write(result1+"");
		System.out.println(result1);
	}
}
