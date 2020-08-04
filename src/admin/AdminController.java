package admin;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Date;
import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Enumeration;
import java.util.List;
import java.util.UUID;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import Order.OrderDAO;
import Product.DetailBean;
import Product.DetailDAO;
import Product.ProductBean;
import Product.ProductDAO;
import coupon.CouponBean;
import coupon.CouponDAO;
import event.EventBean;
import event.EventDAO;
import member.LikeBean;
import member.LikeDAO;
import member.MemberBean;
import member.MemberDAO;
import noticeboard.NoticeboardBean;
import noticeboard.NoticeboardDAO;
import team.faqboard.faqBean;
import team.faqboard.faqDao;
import team.qnaboard.qnaBean;
import team.qnaboard.qnaDao;


@WebServlet("/admin/*")
public class AdminController extends HttpServlet{

	AdminDAO adminDAO = new AdminDAO();
	AdminBean adminBean = new AdminBean();
	NoticeboardBean noticebean = new NoticeboardBean();
	NoticeboardDAO noticeDAO = new NoticeboardDAO();
	
	
		@Override
		protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
			doHandle(request, response);
		}
		
		@Override
		protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
			doHandle(request, response);
		}
		
		@SuppressWarnings("unchecked")
		protected void doHandle(HttpServletRequest request, HttpServletResponse response) 
				throws ServletException, IOException {
			
			qnaBean qnaBean = new qnaBean();
			qnaDao qnaDao = new qnaDao();
			
			
			//MVC 중 View이름을 저장할 변수
			String nextPage = "";
			//한글처리
			request.setCharacterEncoding("utf-8");
			//클라이언트의 웹브라우저로 응답할 데이터 유형 설정
			response.setContentType("text/html;charset=utf-8");
			
			//요청 URL중 2단계 요청 주소를 알아내온다
			String action = request.getPathInfo();  
			System.out.println("action : " + action);
			
			//디스패처 방식, 리다이렉트 방식 결정
			int checkPage =0;
			List<AdminBean> articlesList = null;
			
			if(action.equals("/adminPage.do")) { 
				
				nextPage = "/admins/adminMain.jsp";
				
			//회원정보 전체 조회
			} else if(action.equals("/MemberManager.do")) {
				//회원 아이디 검색값 받아오기
				String search = "";
				if(request.getParameter("search")==null) {
					search = "";
				} else {
					search = request.getParameter("search");
				}
				
				String selectserach = request.getParameter("selectserach");
				
				System.out.println(selectserach);
				System.out.println(search);
				AdminDAO adminDAO = new AdminDAO();
				
				//페이징 처리 변수
				//회원 총 수 구해오기
				int total = adminDAO.AllMemberCount(search); //회원 총 수
				int pageSize = 10; // 한 페이지당 출력할 게시물 수
				int nowPage = 1; // 현재 페이지
				if(request.getParameter("nowpage") != null) {
					nowPage = Integer.parseInt(request.getParameter("nowpage"));
				}
				int startRow = (nowPage-1)*pageSize; // 첫 번째 게시물 번호
				int endRow = pageSize; // 마지막 게시물 번호 
				int blocksize = 5; // 페이징 네비 사이즈
				int totalPage = total / pageSize + (total%pageSize==0? 0:1); // 총 페이지 수
				int blockfirst = ((nowPage/blocksize)-(nowPage%blocksize==0?1:0)) * blocksize + 1; // 페이징 네비 첫번째 번호
				int blocklast = blockfirst+blocksize-1; // 페이징 네비 마지막 번호
				if(blocklast > totalPage) { // 총 페이지수보다 블럭라스터값이 더 클때 totalPage(총 페이지 수)가 blocklast로된다.
					blocklast = totalPage;
				}
				
				List<AdminBean> list = null;
				
				//회원 전체 정보 조회
				//list에 멤버정보를 담음
				if(selectserach == null) {
					list = adminDAO.getAllmember(startRow, endRow, search);
				} else {
					list = adminDAO.getAllmember(startRow, endRow, search, selectserach);
				}
				
				String id = "test";
				
				//회원정보
				request.setAttribute("list", list);
				
				//페이징 변수
				request.setAttribute("total", total);
				System.out.println(total);
				request.setAttribute("nowpage", nowPage);
				request.setAttribute("blockfirst", blockfirst);
				request.setAttribute("blocksize", blocksize);
				request.setAttribute("blocklast", blocklast);
				request.setAttribute("totalPage", totalPage);
				
				nextPage = "/admins/adminManager.jsp";
				System.out.println(action);
			
			//회원 삭제 요청 (관리자 페이지)
			} else if(action.equals("/MemberDel.do")) {
				
				String[] id = request.getParameterValues("check"); //getParameterValues는 배열값을 받아올때 사용한다 .
				for (int i=0; i<id.length; i++) {
					System.out.println(id[i]);
					adminDAO.MemberDelete(id[i]);
					
				}
				
				nextPage= "/admin/MemberManager.do";
				
			} else if(action.equals("/AMemberView.do")) {
				
				qnaDao qnadao = new qnaDao();
				OrderDAO orderDAO = new OrderDAO();
				LikeDAO likeDAO = new LikeDAO();
				
				String id =request.getParameter("id");
				String nowpage = request.getParameter("nowpage"); 
//				System.out.println(nowpage);
//				System.out.println(id);
				adminBean = adminDAO.MemberView(id);
				int total = qnadao.getAllQna(id);
				int cartcount =orderDAO.getCountCartList(id);
				int liketotal = likeDAO.getTotal(id); 
//				System.out.println(adminBean.getEmail());
//				System.out.println(adminBean.getId());
				request.setAttribute("memberInfo", adminBean);
				request.setAttribute("nowpage", nowpage);
				request.setAttribute("total", total);
				request.setAttribute("cartcount", cartcount);
				request.setAttribute("liketotal", liketotal);
				
				
				nextPage = "/admins/AmemberView.jsp";
			
			//회원 정보 수정 관리 요청
			} else if(action.equals("/MemberUpdate.do")) {
				
				MemberBean memberInfo = new MemberBean();
				int result = 0;
				
				memberInfo.setId(request.getParameter("id"));
				memberInfo.setPassword(request.getParameter("password"));
				memberInfo.setName(request.getParameter("name"));
				memberInfo.setPhone(request.getParameter("phone"));
				memberInfo.setEmail(request.getParameter("email"));
				
				
				memberInfo.setStatus(Integer.parseInt(request.getParameter("status")));
				memberInfo.setIs_admin(Integer.parseInt(request.getParameter("admin")));
				
				result = adminDAO.MemberUpdate(memberInfo);
				
				nextPage= "/admin/MemberManager.do";
				
			} else if(action.equals("/MemberDelete.do")) {
				int result = 0;
				String id = request.getParameter("id");
				System.out.println(id);
				result = adminDAO.MemberDelete(id);
				
				nextPage= "/admin/MemberManager.do";
				
			} else if(action.equals("/MemberSearch.do")) {
				
				
				String search = request.getParameter("search");
				System.out.println(search);
				
				AdminDAO adminDAO = new AdminDAO();
				
				nextPage = "/admins/adminManager.jsp";
				
			//상품관리 페이지 이동
			} else if(action.equals("/ProductMan.do")) {
				
				nextPage = "/admins/productManager.jsp";
				
			//이벤트 관리 페이지 이동
			} else if(action.equals("/EventMan.do")) {
				
				nextPage = "/admins/EventManager.jsp";
				
			//고객 관리 페이지 이동
			} else if(action.equals("/CustomerMan.do")) {
				
				nextPage = "/admins/CustomerManager.jsp";
			
			//문의 답변 페이지 이동
			} else if(action.equals("/Answer.do")) {
				
				nextPage = "/admins/Answer.jsp";
				
			//관리자 페이지 고객센터 관리 페이지 이동 	
			} else if (action.equals("/ANoticeMain.do")) {
				
				String catecheck = "";
				
				String n_cate = request.getParameter("n_cate");
				
				if(n_cate == null ) {
					catecheck = "0";
				} else if(n_cate.equals("서비스 소식")	) {
					catecheck = "1";
				}else if(n_cate.equals("서비스 점검")) {
					catecheck = "2";
				}else if(n_cate.equals("안내")) {
					catecheck = "3";
				}else if(n_cate.equals("전체")) {
					catecheck = "4";
					n_cate = null;
				}
				
				
				String n_title = request.getParameter("n_title");
				String n_date = request.getParameter("n_date");
				if(request.getParameter("check") != null) {
				int check = Integer.parseInt(request.getParameter("check"));
				if(check == 1) {
					n_cate = null;
				 }
				}
				int total = noticeDAO.getAllNotice();
				System.out.println(total);

				if(n_cate != null )total = noticeDAO.getAllnotice(n_cate);
				System.out.println(total);			
				
				int pageSize = 10;
				int nowPage = 1;
				if(request.getParameter("nowPage") != null) nowPage = Integer.parseInt(request.getParameter("nowPage"));
				
				int pageFirst = (nowPage-1) * pageSize;
				int totalPage = total/pageSize + (total%pageSize==0?0:1);
				int blockSize = 5;
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
					request.setAttribute("catecheck", catecheck);
				
				nextPage = "/admins/AnoticeMain.jsp";
				
			//관리자 페이지 공지사항 작성페이지 이동	
			} else if(action.equals("/Writepage.do")) {
				
					nextPage = "/admins/Awrite.jsp";
					
			//관리자 페이지 글 추가
			} else if(action.equals("/ANoticewrite.do")) {
				
				
				String n_cate = request.getParameter("n_cate");
				System.out.println(n_cate);
				String n_title = request.getParameter("n_title");
				String n_content = request.getParameter("n_content");
				System.out.println(n_content);
				checkPage = 1;
				noticebean.setN_cate(n_cate);
				noticebean.setN_title(n_title);
				noticebean.setN_content(n_content);
				noticebean.setN_date(new Timestamp(System.currentTimeMillis()));
				
				noticeDAO.insertNoticeboard(noticebean);
				
				nextPage = "/admin/ANoticeMain.do";
			
			//관리자 페이지 공지 글 상세보기
			} else if(action.equals("/AviewNotice.do")) {
				
				String n_num = request.getParameter("n_num");
				
				noticebean = noticeDAO.viewNotice(Integer.parseInt(n_num));
				request.setAttribute("notice", noticebean);
				
				nextPage = "/admins/AviewNotice.jsp";
				
			//관리자 페이지 글 수정 페이지 이동
			} else if(action.equals("/AmodNoticePage.do")) {
				String n_num = request.getParameter("n_num");
				noticebean = noticeDAO.viewNotice(Integer.parseInt(n_num));
				request.setAttribute("notice", noticebean);
				
				nextPage = "/admins/AnoticeModify.jsp";
			
			//checkPage
			//관리자 페이지 공지사항 글 수정	
			} else if(action.equals("/AmodNotice.do")) {
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
				
//				if(result == 0) { // 수정실패
//					PrintWriter pw = response.getWriter();
//					pw.print("<script>");
//					pw.print("alert('수정실패 !')");
//					pw.print("history.go(-1);");
//					pw.print("</script>");
//				}else { // 수정성공
//					
//					PrintWriter pw = response.getWriter();
//					pw.print("<script>");
//					pw.print("alert('수정성공 !')");
//					pw.print("</script>");
//				}
//				
				
				nextPage = "/admin/ANoticeMain.do";
			
			//관리자 페이지 공지사항 글 삭제
			} else if(action.equals("/AdeleteNotice.do")) {
				
				int n_num = Integer.parseInt(request.getParameter("n_num")); 
				System.out.println(n_num);
				noticeDAO.deleteNoticeboard(n_num);
				checkPage = 1;
				nextPage = "/admin/ANoticeMain.do";
				
			} else if(action.equals("/test3.do")) {
				
				System.out.println("파일");
//				PrintWriter out = response.getWriter();
				ServletContext ctx = getServletContext();
				 // 이미지 업로드할 경로
				String uploadPath = ctx.getRealPath("upload");
				System.out.print(uploadPath);
			    int size = 10 * 1024 * 1024;  // 업로드 사이즈 제한 10M 이하
				String fileName = ""; // 파일명
				try{
			        // 파일업로드 및 업로드 후 파일명 가져옴
					MultipartRequest multi = new MultipartRequest(request, uploadPath, size, "utf-8", new DefaultFileRenamePolicy());
					Enumeration files = multi.getFileNames();
					String file = (String)files.nextElement(); 
					fileName = multi.getFilesystemName(file); 
					
				}catch(Exception e){
					e.printStackTrace();
				}
				
			    // 업로드된 경로와 파일명을 통해 이미지의 경로를 생성
				String uploadPath1 = "http://localhost:8090/PP/upload/"+fileName;
				
				
				JSONArray Array = new JSONArray();
				JSONObject Info = new JSONObject();
				Info.put("url", uploadPath1);
				Array.add(Info);
				
				JSONObject result = new JSONObject();
				
				result.put("List", Array);
				
				PrintWriter out = response.getWriter();
				
				String jsonInfo = result.toString();
				
				out.print(jsonInfo);
				
				return;
				
			    // 생성된 경로를 JSON 형식으로 보내주기 위한 설정
//				JSONObject jobj = new JSONObject();
//				jobj.put("url", uploadPath1);
//				
//				response.setContentType("application/json"); // 데이터 타입을 json으로 설정하기 위한 세팅
//				out.print(jobj.toJSONString());
//				
//				return;
				
			//문의 답변 수정 메인 페이지
			} else if(action.equals("/Aqnaboardp.do")) {
				 
				 qnaDao qnadao = new qnaDao();
				 qnaBean qnabean = new qnaBean();
				
				 String id =(String)request.getSession().getAttribute("id");
		         int status = Integer.parseInt(request.getParameter("status"));
		         
		         
		         int total = qnadao.getAllQna(status);
		         System.out.println(total);
		         
		         MemberBean mb = new MemberBean();
		         
		         
		         int pageSize = 10;
		         int nowPage = 1;
		         if(request.getParameter("nowPage") != null) nowPage = Integer.parseInt(request.getParameter("nowPage"));
		         
		         int pageFirst = (nowPage-1) * pageSize;
		         int totalPage = total/pageSize + (total%pageSize==0?0:1);
		         int blockSize = 10;
		         int blockFirst = (nowPage/blockSize-(nowPage%blockSize==0?1:0))*blockSize + 1;
		         int blockLast = blockFirst + blockSize -1;
		         
		         if(blockLast>totalPage) blockLast=totalPage;
		         List<qnaBean> qnaList = qnadao.qnaList(pageFirst, pageSize, status);
		         request.setAttribute("qnaList", qnaList);
		         request.setAttribute("blockSize", blockSize);
		         request.setAttribute("blockFirst", blockFirst);
		         request.setAttribute("blockLast", blockLast);
		         request.setAttribute("totalPage", totalPage);
		         request.setAttribute("nowPage", nowPage);
		         request.setAttribute("status", status);

		         nextPage = "/admins/AqnaBoard.jsp";
		    
			//문의 답변 수정하는 페이지
			} else if(action.equals("/AqnaAnswer.do")) {
				
				 qnaBean qnabean = new qnaBean();
				 qnaDao qnadao = new qnaDao();
				
				 int qna_num =Integer.parseInt(request.getParameter("qna_num"));
		         qnabean = qnadao.getqna(qna_num);
		         
		         request.setAttribute("qnaUpdate", qnabean);
		         
		         nextPage = "/admins/AqnaAnswer.jsp";
		         
		    //checkPage
		    //문의 답변 달기 실행
			} else if(action.equals("/AqnaUpdate.do")) {
				
				checkPage = 1;
				int qna_num = Integer.parseInt(request.getParameter("qna_num"));
		         
		         int status = Integer.parseInt(request.getParameter("status"));
		         String cate = request.getParameter("cate");
		         String title = request.getParameter("title");
		         String contents = request.getParameter("contents");
		         String answer = request.getParameter("answer");
		         
		         
		         qnaBean.setQna_num(qna_num);
		         qnaBean.setQna_cate(cate);
		         qnaBean.setQna_status(status);
		         qnaBean.setQna_title(title);
		         qnaBean.setQna_contents(contents);
		         qnaBean.setAnswer(answer);
		         
		         int result = qnaDao.updateQnaBoard(qnaBean);
		         System.out.println(result);
		         
		         nextPage = "/admin/Aqnaboardp.do?status=1";
		         
		    //답변 수정 실행
			} else if(action.equals("/AqnaAnswerMod.do")) {
				

				 qnaBean qnabean = new qnaBean();
				 qnaDao qnadao = new qnaDao();
				
				 int qna_num =Integer.parseInt(request.getParameter("qna_num"));
		         qnabean = qnadao.getqna(qna_num);
		         
		         request.setAttribute("qnaUpdate", qnabean);
				
				 nextPage = "/admins/AqnaAnswerMod.jsp";
				 
			//qna게시판 글 삭제	
			} else if(action.equals("/Aqnadelete.do")) {
				
				int qna_num = Integer.parseInt(request.getParameter("qna_num"));
		         System.out.println(qna_num); 
		         qnaDao.deleteQna(qna_num);
		         
		         nextPage = "/admin/Aqnaboardp.do?status=0";
				
			//상품 관리 페이지(메인) 이동
			} else if(action.equals("/AproductMain.do")) {
				
				int checkajax = 0;
				
				
				ProductDAO dao = new ProductDAO();
				int total = dao.getCount();
				int pageSize = 10;
		         int nowPage = 1;
		         if(request.getParameter("nowPage") != null) nowPage = Integer.parseInt(request.getParameter("nowPage"));
		         
		         int pageFirst = (nowPage-1) * pageSize;
		         int totalPage = total/pageSize + (total%pageSize==0?0:1);
		         int blockSize = 10;
		         int blockFirst = (nowPage/blockSize-(nowPage%blockSize==0?1:0))*blockSize + 1;
		         int blockLast = blockFirst + blockSize -1;
		         
		         if(blockLast>totalPage) blockLast=totalPage;
		         request.setAttribute("blockSize", blockSize);
		         request.setAttribute("blockFirst", blockFirst);
		         request.setAttribute("blockLast", blockLast);
		         request.setAttribute("totalPage", totalPage);
		         request.setAttribute("nowPage", nowPage);
				 request.setAttribute("checkajax", checkajax);
				
				
				
				List<ProductBean> list = dao.getList(pageFirst, pageSize);
				request.setAttribute("List",list);
				
				 nextPage = "/admins/AproductMain.jsp";
				 
			//상품 등록 페이지 이동	 
			} else if(action.equals("/AproductAdd.do")) {
				
				nextPage="/admins/AproductAdd.jsp";
			
			
			//상품 등록 	
			} else if(action.equals("/AwritePro.do")) {
				
				ProductBean productBean = new ProductBean();
				ProductDAO dao = new ProductDAO();
				
				
				String realFolder = request.getServletContext().getRealPath("consert");
				int max = 100 * 1024 * 1024;

				MultipartRequest multi = new MultipartRequest(request, realFolder, max, "UTF-8",
						new DefaultFileRenamePolicy());

				Enumeration e = multi.getFileNames();

				ArrayList saveFiles = new ArrayList();

				ArrayList originFiles = new ArrayList();

				while (e.hasMoreElements()) {
					String filename = (String) e.nextElement();

					saveFiles.add(multi.getFilesystemName(filename));

					originFiles.add(multi.getOriginalFileName(filename));

				}

				String name = multi.getParameter("name");
				String genre = multi.getParameter("genre");
				String cla = multi.getParameter("cla");
				int runtime = Integer.parseInt(multi.getParameter("runtime"));
				int price = Integer.parseInt(multi.getParameter("price"));
				Date startdate = Date.valueOf(multi.getParameter("startdate"));
				Date enddate = Date.valueOf(multi.getParameter("enddate"));
				//int qty = Integer.parseInt(request.getParameter("qty"));
				String image = "";
				String content = "";
				if (saveFiles != null) {
					for (int i = 0; i < saveFiles.size(); i++) {
						if (i == 0) {
							content = (String) saveFiles.get(i);
						} else {
							image = (String) saveFiles.get(i);
						}
					}
				}


				productBean = new ProductBean();
				productBean.setName(name);
				productBean.setGenre(genre);
				productBean.setCla(cla);
				productBean.setRuntime(runtime);
				productBean.setPrice(price);
				productBean.setStartdate(startdate);
				productBean.setEnddate(enddate);
				productBean.setImage(image);
				productBean.setContent(content);
				//productBean.setQty(qty);
				dao.insertpro(productBean);


				PrintWriter pw = response.getWriter();
				pw.print("<script>" + "  alert('제품을 추가했습니다.');" + " location.href='" + request.getContextPath()
						+ "/admin/AproductMain.do';" + "</script>");

				return;
				
			//상품 상세 등록 페이지 이동
			}	else if(action.equals("/Adetails.do")) {
				
				ProductBean productBean = new ProductBean();
				ProductDAO dao = new ProductDAO();
				
				int num = Integer.parseInt(request.getParameter("num"));
				System.out.println(num);
				
				productBean = dao.getBoard(num);
				

				request.setAttribute("Bean", productBean);
				

				nextPage = "/admins/AproductDetail.jsp";
			    // 생성된 경로를 JSON 형식으로 보내주기 위한 설정
//				JSONObject jobj = new JSONObject();
//				jobj.put("url", uploadPath1);
//				
//				response.setContentType("application/json"); // 데이터 타입을 json으로 설정하기 위한 세팅
//				out.print(jobj.toJSONString());
//				
//				return;
				
			//문의 답변 수정 메인 페이지
			} else if(action.equals("/Aqnaboardp.do")) {
				 
				 qnaDao qnadao = new qnaDao();
				 qnaBean qnabean = new qnaBean();
				
				 String id =(String)request.getSession().getAttribute("id");
		         
		         int total = qnadao.getAllQna(id);
		         System.out.println(total);
		         
		         MemberBean mb = new MemberBean();
		         
		         
		         int pageSize = 3;
		         int nowPage = 1;
		         if(request.getParameter("nowPage") != null) nowPage = Integer.parseInt(request.getParameter("nowPage"));
		         
		         int pageFirst = (nowPage-1) * pageSize;
		         int totalPage = total/pageSize + (total%pageSize==0?0:1);
		         int blockSize = 10;
		         int blockFirst = (nowPage/blockSize-(nowPage%blockSize==0?1:0))*blockSize + 1;
		         int blockLast = blockFirst + blockSize -1;
		         
		         if(blockLast>totalPage) blockLast=totalPage;
		         List<qnaBean> qnaList = qnadao.qnaList(pageFirst, pageSize, id);
		         request.setAttribute("qnaList", qnaList);
		         request.setAttribute("blockSize", blockSize);
		         request.setAttribute("blockFirst", blockFirst);
		         request.setAttribute("blockLast", blockLast);
		         request.setAttribute("totalPage", totalPage);
		         request.setAttribute("nowPage", nowPage);

		         nextPage = "/admins/AqnaBoard.jsp";
		         
			//문의 답변 수정하는 페이지
			} else if(action.equals("AqnaModify.do")) {
				
				 qnaBean qnabean = new qnaBean();
				 qnaDao qnadao = new qnaDao();
				
				 int qna_num =Integer.parseInt(request.getParameter("qna_num"));
		         qnabean = qnadao.getqna(qna_num);
		         
		         request.setAttribute("qnaUpdate", qnabean);
		         
		         nextPage = "/admins/AqnaModify.jsp";
		    
		    //checkPage
			//상품 상세 등록 페이지
			} else if(action.equals("/AdetailsPro.do")) {
				
				checkPage = 1;
				ProductBean productBean = new ProductBean();
				ProductDAO dao = new ProductDAO();
				DetailBean Bean = new DetailBean();
				DetailDAO Ddao = new DetailDAO();
				
				int num = Integer.parseInt(request.getParameter("num"));
				
				productBean = dao.getBoard(num);
				String place = request.getParameter("place");
				int seat = Integer.parseInt(request.getParameter("seat"));
				int totalreserved = 0;
				Date today = Date.valueOf(request.getParameter("today"));
				String starttime = request.getParameter("starttime");

				
				Bean = new DetailBean();
				Bean.setName(productBean.getName());
				Bean.setGenre(productBean.getGenre());
				Bean.setCla(productBean.getCla());
				Bean.setRuntime(productBean.getRuntime());
				Bean.setPrice(productBean.getPrice());
				Bean.setStartdate(productBean.getStartdate());
				Bean.setEnddate(productBean.getEnddate());
				Bean.setImage(productBean.getImage());
				Bean.setContent(productBean.getContent());
				Bean.setPlace(place);
				Bean.setSeat(seat);
				Bean.setTotalreserved(totalreserved);
				Bean.setToday(today);
				Bean.setStarttime(starttime);
				Bean.setNum(num);
				
				Ddao.insertDetail(Bean);
				
				nextPage = "/admin/AproductMain.do";
				
			//ajax 테스트 	
			} else if(action.equals("/runstatus.do")) {
				ProductDAO dao = new ProductDAO();
				System.out.println("ㅋㅋ전");
				int total = dao.getCount();
				int pageSize = 10;
		         int nowPage = 1;
		         if(request.getParameter("nowPage") != null) nowPage = Integer.parseInt(request.getParameter("nowPage"));
		         int pageFirst = (nowPage-1) * pageSize;
		         int totalPage = total/pageSize + (total%pageSize==0?0:1);
		         int blockSize = 10;
		         int blockFirst = (nowPage/blockSize-(nowPage%blockSize==0?1:0))*blockSize + 1;
		         int blockLast = blockFirst + blockSize -1;
		         
		         if(blockLast>totalPage) blockLast=totalPage;
		         request.setAttribute("blockSize", blockSize);
		         request.setAttribute("blockFirst", blockFirst);
		         request.setAttribute("blockLast", blockLast);
		         request.setAttribute("totalPage", totalPage);
		         request.setAttribute("nowPage", nowPage);
				
				AdminDAO adminDAO = new AdminDAO();
				int runstatus = Integer.parseInt(request.getParameter("runstatus"));
				int num = Integer.parseInt(request.getParameter("num"));
				
				//업데이트 구문
				System.out.println("ㅋㅋ전");
				adminDAO.runChange(runstatus, num);
				System.out.println("ㅋㅋ");
				
				//상품리스트 조회 구문
				List<ProductBean> list = dao.getList(pageFirst, pageSize);
				request.setAttribute("List",list);
				
				
				JSONObject result = new JSONObject();
				JSONArray Array = new JSONArray();
				JSONObject Info;
				SimpleDateFormat transFormat = new SimpleDateFormat("yyyy-MM-dd");
				
				for (int i=0; i<list.size(); i++) {
					
					ProductBean pb = list.get(i);
					Info = new JSONObject();
					Info.put("name", pb.getName());
					Info.put("num", Integer.toString(pb.getNum()));
					Info.put("Genre", pb.getGenre());
					Info.put("cla", pb.getCla());
					Info.put("runtime", Integer.toString(pb.getRuntime()));
					Info.put("price",Integer.toString(pb.getPrice()));
					Info.put("startdate", transFormat.format(pb.getStartdate()));
					Info.put("enddate", transFormat.format(pb.getEnddate()));
					Info.put("image", pb.getImage());
					Info.put("content", pb.getContent());
					Info.put("runtime", Integer.toString(pb.getRunstatus()));
					Array.add(Info);
				}
				System.out.println("ㅋㅋ 끝");
				
				result.put("Plist", Array);
				PrintWriter out = response.getWriter(); // 보내주는 역할
				
				String jsonInfo = result.toString();
				System.out.println("창모");
				out.print(jsonInfo);
				System.out.println("창모2");
//				return;
				nextPage = "/admin/AproductMain.do";
				
			//FAQ 관리페이지 이동
			} else if(action.equals("/AfaqMain.do")) {
				
				faqBean faqbean = new faqBean();
				faqDao faqdao = new faqDao();
				List<faqBean> articlesList2 = new ArrayList<faqBean>();
				
				String search = (request.getParameter("search") != null) ? request.getParameter("search") : "";
				String category = (request.getParameter("category") != null) ? request.getParameter("category") : "";
//				
				int total = faqdao.getfaqCount(search);
				int nowpage = 1 ;
				if(request.getParameter("nowpage") !=null) nowpage = Integer.parseInt(request.getParameter("nowpage"));
				int pagesize = 10 ;
				int startrow = (nowpage-1)*pagesize;
				int endrow = pagesize;
				int totalpage = total/pagesize + (total%pagesize==0?0:1);
				int blocksize = 3;
				int blockfirst = ((nowpage/blocksize)-(nowpage%blocksize==0?1:0))*blocksize+1;
				int blocklast = blockfirst + blocksize -1;
				if(blocklast > totalpage) blocklast = totalpage;
				
				articlesList2 = faqdao.getFaqList(search, startrow, endrow);
				
				int count = total;
				
				request.setAttribute("category", category);
				
				request.setAttribute("articlesList", articlesList2);
				request.setAttribute("count", count);
				//페이징
				request.setAttribute("nowpage", nowpage);
				request.setAttribute("blockfirst", blockfirst);
				request.setAttribute("blocklast", blocklast);
				request.setAttribute("blocksize", blocksize);
				request.setAttribute("totalpage", totalpage);	
				
				
				nextPage = "/admins/AfaqMain.jsp";
				
			//FAQ게시판 글 작성하러 가기	
			} else if(action.equals("/AfaqWrite.do")) {
				
				String check = request.getParameter("check");
				
				request.setAttribute("check", check);
				
				
				
				nextPage = "/admins/AfaqWrite.jsp";
				
			//FAQ 게시판 글 작성 	
			} else if(action.equals("/AfaqWritepro.do")) {
				
				faqBean faqbean = new faqBean();
				faqDao faqdao = new faqDao();
				
				String Rcate = request.getParameter("cate");
				String title = request.getParameter("title");
				String contents = request.getParameter("contents");
				checkPage = 1;

				faqbean.setFaq_cate(Rcate);
				faqbean.setFaq_title(title);
				faqbean.setFaq_contents(contents);
				
				faqdao.insertfboard(faqbean);
				
				nextPage = "/admin/AfaqMain.do";
			
		
			//글 수정 페이지 이동
			} else if(action.equals("/AfaqMod.do")) {
				
				faqBean faqbean = new faqBean();
				faqDao faqdao = new faqDao();
				
				String faq_num = request.getParameter("faq_num");
				faqbean = faqdao.getfaq(Integer.parseInt(faq_num));
				
				request.setAttribute("faqUpdate", faqbean);
				
				nextPage = "/admins/AfaqMod.jsp";
			
			//checkPage	
			//글 수정 	
			} else if(action.equals("/AfaqModpro.do")) {
					
				faqBean faqbean = new faqBean();
				faqDao faqdao = new faqDao();
				
				int faq_num = Integer.parseInt(request.getParameter("faq_num"));
				
				String Rcate = request.getParameter("cate");
				String title = request.getParameter("title");
				String contents = request.getParameter("contents");
				
				faqbean.setFaq_num(faq_num);
				faqbean.setFaq_cate(Rcate);
				faqbean.setFaq_title(title);
				faqbean.setFaq_contents(contents);
				
				int result = faqdao.updatefboard(faqbean);
				
				System.out.println(result);
				
				nextPage = "/admin/AfaqMain.do";
			//FAQ 게시글 삭제	
			} else if(action.equals("/AfaqDel.do")) {
				
				faqBean faqbean = new faqBean();
				faqDao faqdao = new faqDao();
				
				int faq_num = Integer.parseInt(request.getParameter("faq_num"));
				faqdao.deletefboard(faq_num);
				
				request.setAttribute("faqUpdate", faqbean);
				
				nextPage = "/admin/AfaqMain.do";


			//회원정보 페이지내 포인트 업데이트 (에이젝스)	

			} else if(action.equals("/pointupdate.do")) {
				
				
			    int addpoint = Integer.parseInt(request.getParameter("addpoint"));
			    int totalpoint = Integer.parseInt(request.getParameter("totalpoint"));
			    String id = request.getParameter("id");
			    
			    int resultpoint = addpoint + totalpoint;
			    
			    MemberBean b = new MemberBean();
			    MemberDAO d = new MemberDAO();
			    
			    b.setPoint(resultpoint);
			    b.setId(id);
			    
			    d.updatetest(b);
			    
			    PrintWriter pw = response.getWriter();
				JSONObject memberInfo = new JSONObject();
				//회원 한명의 정보를 name/value 쌍으로 저장함
				memberInfo.put("resultpoint", resultpoint);
			    
				request.setAttribute("resultpointT", resultpoint);
				pw.print(memberInfo);
				
				return;
			} else if(action.equals("/MemberPoint.do")) {
				
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
				  
				  nextPage = "/admins/MemberPoint.jsp";
			//포인트 추가	
			} else if(action.equals("/MemberPointAdd.do")) {
				
				String id = request.getParameter("id");
				String name = (String)request.getSession().getAttribute("name");
				
				int point = Integer.parseInt(request.getParameter("point"));
				int num = Integer.parseInt(request.getParameter("num"));
				MemberDAO memberDAO = new MemberDAO();
				MemberBean memberBean = new MemberBean();
				memberBean = memberDAO.getMember(id);
				int totalpoint = memberBean.getPoint();
				
				memberDAO.updatePoint(id, point, num); 	//해당 id의 포인트에 충전할 포인트만큼 추가해줌
				memberDAO.delPoint(id, num);
				
				nextPage = "/admin/MemberPoint.do";
			//포인트 내역 삭제
			} else if(action.equals("/MemberdelPoint.do")) {
				
				String id = request.getParameter("id");
				int num = Integer.parseInt(request.getParameter("num"));
				MemberDAO memberDAO = new MemberDAO();
				MemberBean memberBean = new MemberBean();
				 
				memberDAO.delPoint(id,num);
				
				nextPage = "/admin/MemberPoint.do";
			
			//상품 상세 정보 조회
			} else if(action.equals("/AproductInfo.do")) {
				
				ProductBean productBean = new ProductBean();
				ProductDAO productdao = new ProductDAO();
				DetailDAO detail = new DetailDAO();
				
				int num = Integer.parseInt(request.getParameter("num"));
				String name = request.getParameter("name");
				String id = (String)request.getSession().getAttribute("id");
				productBean = productdao.getBoard(num);
				
				
				System.out.println( "여기야" + name);
				List<DetailBean> detList = detail.getdetail(name);
				request.setAttribute("Bean", detList);
				request.setAttribute("bean", productBean);
				
				nextPage = "/admins/AproductInfo.jsp";
			
			//네이버 로그인
			} else if(action.equals("/NaverTest.do")) {
				
				MemberBean bean = new MemberBean();
				MemberDAO dao = new MemberDAO();
				String name = request.getParameter("name");
				String email = request.getParameter("email");
				int s = email.indexOf("@");
				String id = email.substring(0, s);
				String password = id+"1234";
				int nst = Integer.parseInt(request.getParameter("nst"));
				
				
				
				//최초로그인 ? 체크
				int check = dao.NaverUserCheck(id);
				
				
				// check == 1 아이디있음 , check == 0 아이디 없음 
				if(check == 1) {
						System.out.println("아이디 체크");
						request.getSession().setAttribute("id", id);
						request.getSession().setAttribute("name",name);
						PrintWriter pw = response.getWriter();
						
						nextPage = "/index/index.jsp";
						
				} else {
					
					System.out.println("아이디 없음");
					bean.setId(id);
					bean.setPassword(password);
					bean.setName(name);
					bean.setEmail(email);
					
					//아이디없을시 회원추가
					dao.insertMember2(bean);
					
					//로그인 action
					int check2 =dao.login(id, password); 
					System.out.println(check2);
					if(check2 == 1) {
						System.out.println("아이디 있음");
						
						request.getSession().setAttribute("id", id);
						request.getSession().setAttribute("name",name);
						PrintWriter pw = response.getWriter();
						
						nextPage = "/index/index.jsp";
					}
					
				}
					
				
			//회원신고 관리 페이지 이동	
			} else if(action.equals("/BBiBBOBBiBBo.do")) {
				
				nextPage = "/admins/BBiBBOBBiBBo.jsp";
			
			//이벤트 페이지 이동	
			} else if(action.equals("/AeventMain.do")) {
				
				EventDAO edao = new EventDAO();
				
				int total = edao.getAllEvent();
				System.out.println(total);
				
				int pageSize = 10;
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
				
				nextPage = "/admins/AeventMain.jsp";
			//이벤트 등록 페이지 이동
			} else if(action.equals("/AeventWrite.do")) {
				
				String check = request.getParameter("check");
				
				request.setAttribute("check", check);
				
				nextPage = "/admins/AeventWrite.jsp";
			
			//이벤트 등록
			} else if(action.equals("/AinsertEvent.do")) {
				
				EventBean ebean = new EventBean();
				EventDAO edao = new EventDAO();
				
				
				checkPage = 1;	
				ServletContext ctx = getServletContext();	
				String realPath = ctx.getRealPath("/event/image/");
				int max = 10 * 1024 * 1024;
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
				
				nextPage = "/admin/AeventMain.do";
			
			//이벤트 수정페이지 이동
			} else if(action.equals("/AmodEventForm.do")) {
				

				 EventBean ebean = new EventBean();
				 EventDAO edao = new EventDAO();
				
				 String e_num = request.getParameter("e_num");
		         ebean = edao.viewEvent(Integer.parseInt(e_num));
		         
		        
					
					nextPage = "/admins/AmodEventForm.jsp";	
		         
		         
		      //이벤트 수정	
			} else if(action.equals("/AmodEvent.do")) {
				
				EventBean ebean = new EventBean();
				EventDAO edao = new EventDAO();
				
				int e_num = Integer.parseInt(request.getParameter("e_num"));
				
				ServletContext ctx = getServletContext();	
				String realPath = request.getServletContext().getRealPath("/event/image/");
				int max = 10 * 1024 * 1024;
		  		MultipartRequest multi = new MultipartRequest(request, realPath, max, "UTF-8", new DefaultFileRenamePolicy());			
				
		  		String e_title = multi.getParameter("e_title");
				
				Date e_startdate = Date.valueOf(multi.getParameter("e_startdate"));
				
				Date e_enddate = Date.valueOf(multi.getParameter("e_enddate"));
				
				String e_file = multi.getFilesystemName("e_file");
				
				String e_content = multi.getParameter("e_content");
				
				EventBean evbean = new EventBean();
				evbean.setE_num(e_num);
				evbean.setE_title(e_title);
				evbean.setE_startdate(e_startdate);
				evbean.setE_enddate(e_enddate);
				evbean.setE_file(e_file);
				evbean.setE_content(e_content);
			
				edao.modEvent(evbean);
				
				nextPage = "/admin/AeventMain.do";
			
			//이벤트 삭제
			} else if(action.equals("/AdeleteEvent.do")) {
				
				EventBean ebean = new EventBean();
				EventDAO edao = new EventDAO();
				
				int e_num = Integer.parseInt(request.getParameter("e_num"));
				edao.deleteEvent(e_num);
				
				nextPage = "/admin/AeventMain.do";
			//쿠폰 메인 페이지 이동	
			} else if(action.equals("/AcouponMain.do")) {
				
				CouponDAO couponDAO = new CouponDAO();
				
				
				int total = couponDAO.getAllEvent();
				
				int pageSize = 10;
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
				
				nextPage = "/admins/AcouponMain.jsp";
				
			//쿠폰 등록 페이지 이동	
			} else if(action.equals("/AcouponWrite.do")) {
				
				String check = request.getParameter("check");
		         
		        request.setAttribute("check", check);
				
				nextPage = "/admins/AcouponWrite.jsp";
				
			//쿠폰 등록 하기	
			} else if(action.equals("/AinsertCoupon.do")) { 
				
				CouponBean couponBean = new CouponBean();
				CouponDAO couponDAO = new CouponDAO();
				
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
				
				nextPage = "/admin/AcouponMain.do";
				
			//쿠폰 글 수정 페이지 이동
			} else if(action.equals("/AmodcouponForm.do")) {
				
				CouponBean couponBean = new CouponBean();
				CouponDAO couponDAO = new CouponDAO();
				
				int event_num = Integer.parseInt(request.getParameter("event_num"));
				
				couponBean = couponDAO.getEventNum(event_num);
				
				request.setAttribute("couponBean", couponBean);
				
				nextPage = "/admins/AmodcouponForm.jsp";
			//쿠폰 수정 	
			} else if(action.equals("/AmodCoupon.do")) {
				
				CouponBean couponBean = new CouponBean();
				CouponDAO couponDAO = new CouponDAO();
				
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
				
				nextPage = "/admin/AcouponMain.do";
				
			} else if(action.equals("/AdeleteCoupon.do")) {
				
				CouponDAO couponDAO = new CouponDAO();
				int event_num = Integer.parseInt(request.getParameter("event_num"));
				
				
				couponDAO.eventDelete(event_num);
				
				nextPage = "/admin/AcouponMain.do";
			}
			
			
			
			
			//디스패치 방식으로 포워딩 (재요청)
			if(checkPage == 0) {
				request.getRequestDispatcher(nextPage).forward(request, response);
			}else {
				response.sendRedirect(request.getContextPath()+nextPage); //물어보기 이 상태로 request에 보낸값들 들고 갈수있는지
			} 
			
		}// doHandle END
			
}
