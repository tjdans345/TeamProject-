package member;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import java.util.*;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import Order.OrderDAO;
import Order.OrderVO;
import Product.ProductBean;
import Product.ProductDAO;
import team.qnaboard.qnaDao;


@WebServlet("/mycon/*")
public class MyPageController extends HttpServlet{
	/*
	 * int total = noticeDAO.getAllNotice(); int pageSize = 5; int nowPage = 1;
	 * if(request.getParameter("nowPage") != null) nowPage =
	 * Integer.parseInt(request.getParameter("nowPage"));
	 * 
	 * int pageFirst = (nowPage-1) * pageSize; int totalPage = total/pageSize +
	 * (total%pageSize==0?0:1); int blockSize = 10; int blockFirst =
	 * (nowPage/blockSize-(nowPage%blockSize==0?1:0))*blockSize + 1; int blockLast =
	 * blockFirst + blockSize -1;
	 * 
	 * if(blockLast>totalPage) blockLast=totalPage;
	 
	 *<a href="${contextPath}/mycon/likeAction.do?id=${sessionScope.id}&num=${Bean.num}">
                          ${check == "false" ? "찜하기" : "찜한 상품"}
 	  </a>
	 *
	 */
	
	
	
	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doHandle(request, response);
	}

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doHandle(request, response);
	}
	
	private void doHandle(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
	
		HttpSession session = request.getSession();
		LikeDAO likeDAO = new LikeDAO();
		LikeBean likeBean = new LikeBean();
		OrderDAO orderDAO = new OrderDAO();
		OrderVO orderVO = new OrderVO();
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html;charset=UTF-8");
		int checkPage =0;
		String action =request.getPathInfo();
		String nextPage = "";
		System.out.println(action);
		if(action.equals("/mypageForm.do")) { //마이페이지폼 이동
			qnaDao QnaDAO = new qnaDao();
			String id = (String)session.getAttribute("id");
			String name = (String)session.getAttribute("name");
			int total = QnaDAO.getAllQna(id);
			List<OrderVO> cartList = orderDAO.getCartList(id);
			int likeCount = likeDAO.getTotal(id);
			int payCount = orderDAO.getCountPay(id);
			int cartCount = orderDAO.getCountCartList(id);
			MemberBean user = new MemberBean();
			MemberDAO memberDAO = new MemberDAO();
			user = memberDAO.getMember(id);
			session.setAttribute("cartList", cartList);
			session.setAttribute("cartCount", cartCount);
			request.setAttribute("payCount", payCount);
			request.setAttribute("likeCount", likeCount);
			request.setAttribute("total", total);
			request.setAttribute("user", user);
			nextPage="/mypage/mypage.jsp";
			
			/* check = 1; */
		}else if(action.equals("/likelistForm.do")) { //좋아요 목록
			
			  String id = (String)session.getAttribute("id");
			  
			  int total = likeDAO.getTotal(id); 
			  int pageSize = 5; 
			  int nowPage = 1;
			  if(request.getParameter("nowPage") != null) {
				  nowPage = Integer.parseInt(request.getParameter("nowPage"));
			  }
			  int pageFirst = (nowPage - 1) * pageSize; 
			  int totalPage = total / pageSize + (total % pageSize == 0 ? 0 : 1); 
			  int blockSize = 10; 
			  int blockFirst = (nowPage / blockSize- (nowPage%blockSize == 0 ? 1 : 0) ) * blockSize + 1; 
			  int blockLast = blockFirst + blockSize -1;			  
			  if(blockLast > totalPage) {blockLast = totalPage;}
			
			  List<LikeBean> likeList = likeDAO.getLikeList(id, pageFirst, pageSize);
			  request.setAttribute("likeList", likeList);
			  request.setAttribute("blockSize", blockSize);
			  request.setAttribute("blockFirst", blockFirst);
			  request.setAttribute("blockLast", blockLast);
			  request.setAttribute("totalPage", totalPage);
			  request.setAttribute("nowPage", nowPage);
			
			nextPage="/mypage/likelist.jsp";
			 
		}else if(action.equals("/likeAction.do")) { //좋아요 판별 and 없으면 추가 있으면 삭제
			
			int num = Integer.parseInt(request.getParameter("num"));
			String id = request.getParameter("id");
			String name = request.getParameter("name");
			String image = request.getParameter("image");
			boolean checkZ = likeDAO.checkLike(num, id);
			int likeCount = likeDAO.getProductTotalLike(num);
			if(checkZ == false) {
				likeDAO.addLike(num, id, name, image);
			}else {
				likeDAO.delLike(num, id);
			}
			
			request.setAttribute("checkZ", checkZ); 
			request.setAttribute("likeCount", likeCount);
			System.out.println("checkZ : "+checkZ);
			System.out.println("likeCount : " + likeCount);
			
			nextPage = "/Proser/content.do?num="+num;
			
		}else if(action.equals("/addpointForm.do")){ // 포인트충전 페이지로 이동
			
			nextPage= "/mypage/point.jsp";
			
		}else if(action.equals("/addpoint.do")) { //입금확인요청 버튼을 눌렀을 때
			
			String id = request.getParameter("id");
			String name = request.getParameter("name");
			int point = Integer.parseInt(request.getParameter("point"));
			checkPage = 1;
			MemberBean pointBean = new MemberBean();
			MemberDAO memberDAO = new MemberDAO();
			
			memberDAO.addpoint1(id, name, point); //입금확인 요청시 point테이블에 insert
			request.setAttribute("point", point);
			
			nextPage = "/mycon/mypageForm.do";
			
		}else if(action.equals("/addpointCom.do")) {   //입금확인완료 버튼 클릭 시 해당 id의 포인트를 추가시킴
			String id = (String)session.getAttribute("id");
			String name = (String)session.getAttribute("name");
			int point = Integer.parseInt(request.getParameter("point"));
			int num = Integer.parseInt(request.getParameter("num"));
			MemberDAO memberDAO = new MemberDAO();
			MemberBean memberBean = new MemberBean();
			memberBean = memberDAO.getMember(id);
			int totalpoint = memberBean.getPoint();
			
			memberDAO.updatePoint(id, point, num); 	//해당 id의 포인트에 충전할 포인트만큼 추가해줌
			memberDAO.delPoint(id, num);
			nextPage = "/index/index.jsp";
			
		}else if(action.equals("/pointList.do")) { // 포인트 충전 신청을한 id들 조회 (List)
			  
			  MemberDAO memberDAO = new MemberDAO();
			  int total = memberDAO.getPointTotal();
			  int pageSize = 5; 
			  int nowPage = 1;
			  if(request.getParameter("nowPage") != null) {
				  nowPage = Integer.parseInt(request.getParameter("nowPage"));
			  }
			  int pageFirst = (nowPage - 1) * pageSize; 
			  int totalPage = total / pageSize + (total % pageSize == 0 ? 0 : 1); 
			  int blockSize = 10; 
			  int blockFirst = (nowPage / blockSize- (nowPage%blockSize == 0 ? 1 : 0) ) * blockSize + 1; 
			  int blockLast = blockFirst + blockSize -1;			  
			  if(blockLast > totalPage) {blockLast = totalPage;}
			
			  List<LikeBean> pointList = memberDAO.getPointList(pageFirst, pageSize);
			  request.setAttribute("blockSize", blockSize);
			  request.setAttribute("blockFirst", blockFirst);
			  request.setAttribute("blockLast", blockLast);
			  request.setAttribute("totalPage", totalPage);
			  request.setAttribute("nowPage", nowPage);
			  request.setAttribute("pointList", pointList);
			
			nextPage="/pointList.jsp";
			
		}else if(action.equals("/delPoint.do")) {	// 입금내역 삭제 눌렀을때 하나씩 삭제
			String id = request.getParameter("id");
			int num = Integer.parseInt(request.getParameter("num"));
			MemberDAO memberDAO = new MemberDAO();
			MemberBean memberBean = new MemberBean();
			 
			memberDAO.delPoint(id,num);
			
			nextPage = "/index.jsp";
			
		}
		
		if(checkPage == 0) {
			request.getRequestDispatcher(nextPage).forward(request, response);
		}else {
			response.sendRedirect(request.getContextPath()+nextPage);
		}
	}
	
	
}
