package event;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Date;
import java.util.Enumeration;
import java.util.List;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import coupon.CouponBean;
import coupon.CouponDAO;

@WebServlet("/ev/*")
public class EventController extends HttpServlet{
	
	EventBean ebean;
		
	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		doHandle(request, response);
	}
	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		doHandle(request, response);
	}
	protected void doHandle(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html; charset=utf-8");
		
		String nextPage = "";
		EventBean ebean = new EventBean();
		EventDAO edao  = new EventDAO();
		CouponBean couponBean = new CouponBean();
		CouponDAO couponDAO = new CouponDAO();
		HttpSession session = request.getSession();
		int checkPage = 0;
		String action = request.getPathInfo();
		System.out.println("action:" + action);
		
		//이벤트 글을 조회
		if(action.equals("/listEvent.do")) {
			int total = edao.getAllEvent();
			System.out.println(total);
			//이벤트 버튼 호출 : 0 , 쿠폰 버튼 호출 : 1
			
			String pcheck;
			
			if(request.getParameter("pcheck") == null) {
				pcheck = "0";
			} else {
				pcheck = request.getParameter("pcheck");
			}
			System.out.println(pcheck);
			
			
			int pageSize = 8;
			int nowPage = 1;
			if(request.getParameter("nowPage") != null) nowPage = Integer.parseInt(request.getParameter("nowPage"));
			
			int pageFirst = (nowPage-1) * pageSize;
			int totalPage = total/pageSize + (total%pageSize == 0?0:1);
			int blockSize = 10;
			int blockFirst = (nowPage/blockSize-(nowPage%blockSize == 0?1:0)) * blockSize + 1;
			int blockLast = blockFirst + blockSize -1;
			
			if(blockLast > totalPage) blockLast = totalPage;
			
			List<EventBean> eventList = edao.eventList(pageFirst, pageSize);

			request.setAttribute("eventList", eventList);
			request.setAttribute("blockSize", blockSize);
			request.setAttribute("blockFirst", blockFirst);
			request.setAttribute("blockLast", blockLast);
			request.setAttribute("totalPage", totalPage);
			request.setAttribute("nowPage", nowPage);
			request.setAttribute("pcheck", pcheck);
			
			int total1 = couponDAO.getAllEvent();
			
			
			if(blockLast>totalPage) blockLast = totalPage;
			
			List<CouponBean> list = couponDAO.getList(pageFirst, pageSize);
			request.setAttribute("list", list);
			request.setAttribute("blockSize", blockSize);
			request.setAttribute("blockFirst", blockFirst);
			request.setAttribute("blockLast", blockLast);
			request.setAttribute("totalPage", totalPage);
			request.setAttribute("nowPage", nowPage);

			nextPage = "/event/event2.jsp";
		
		//이벤트 작성 페이지로 이동
		}else if(action.equals("/eventForm.do")) {
		
			String check = request.getParameter("check");
			
			request.setAttribute("check", check);
			
			nextPage = "/event/event_write.jsp";
			
		//이벤트 글 추가
		}else if(action.equals("/insertEvent.do")) {	
			checkPage = 1;	
			ServletContext ctx = getServletContext();	
			String realPath = ctx.getRealPath("/event/image/");
			int max = 20 * 1024 * 1024;
	  		MultipartRequest multi = new MultipartRequest(request, realPath, max, "UTF-8", new DefaultFileRenamePolicy());
			
			String e_title = multi.getParameter("e_title");;
			String e_content = multi.getParameter("e_content");
			String e_file = multi.getFilesystemName("e_file");
			
			Date e_startdate = Date.valueOf(multi.getParameter("e_startdate")); 
			Date e_enddate = Date.valueOf(multi.getParameter("e_enddate"));
			
			ebean.setE_title(e_title);
			ebean.setE_content(e_content);
			ebean.setE_file(e_file);
			ebean.setE_startdate(e_startdate);
			ebean.setE_enddate(e_enddate);
			
			edao.insertEvent(ebean);
			 
			nextPage = "/ev/listEvent.do";

		//이벤트 글 상세보기	
		}else if(action.equals("/viewEvent.do")) {
			checkPage = 1;	
			String e_num = request.getParameter("e_num");
			
			ebean = edao.viewEvent(Integer.parseInt(e_num));
			request.getSession().setAttribute("event", ebean);
			System.out.println(ebean.getE_enddate());
			
			nextPage = "/event/viewEvent.jsp";
		//이벤트 글 삭제
		}else if(action.equals("/deleteEvent.do")) {			
			int e_num = Integer.parseInt(request.getParameter("e_num"));
			System.out.println(e_num);
			edao.deleteEvent(e_num);
			
			
			nextPage = "/ev/listEvent.do";
		
		//이벤트 글 수정페이지 이동
		}else if(action.equals("/modEventForm.do")) {
	         String e_num = request.getParameter("e_num");
	         ebean = edao.viewEvent(Integer.parseInt(e_num));
	         
	         request.setAttribute("event", ebean);
	         nextPage = "/event/modEvent.jsp";			
			
		//이벤트 글 수정	
		}else if(action.equals("/modEvent.do")) {
			int e_num = Integer.parseInt(request.getParameter("e_num"));
			System.out.println(e_num);
			
			ServletContext ctx = getServletContext();	
			String realPath = request.getServletContext().getRealPath("/event/image/");
			int max = 10 * 1024 * 1024;
	  		MultipartRequest multi = new MultipartRequest(request, realPath, max, "UTF-8", new DefaultFileRenamePolicy());			
			
	  		String e_title = multi.getParameter("e_title");
			System.out.println(e_title);
			
			Date e_startdate = Date.valueOf(multi.getParameter("e_startdate"));
			System.out.println(e_startdate);
			
			Date e_enddate = Date.valueOf(multi.getParameter("e_enddate"));
			System.out.println(e_enddate);
			
			String e_file = multi.getFilesystemName("e_file");
			System.out.println(e_file);
			
			String e_content = multi.getParameter("e_content");
			System.out.println(e_content);
			
			EventBean evbean = new EventBean();
			evbean.setE_num(e_num);
			evbean.setE_title(e_title);
			evbean.setE_startdate(e_startdate);
			evbean.setE_enddate(e_enddate);
			evbean.setE_file(e_file);
			evbean.setE_content(e_content);
		
			edao.modEvent(evbean);
			
			nextPage = "/ev/viewEvent.do?e_num="+ e_num;
		}
		
		//디스패치 방식으로 포워딩 (재요청)
		if(checkPage == 0) {
			request.getRequestDispatcher(nextPage).forward(request, response);
		}else {
		    response.sendRedirect(request.getContextPath()+nextPage);
		}		
	}
}
