package noticeboard;

import java.awt.print.Book;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import member.LikeDAO;




@WebServlet("/notice/*")
public class NoticeboardController extends HttpServlet{
	NoticeboardBean VO;
	
	@Override
	public void init() throws ServletException {
		VO = new NoticeboardBean();
	}
	
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
		
		NoticeboardDAO noticeDAO = new NoticeboardDAO();
		NoticeboardBean noticebean = new NoticeboardBean();
		HttpSession session = request.getSession();
		int checkPage = 0;
		String nextPage = "";
		String action = request.getPathInfo();
		System.out.println("action:" + action);
		
		//공지사항 글을 조회
		if(action.equals("/listNotice.do")) {			
			String n_cate = request.getParameter("n_cate");

			int total = noticeDAO.getAllNotice();
			System.out.println(total);

			if(n_cate != null)total = noticeDAO.getAllnotice(n_cate);
			System.out.println(total);			
			
			int pageSize = 5;
			int nowPage = 1;
			if(request.getParameter("nowPage") != null) nowPage = Integer.parseInt(request.getParameter("nowPage"));
			
			int pageFirst = (nowPage-1) * pageSize;
			int totalPage = total/pageSize + (total%pageSize==0?0:1);
			int blockSize = 10;
			int blockFirst = (nowPage/blockSize-(nowPage%blockSize==0?1:0))*blockSize + 1;
			int blockLast = blockFirst + blockSize -1;
			
			if(blockLast>totalPage) blockLast=totalPage;
			
			List<NoticeboardBean> noticeList = noticeDAO.noticeList(pageFirst, pageSize);
	
			if(n_cate != null)noticeList = noticeDAO.noticeList(n_cate, pageFirst, pageSize);
				request.setAttribute("noticeList", noticeList);
				request.setAttribute("blockSize", blockSize);
				request.setAttribute("blockFirst", blockFirst);
				request.setAttribute("blockLast", blockLast);
				request.setAttribute("totalPage", totalPage);
				request.setAttribute("nowPage", nowPage);
				request.setAttribute("n_cate", n_cate);
				
				System.out.println(n_cate);
			
			nextPage = "/center/center_notice.jsp";
			
		//공지사항 글 작성 페이지로 이동
		}else if(action.equals("/noticeForm.do")) {	
			
			String check = request.getParameter("check");
			
			request.setAttribute("check", check);
			
			nextPage = "/center/center_write.jsp";
		
		//공지사항 글 추가	
		}else if(action.equals("/insertNotice.do")) {
			String n_cate = request.getParameter("n_cate");
			String n_title = request.getParameter("n_title");
			String n_content = request.getParameter("n_content");
			checkPage = 1;
			noticebean.setN_cate(n_cate);
			noticebean.setN_title(n_title);
			noticebean.setN_content(n_content);
			noticebean.setN_date(new Timestamp(System.currentTimeMillis()));
			
			noticeDAO.insertNoticeboard(noticebean);
			
			nextPage = "/notice/listNotice.do";
			
		//공지사항 글 상세보기
		}else if(action.equals("/viewNotice.do")) {
			String n_num = request.getParameter("n_num");
			String id =(String)session.getAttribute("id");
			
			noticebean = noticeDAO.viewNotice(Integer.parseInt(n_num));
			request.setAttribute("notice", noticebean);
			
			nextPage = "/center/viewNotice.jsp";
		//글 수정 페이지로 이동
		}else if(action.equals("/modNoticePage.do")) {
			String n_num = request.getParameter("n_num");
			noticebean = noticeDAO.viewNotice(Integer.parseInt(n_num));
			request.setAttribute("notice", noticebean);
			nextPage = "/center/modNotice.jsp";
		//공지사항 글 삭제	
		}else if(action.equals("/deleteNotice.do")) { 
			int n_num = Integer.parseInt(request.getParameter("n_num")); 
			System.out.println(n_num);
			noticeDAO.deleteNoticeboard(n_num);
			
			nextPage = "/notice/listNotice.do"; 
		//공지사항 글 수정
		}else if(action.equals("/modNotice.do")) {
			checkPage = 1;
			int n_num = Integer.parseInt(request.getParameter("n_num"));
			System.out.println(n_num);
			
			String n_title = request.getParameter("n_title");
			System.out.println(n_title);
			
			String n_cate = request.getParameter("n_cate");
			System.out.println(n_cate);	
			
			String n_content = request.getParameter("n_content");
			System.out.println(n_content);
			
			NoticeboardBean NoticeVO = new NoticeboardBean();
			
			NoticeVO.setN_num(n_num);
			NoticeVO.setN_title(n_title);
			NoticeVO.setN_cate(n_cate);
			NoticeVO.setN_content(n_content);
			
			int result = noticeDAO.modNotice(NoticeVO);
			
			System.out.println(result);
			
//			if(result == 0) { // 수정실패
//				PrintWriter pw = response.getWriter();
//				pw.print("<script>");
//				pw.print("alert('수정실패 !')");
//				pw.print("history.go(-1);");
//				pw.print("</script>");
//			}else { // 수정성공
//				
//				PrintWriter pw = response.getWriter();
//				pw.print("<script>");
//				pw.print("alert('수정성공 !')");
//				pw.print("</script>");
//			}
//			
			nextPage = "/notice/viewNotice.do?n_num="+ n_num;
		} 
		if(checkPage == 0) {
			request.getRequestDispatcher(nextPage).forward(request, response);
		}else {
			response.sendRedirect(request.getContextPath()+nextPage);
		}
	}
}

