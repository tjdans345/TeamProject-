package Order;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Date;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.mysql.fabric.xmlrpc.base.Array;

import Product.DetailBean;
import Product.ProductBean;
import Product.ProductService;
import member.MemberBean;
import member.MemberDAO;

@WebServlet("/Order/*")
public class OrderController extends HttpServlet{
	
	ProductService Pservice;
	OrderService Orservice;
	
	public void init(ServletConfig config) throws ServletException {
		Pservice = new ProductService();
		Orservice = new OrderService();
	}
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doHandle(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doHandle(request, response);
	}
	
	protected void doHandle(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		int checkPage = 0;
		String nextPage = "";
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html; charset=utf-8");
		MemberDAO memberDAO = new MemberDAO();
		MemberBean memberBean = new MemberBean();
		OrderDAO orderDAO = new OrderDAO();
		OrderVO orderVO = new OrderVO();
		HttpSession session = request.getSession();
		String action = request.getPathInfo();
		
		if (action.equals("/order.do")) {			//장바구니에 추가하기
			String[] seat = request.getParameterValues("seat");
			int detailnum = Integer.parseInt(request.getParameter("detailnum"));
			int qty = Integer.parseInt(request.getParameter("count"));
			int totalprice = Integer.parseInt(request.getParameter("totalprice"));
			Date today = Date.valueOf(request.getParameter("today"));
			String id = request.getParameter("id");
			String name = request.getParameter("name");
			DetailBean DVO = Pservice.getdetails(detailnum);
			
			
			//해당 공연에 대한 예약된 좌석정보리스트 가져와서 저장하기
			List<OrderVO> selectseat = orderDAO.getSeat(today, detailnum);
			String chseat="";
			for(int j=0; j<selectseat.size();j++) {
				chseat += selectseat.get(j).getSelectseat();
				if(j!=selectseat.size()-1) {
					chseat += ",";
				}
			}
			System.out.println(chseat);
			
			
			
			checkPage = 1;
			int sub = DVO.getTotalreserved() + qty;
			PrintWriter pw = response.getWriter();
			String out = "";
			for(int i=0; i<seat.length;i++) {
				out += seat[i];
				if(i!=seat.length-1)out+=",";
				
			}
			Pservice.UpdateSeat(detailnum,sub);
			
			DetailBean Bean = Pservice.getdetails(detailnum);
			
			boolean checkproduct = orderDAO.checkproduct(id, name);
			
			if(checkproduct == true) {			//이미 장바구니에 해당상품이 있는지 판별함
				pw.print("<script>");
				pw.print("alert('이미 장바구니에 있는 상품입니다.');");
				pw.print("history.back();");
				pw.print("</script>");
				return;
			}else {

			OrderVO vo = new OrderVO();
			vo.setSelectseat(out);
			vo.setName(Bean.getName());
			vo.setGenre(Bean.getGenre());
			vo.setCla(Bean.getCla());
			vo.setRuntime(Bean.getRuntime());
			vo.setPrice(Bean.getPrice());
			vo.setStartdate(Bean.getStartdate());
			vo.setEnddate(Bean.getEnddate());
			vo.setImage(Bean.getImage());
			vo.setContent(Bean.getContent());
			vo.setPlace(Bean.getPlace());
			vo.setSeat(Bean.getSeat());
			vo.setTotalreserved(Bean.getTotalreserved());
			vo.setToday(Bean.getToday());
			vo.setStarttime(Bean.getStarttime());
			vo.setId(id);
			vo.setDetailnum(detailnum);
			vo.setQty(qty);
			vo.setTotalprice(totalprice);			
			Orservice.insertOrder(vo);
			session.setAttribute("cartList", vo);
			pw.write("<script>");
			pw.write("alert('장바구니에 추가되었습니다.');");
			pw.write("location.href='"+request.getContextPath()+"/Order/cartList.do';");
			pw.write("</script>");
			
			return;
			}
			
		}else if(action.equals("/cartList.do")) {				//장바구니 전체내역 조회

			String id = (String)session.getAttribute("id");
			
			int cartcount =orderDAO.getCountCartList(id);
			int total = orderDAO.getTotalPrice(id);
			
			int pageSize = 5;
			int nowPage = 1;
			if(request.getParameter("nowPage") != null) {
				nowPage = Integer.parseInt(request.getParameter("nowPage"));
			}
			int pageFirst = (nowPage - 1) * pageSize;
			int totalPage = cartcount / pageSize + (cartcount % pageSize == 0 ? 0 : 1);
			int blockSize = 10;
			int blockFirst = (nowPage / blockSize - (nowPage % blockSize == 0? 1: 0)) * blockSize + 1 ;
			int blockLast = blockFirst + blockSize - 1;
			if(blockLast > totalPage) {
				blockLast = totalPage;
			}
			List<OrderVO> cartList = orderDAO.getCartList(id, pageFirst, pageSize);
			session.setAttribute("cartList", cartList);
			session.setAttribute("cartcount", cartcount);
			session.setAttribute("total", total);
			request.setAttribute("blockSize", blockSize);
			request.setAttribute("blockFirst", blockFirst);
			request.setAttribute("blockLast", blockLast);
			request.setAttribute("totalPage", totalPage);
			request.setAttribute("nowPage", nowPage);
			
			nextPage = "/mypage/cartList.jsp";
	
		}else if(action.equals("/delCart.do")) {			//장바구니에서 하나씩 삭제
			
			int num = Integer.parseInt(request.getParameter("num"));
			String id = (String)session.getAttribute("id");
			
			OrderDAO orderdao = new OrderDAO();
			
			OrderVO vo = orderdao.selectNum(num);
			
			DetailBean bean = Pservice.getdetails(vo.getDetailnum());
			
			int sub = bean.getTotalreserved() - vo.getQty();
			
			Pservice.UpdateSeat(bean.getDetailnum(), sub);
			
			orderDAO.delCart(num, id); 
			
			PrintWriter pw = response.getWriter();
			checkPage = 1;
			pw.write("<script>");
			pw.write("alert('삭제가 완료 되었습니다.');");
			pw.write("location.href='"+request.getContextPath()+"/Order/cartList.do';");
			pw.write("</script>");

			return;
		}else if(action.equals("/delAllCart.do")) {					//장바구니 전체삭제
			
			String id = (String)session.getAttribute("id");
			
			OrderDAO orderdao = new OrderDAO();
			
			List<OrderVO> orderList = orderdao.selectId(id);
			
			for(int i =0; i<orderList.size(); i++) {
				OrderVO vo = orderList.get(i);
				
				DetailBean bean = Pservice.getdetails(vo.getDetailnum());
				
				int sub = bean.getTotalreserved() - vo.getQty();
				
				Pservice.UpdateSeat(bean.getDetailnum(), sub);
			}
			
			
			orderDAO.delAllCart(id);
			
			PrintWriter pw = response.getWriter();
			checkPage = 1;
			pw.write("<script>");
			pw.write("alert('장바구니 삭제가 완료 되었습니다.');");
			pw.write("location.href='"+request.getContextPath()+"/Order/cartList.do';");
			pw.write("</script>");
			
			return;
			
		}else if(action.equals("/Payment.do")) {	//결제테이블에 하나의 선택한 장바구니상품 추가
			String id = request.getParameter("id");
			int num = Integer.parseInt(request.getParameter("num"));
			
			OrderVO payVO = orderDAO.getPayInfo(id, num);
			
			request.setAttribute("payVO", payVO);
			
			nextPage = "/mypage/payment.jsp";
			
		}else if(action.equals("/PaymentAction.do")) {	//주문테이블 한개를 결제
			PrintWriter pw = response.getWriter();
			String id = request.getParameter("id");
			int num = Integer.parseInt(request.getParameter("num"));
			OrderVO payVO = new OrderVO();
			memberBean = memberDAO.getMember(id);
			int point = memberBean.getPoint();
			payVO = orderDAO.getPayInfo(id, num);
			int totalprice = payVO.getTotalprice();
			
			if(point < totalprice) {
				pw.write("<script>");
				pw.write("alert('보유한 포인트가 결제금액보다 적습니다.');");
				pw.write("location.href='"+request.getContextPath()+"/index/index.jsp';");
				pw.write("</script>");
				return;
			}else {
				orderDAO.payResult(id, num, totalprice);
				orderDAO.addPayment(payVO);
				orderDAO.delCart(num, id);
				
				nextPage = "/index/index.jsp";
			}
			
			
		}else if(action.equals("/payList.do")) { // 내 결제내역보기
			String id = (String)session.getAttribute("id");
			
			int total = orderDAO.getCountPay(id); 
			
			int pageSize = 5;
			int nowPage = 1;
			if(request.getParameter("nowPage") != null) {
				nowPage = Integer.parseInt(request.getParameter("nowPage"));
			}
			int pageFirst = (nowPage - 1) * pageSize;
			int totalPage = total / pageSize + (total % pageSize == 0 ? 0 : 1);
			int blockSize = 10;
			int blockFirst = (nowPage / blockSize - (nowPage % blockSize == 0 ? 1 : 0)) * blockSize + 1;
			int blockLast = blockFirst + blockSize - 1;
			if(blockLast > totalPage) {
				blockLast = totalPage;
			}
			
			List<OrderVO> paymentList = orderDAO.getPaymentList(id, pageFirst, pageSize);
			int totalpayprice = orderDAO.getTotalPayPrice(id);
			request.setAttribute("paymentList", paymentList);
			request.setAttribute("totalpayprice", totalpayprice);
			request.setAttribute("blockSize", blockSize);
			request.setAttribute("blockFirst", blockFirst);
			request.setAttribute("blockLast", blockLast);
			request.setAttribute("totalPage", totalPage);
			request.setAttribute("nowPage", nowPage);
			
			nextPage = "/mypage/paymentList.jsp";
			
		}else if(action.equals("/paydel.do")) {	//결제내역에서 해당 id의 결제번호에 해당하는 내역 삭제
			String id = request.getParameter("id");
			int p_num = Integer.parseInt(request.getParameter("p_num"));
			
			orderDAO.delPay(p_num, id);
			
			PrintWriter pw = response.getWriter();
			checkPage = 1;
			pw.write("<script>");
			pw.write("alert('삭제가 완료 되었습니다.');");
			pw.write("location.href='"+request.getContextPath()+"/Order/payList.do';");
			pw.write("</script>");

			return;
			
		}else if(action.equals("/payAlldel.do")) { // 결제내역 전체 삭제
			String id = request.getParameter("id");
			
			orderDAO.delAllpay(id);
			
			PrintWriter pw = response.getWriter();
			checkPage = 1;
			pw.write("<script>");
			pw.write("alert('전체 결제내역 삭제가 완료 되었습니다.');");
			pw.write("location.href='"+request.getContextPath()+"/Order/payList.do';");
			pw.write("</script>");
			return ;
			
		}else if(action.equals("/AllPayment.do")) { //장바구니 전체내역을 결제
			String id = (String)request.getSession().getAttribute("id");
			PrintWriter pw = response.getWriter();
			List<OrderVO> list = orderDAO.getPayInfo1(id);
			memberBean = memberDAO.getMember(id);
			int point = memberBean.getPoint();		//내가 보유한 point 
			OrderVO payVO = new OrderVO();
			int totalprice = orderDAO.getTotalPrice(id);  //해당id의 장바구니 전체 결제금액얻기 
			if(point < totalprice) {
				pw.write("<script>");
				pw.write("alert('보유한 포인트가 결제금액보다 적습니다.');");
				pw.write("location.href='"+request.getContextPath()+"/index/index.jsp';");
				pw.write("</script>");
				return;
			}else {
				orderDAO.AllpayResult(id, totalprice);
				
				orderDAO.addAllPay(list);	//장바구니에 있는 내역 전체 결제			
				
				orderDAO.delAllCart(id);    //결제완료 후 장바구니 내역삭제
				point = memberBean.getPoint();	
				System.out.println("결제후 내 포인트 : " + point);
				
				checkPage = 1;
				pw.write("<script>");
				pw.write("alert('전체 결제가 완료 되었습니다.');");
				pw.write("location.href='"+request.getContextPath()+"/Order/payList.do';");
				pw.write("</script>");
				
				return;
			}
		}else if(action.equals("/kakaoOrder.do")) {
			String id = (String)session.getAttribute("id");
			int num = Integer.parseInt(request.getParameter("num"));
			
			OrderVO payVO = new OrderVO();
			payVO = orderDAO.getPayInfo(id, num);
			request.setAttribute("payVO", payVO);
			nextPage = "/product/kakaoPay.jsp";
			
			
		}else if(action.equals("/kakaoOrder2.do")) {
			PrintWriter pw = response.getWriter();
			String id = (String)session.getAttribute("id");
			int num = Integer.parseInt(request.getParameter("num"));
			OrderVO payVO = new OrderVO();
			memberBean = memberDAO.getMember(id);
			int point = memberBean.getPoint();
			payVO = orderDAO.getPayInfo(id, num);
			int totalprice = payVO.getTotalprice();
			checkPage = 1;
			orderDAO.addPayment(payVO);
			orderDAO.delCart(num, id);
			
			request.setAttribute("msg", "결제가 완료되었습니다.");
			
			pw.write("<script>");
			pw.write("alert('결제가 완료 되었습니다.');");
			pw.write("location.href='"+request.getContextPath()+"/Order/payList.do';");
			pw.write("</script>");
			
			return;
		}
		
		if(checkPage == 0) {
			request.getRequestDispatcher(nextPage).forward(request, response);
		}else {
			response.sendRedirect(request.getContextPath()+nextPage);
		}
		
	}
}
