package team.faqboard;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


@WebServlet("/fboard/*")
public class faqBoardController extends HttpServlet{
	
	faqBean Bean;
	
	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		doHandle(request, response);
	}
	
	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		doHandle(request, response);
	}
	
	protected void doHandle(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		
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
		faqDao faqDao = new faqDao();
		faqBean faqBean = new faqBean();
		
		List<faqBean> articlesList = new ArrayList<faqBean>();	
//		
//		String search = "";
		String search = (request.getParameter("search") != null) ? request.getParameter("search") : "";
		String category = (request.getParameter("category") != null) ? request.getParameter("category") : "";
//		
		int total = faqDao.getfaqCount(search);
		int nowpage = 1 ;
		if(request.getParameter("nowpage") !=null) nowpage = Integer.parseInt(request.getParameter("nowpage"));
		int pagesize = 5 ;
		int startrow = (nowpage-1)*pagesize;
		int endrow = pagesize;
		int totalpage = total/pagesize + (total%pagesize==0?0:1);
		int blocksize = 3;
		int blockfirst = ((nowpage/blocksize)-(nowpage%blocksize==0?1:0))*blocksize+1;
		int blocklast = blockfirst + blocksize -1;
		if(blocklast > totalpage) blocklast = totalpage;
	
/*		
		if(blockfirst != 1) {
			<a>이전</a>
		}
		for(int i = blockfirst ; i <= blocklast ; i ++) {
			<a>i</a>
		}
		if(blocklast != totalpage) {
			<a> 다음</a>
		}
*/		

		if(action.equals("/faqlist.do")) { // FAQ게시판을 요청했을 때
			
			articlesList = faqDao.getFaqList(search, startrow, endrow);
			
			int count = total;
			
			request.setAttribute("category", category);
			
			request.setAttribute("articlesList", articlesList);
			request.setAttribute("count", count);
			//페이징
			request.setAttribute("nowpage", nowpage);
			request.setAttribute("blockfirst", blockfirst);
			request.setAttribute("blocklast", blocklast);
			request.setAttribute("blocksize", blocksize);
			request.setAttribute("totalpage", totalpage);
			
			nextPage = "/board/qna_faqboard.jsp";		
			
		}else if(action.equals("/fwriteForm.do")) { //FAQ게시판 글쓰기폼 가기
			
			String check = request.getParameter("check");
			
			request.setAttribute("check", check);
			
			nextPage = "/board/qna_faqwrite.jsp";
		
		}else if(action.equals("/faqWrite.do")) { //FAQ게시판 글 작성
			
			String Rcate = request.getParameter("cate");
			String title = request.getParameter("title");
			String contents = request.getParameter("contents");
			checkPage = 1;

			faqBean.setFaq_cate(Rcate);
			faqBean.setFaq_title(title);
			faqBean.setFaq_contents(contents);
			
			faqDao.insertfboard(faqBean);
			
			nextPage = "/fboard/faqlist.do";
			
		}else if(action.equals("/faqUpdateForm.do")) { //FAQ게시판 글 수정폼 가기
			
			String faq_num = request.getParameter("faq_num");
			faqBean = faqDao.getfaq(Integer.parseInt(faq_num));
			
			request.setAttribute("faqUpdate", faqBean);
			
			nextPage = "/board/qna_faqUpdate.jsp";
			
		}else if(action.equals("/faqUpdate.do")) { //FAQ게시판 글 수정
			checkPage = 1;
			int faq_num = Integer.parseInt(request.getParameter("faq_num"));
			
			String Rcate = request.getParameter("cate");
			String title = request.getParameter("title");
			String contents = request.getParameter("contents");
			
			faqBean.setFaq_num(faq_num);
			faqBean.setFaq_cate(Rcate);
			faqBean.setFaq_title(title);
			faqBean.setFaq_contents(contents);
			
			int result = faqDao.updatefboard(faqBean);
			
			System.out.println(result);
			
			nextPage = "/fboard/faqlist.do";
			
		}else if(action.equals("/faqDelete.do")) { //FAQ게시판 글 삭제
			
			int faq_num = Integer.parseInt(request.getParameter("faq_num"));
			faqDao.deletefboard(faq_num);
			
			request.setAttribute("faqUpdate", faqBean);
			
			nextPage = "/fboard/faqlist.do?faq_num=" + faq_num;
			
		}

		if(checkPage == 0) {
			request.getRequestDispatcher(nextPage).forward(request, response);
		}else {
			response.sendRedirect(request.getContextPath()+nextPage);
		}
	
	}//doHandle
		
}//faqBoardController