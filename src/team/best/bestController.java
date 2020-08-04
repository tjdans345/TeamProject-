package team.best;

import java.io.IOException;

import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;
import org.jsoup.select.Elements;

import Product.DetailBean;


@WebServlet("/btboard/*")
public class bestController extends HttpServlet{
	DetailBean Dbean;
	
		
	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		doHandle(request, response);
	}
	
	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		doHandle(request, response);
	}
	
	private void doHandle(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		
		//MVC 중 View이름을 저장할 변수
		String nextPage = "";
		//한글처리
		request.setCharacterEncoding("utf-8");
		//클라이언트의 웹브라우저로 응답할 데이터 유형 설정
		response.setContentType("text/html;charset=utf-8");
		
		int checkPage = 0;
		//요청 URL중 2단계 요청 주소를 알아내온다

		String action = request.getPathInfo(); 
		System.out.println("action : " + action);
		
		DetailBean detailBean = new DetailBean();
		bestDao bestdao = new bestDao();
		

		if(action.equals("/bestList.do")) { 
			
			List<DetailBean> bestList = new ArrayList<DetailBean>();
			
			bestList = bestdao.getBestList();
			request.setAttribute("bestList", bestList);
			nextPage = "/best/best01.jsp";
				
			
		}else if(action.equals("/mainBest.do")) {
			List<DetailBean> bestList = new ArrayList<DetailBean>();
			
			bestList = bestdao.getBestList();
			request.setAttribute("bestList", bestList);
			nextPage = "/best/mainBest.jsp";
		}

		if(checkPage == 0) {
			request.getRequestDispatcher(nextPage).forward(request, response);
		}else {
			response.sendRedirect(request.getContextPath()+nextPage);
		}
	
	}//doHandle
		
}//faqBoardController