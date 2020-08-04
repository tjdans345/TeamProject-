package main;

import java.io.IOException;
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
import team.best.bestDao;

@WebServlet("/main/*")
public class MainController extends HttpServlet{
	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) 
						throws ServletException, IOException {
		doHandle(request, response);
	}
	
	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) 
						throws ServletException, IOException {

		doHandle(request, response);
	}
	
	protected void doHandle(HttpServletRequest request, HttpServletResponse response) 
						throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html;charset=utf-8");
		String action = request.getPathInfo();
		String pageNext = "";
		
		DetailBean detailBean = new DetailBean();
		bestDao bestdao = new bestDao();
		
		//메인 페이지 요청(공연/전시 소식 크롤링)
		if(action.equals("/main.do")) {
			String url = "https://news.naver.com/main/list.nhn?mode=LS2D&mid=shm&sid1=103&sid2=242";

			Document doc = null;
			
			String[] list = new String[3];
			
			try {
				doc = Jsoup.connect(url).get();
			} catch (Exception e) {
				e.printStackTrace();
			}
			Elements element = doc.select("ul.type06_headline");
			Iterator<Element> ie1 = element.select("li").iterator();
			
			
			for(int i=0; i<list.length; i++) {
				list[i] = ie1.next().html()+"<br>";
				
				element.next();
			}
			request.setAttribute("list", list);		
			
			
			List<DetailBean> bestList = new ArrayList<DetailBean>();
			
			bestList = bestdao.getBestList();
			request.setAttribute("bestList", bestList);
			
			pageNext = "/index/index.jsp";
			
		}else if(action.equals("/news.do")) {
			String url = "https://news.naver.com/main/list.nhn?mode=LS2D&mid=shm&sid1=103&sid2=242";

			Document doc = null;
			
			String[] list = new String[10];
			
			try {
				doc = Jsoup.connect(url).get();
			} catch (Exception e) {
				e.printStackTrace();
			}
			Elements element = doc.select("ul.type06_headline");
			Iterator<Element> ie1 = element.select("li").iterator();
			
			
			for(int i=0; i<list.length; i++) {
				list[i] = ie1.next().html()+"<br>";
				
				element.next();
			}
			request.setAttribute("list", list);	
			
			pageNext = "/index/news.jsp";
			
		}
		
			request.getRequestDispatcher(pageNext).forward(request, response);
		
	}
	
}
