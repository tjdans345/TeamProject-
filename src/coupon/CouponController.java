package coupon;

import java.io.IOException;
import java.sql.Date;
import java.util.ArrayList;
import java.util.Enumeration;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

@WebServlet("/coupon/*")
public class CouponController extends HttpServlet{

	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doHandle(request, response);
	}
	
	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doHandle(request, response);
	}
	
	private void doHandle(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		//한글처리
		request.setCharacterEncoding("UTF-8");
		//클라이언트의 웹브라우저로 응답할 데이터 유형 설정
		response.setContentType("text/html;charset=utf-8");
		//MVC 중 View이름을 저장할 변수
		String nextPage = "";
		
		//요청 URL중 2단계 요청 주소를 알아내온다
		String action = request.getPathInfo();
		System.out.println("action : " + action);
		
		CouponBean couponBean = new CouponBean();
		CouponDAO couponDAO = new CouponDAO();
		HttpSession session = request.getSession();
		
		//디스패처 방식, 리다이렉트 방식 결정
		int checkPage = 0;
		
		//쿠폰 메인 페이지
		if(action.equals("/events.do")) { 
			
			int total = couponDAO.getAllEvent();
			
			int pageSize = 12;
			int nowPage = 1;
			if(request.getParameter("nowPage") != null) nowPage = Integer.parseInt(request.getParameter("nowPage"));
			
			int pageFirst = (nowPage-1) * pageSize;
			int totalPage = total/pageSize + (total%pageSize==0?0:1);
			int blockSize = 10;
			int blockFirst = (nowPage/blockSize-(nowPage%blockSize==0?1:0))*blockSize + 1;
			int blockLast = blockFirst + blockSize -1;
			
			if(blockLast>totalPage) blockLast = totalPage;
			
			List<CouponBean> list = couponDAO.getList(pageFirst, pageSize);
			request.setAttribute("list", list);
			request.setAttribute("blockSize", blockSize);
			request.setAttribute("blockFirst", blockFirst);
			request.setAttribute("blockLast", blockLast);
			request.setAttribute("totalPage", totalPage);
			request.setAttribute("nowPage", nowPage);
			
			nextPage = "/coupons/coupon.jsp";
			
		//이벤트 등록 페이지 가기	
		}else if(action.equals("/eventWriteForm.do")) { 
			
			String check = request.getParameter("check");
	         
	        request.setAttribute("check", check);
	        
			nextPage = "/coupons/couponWrite.jsp";
		
		//이벤트 글추가
		}else if(action.equals("/eventWrite.do")) { 
			checkPage = 1;
			String realFolder = request.getServletContext().getRealPath("upload");
			int max = 100 * 1024 * 1024;

			MultipartRequest multi = new MultipartRequest(request, realFolder, max, "UTF-8",
					new DefaultFileRenamePolicy());

			Enumeration<String> e = multi.getFileNames();

			ArrayList<String> saveFiles = new ArrayList<String>();

			ArrayList<String> originFiles = new ArrayList<String>();

			while (e.hasMoreElements()) {
				String filename = (String) e.nextElement();

				saveFiles.add(multi.getFilesystemName(filename));

				originFiles.add(multi.getOriginalFileName(filename));

			}
			
			String title = multi.getParameter("title");
			Date startdate = Date.valueOf(multi.getParameter("startdate"));
			Date enddate = Date.valueOf(multi.getParameter("enddate"));
			String content = multi.getParameter("content");
			String image = "";
			String timage = "";
			if(saveFiles != null) {
				for (int i = 0; i < saveFiles.size(); i++) {
					if (i == 0) {
						timage = (String) saveFiles.get(i);
					} else {
						image = (String) saveFiles.get(i);
					}
				}
			}
						
			couponBean.setEvent_title(title);
			couponBean.setEvent_startdate(startdate);
			couponBean.setEvent_enddate(enddate);
			couponBean.setEvent_content(content);
			couponBean.setEvent_image(image);
			couponBean.setEvent_timage(timage);
			
			couponDAO.insertevent(couponBean);
			
			nextPage = "/coupon/events.do";
			
		//이벤트 글 보기	
		}else if(action.equals("/eventInfo.do")) { 
			
			int event_num = Integer.parseInt(request.getParameter("event_num"));
			
			couponBean = couponDAO.eventInfo(event_num);
			
			request.setAttribute("couponBean", couponBean);
			
			nextPage = "/coupons/couponInfo.jsp";
		
		//이벤트 글 수정폼 이동
		}else if(action.equals("/eventUpdateForm.do")) { 
			
			int event_num = Integer.parseInt(request.getParameter("event_num"));
			
			couponBean = couponDAO.getEventNum(event_num);
			
			request.setAttribute("couponBean", couponBean);
			
			nextPage = "/coupons/couponUpdate.jsp";
		
		//이벤트 글 수정
		}else if(action.equals("/eventUpdate.do")) {
			
			int event_num = Integer.parseInt(request.getParameter("event_num"));
			
			String realFolder = request.getServletContext().getRealPath("upload");
			int max = 100 * 1024 * 1024;

			MultipartRequest multi = new MultipartRequest(request, realFolder, max, "UTF-8",
					new DefaultFileRenamePolicy());

			Enumeration<String> e = multi.getFileNames();

			ArrayList<String> saveFiles = new ArrayList<String>();

			ArrayList<String> originFiles = new ArrayList<String>();

			while (e.hasMoreElements()) {
				String filename = (String) e.nextElement();

				saveFiles.add(multi.getFilesystemName(filename));

				originFiles.add(multi.getOriginalFileName(filename));

			}
			
			String title = multi.getParameter("title");
			Date startdate = Date.valueOf(multi.getParameter("startdate"));
			Date enddate = Date.valueOf(multi.getParameter("enddate"));
			String content = multi.getParameter("content");
			String image = "";
			String timage = "";
			if(saveFiles != null) {
				for (int i = 0; i < saveFiles.size(); i++) {
					if (i == 0) {
						timage = (String) saveFiles.get(i);
					} else {
						image = (String) saveFiles.get(i);
					}
				}
			}
						
			couponBean.setEvent_num(event_num);
			couponBean.setEvent_title(title);
			couponBean.setEvent_startdate(startdate);
			couponBean.setEvent_enddate(enddate);
			couponBean.setEvent_content(content);
			couponBean.setEvent_image(image);
			couponBean.setEvent_timage(timage);
			
			couponDAO.eventUpdateProc(couponBean);
			
			nextPage = "/coupon/eventInfo.do";
		
		//이벤트 글 삭제
			} else if(action.equals("/eventDelete.do")) {
			
			int event_num = Integer.parseInt(request.getParameter("event_num"));
			
			couponDAO.eventDelete(event_num);
			
			nextPage = "/coupon/events.do";
			
			}
		
	      	if(checkPage == 0) {
	      		request.getRequestDispatcher(nextPage).forward(request, response);
	      	}else {
	      		response.sendRedirect(request.getContextPath()+nextPage);
	      	}
		
	}// doHandle 끝
	
}// EventController 끝
