package Product;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Date;
import java.sql.Time;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Enumeration;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;
//import com.sun.glass.ui.Application;

import Order.OrderService;
import Order.OrderDAO;
import Order.OrderVO;
import member.LikeDAO;

@SuppressWarnings("serial")
@WebServlet("/Proser/*")
public class ProductServlet extends HttpServlet {

	ProductService productService;
	ProductBean productBean;
	DetailBean Bean;
	ReplyVO vo;

	public void init(ServletConfig config) throws ServletException {
		productService = new ProductService();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doHandle(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doHandle(request, response);
	}

	@SuppressWarnings({ "unchecked", "rawtypes" })
	protected void doHandle(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String nextPage = "";
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html; charset=utf-8");
		HttpSession session = request.getSession();
		String action = request.getPathInfo();
		System.out.println(action);
		int checkPage = 0;
		try {

			if (action.equals("/imcontact.do")) {

				List<ProductBean> list = productService.getList();
				request.setAttribute("List",list);

				nextPage = "/product/imcontact.jsp";

			}else if (action.equals("/imcontact2.do")) {
				String search = request.getParameter("sear");
				
				List<ProductBean> list = productService.getList(search);
				request.setAttribute("List",list);

				nextPage = "/product/imcontact2.jsp";
				
			}else if (action.equals("/write.do")) {
				nextPage = "/product/write.jsp";
			} else if (action.equals("/writePro.do")) {
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
				productService.insert(productBean);
				checkPage = 1;

				PrintWriter pw = response.getWriter();
				pw.print("<script>" + "  alert('제품을 추가했습니다.');" + " location.href='" + request.getContextPath()
						+ "/Proser/imcontact.do';" + "</script>");

				return;

			} else if (action.equals("/content.do")) {
				int num = Integer.parseInt(request.getParameter("num"));
				String name = request.getParameter("name");
				String id = (String)session.getAttribute("id");
				productBean = productService.getBoard(num);
				DetailDAO ddao = new DetailDAO();
				DetailBean dbean = new DetailBean();
				
				dbean = ddao.getdetails2(num);
				
				request.setAttribute("detailList", dbean);
				
				
				LikeDAO likeDAO = new LikeDAO();
				boolean checkZ = likeDAO.checkLike(num, id);
				int likeCount = likeDAO.getProductTotalLike(num);
				request.setAttribute("Bean", productBean);
				request.setAttribute("likeCount", likeCount);
				request.setAttribute("checkZ", checkZ);
				//request.setAttribute("pageNum", pageNum);

				nextPage = "/product/content.jsp";

			} else if (action.equals("/delete.do")) {
				int num = Integer.parseInt(request.getParameter("num"));
				String image = request.getParameter("image");
				String content = request.getParameter("content");
				String path = request.getParameter("path");

				File file;
				String del;

				del = request.getServletContext().getRealPath(path) + "/" + image;

				file = new File(del);

				if (file.exists()) {
					file.delete();
				}

				del = request.getServletContext().getRealPath(path) + "/" + content;

				file = new File(del);

				if (file.exists()) {
					file.delete();
				}
				productBean = productService.getBoard(num);
				productService.detaildelete(productBean.getName());
				productService.delete(num);
				productService.replydelete(num);
				
				nextPage = "/Proser/imcontact.do";
			} else if (action.equals("/details.do")) {

				int num = Integer.parseInt(request.getParameter("num"));

				productBean = productService.getBoard(num);


				request.setAttribute("Bean", productBean);
				

				nextPage = "/product/details.jsp";
			} else if (action.equals("/detailsPro.do")) {
				int num = Integer.parseInt(request.getParameter("num"));
				productBean = productService.getBoard(num);
				String place = request.getParameter("place");
				int seat = Integer.parseInt(request.getParameter("seat"));
				int totalreserved = 0;
				Date today = Date.valueOf(request.getParameter("today"));
				String starttime = request.getParameter("starttime");
				checkPage = 1;

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

				productService.insertDetail(Bean);
				System.out.println(productBean.getName());
 
				nextPage = "/Proser/content.do?num="+num+"&name="+productBean.getName();
			}else if(action.equals("/Allreply.do")) {
				int pronum = Integer.parseInt(request.getParameter("pronum"));
				List<ReplyVO> list = productService.getreply(pronum);
				
				JSONObject result = new JSONObject();

				JSONArray Array = new JSONArray();
				JSONObject Info;
				SimpleDateFormat transFormat = new SimpleDateFormat("yyyy-MM-dd");
				
				for(int i=0;i<list.size();i++) {
					ReplyVO vo = list.get(i);
					Info = new JSONObject();
					Info.put("replynum", Integer.toString(vo.getReplynum()));
					Info.put("parentsnum", Integer.toString(vo.getParentsnum()));
					Info.put("productnum", Integer.toString(vo.getProductnum()));
					Info.put("id", vo.getId());
					Info.put("content", vo.getContent());
					Info.put("uploaddate", transFormat.format(vo.getDate()));
					Array.add(Info);
				}
				
				result.put("List", Array);
				PrintWriter out = response.getWriter();
				
				String jsonInfo = result.toString();
				
				out.print(jsonInfo);
				
				return;
			} else if(action.equals("/reply.do")){
				int pronum = Integer.parseInt(request.getParameter("pronum"));
				int parentsnum = Integer.parseInt(request.getParameter("parentsnum"));
				String id = (String)session.getAttribute("id");
				String content = request.getParameter("content");
				checkPage = 1;
				vo = new ReplyVO();
				vo.setProductnum(pronum);
				vo.setParentsnum(parentsnum);
				vo.setId(id);
				vo.setContent(content);
				productBean = productService.getBoard(pronum);
				productService.insertReply(vo);
				
				return;
				
			} else if(action.equals("/replydelete.do")) {
				
				int replynum = Integer.parseInt(request.getParameter("replynum"));
				
				productService.deleteReply(replynum);
				
				return;
			}else if(action.equals("/alldelete.do")) {
				
				int replynum = Integer.parseInt(request.getParameter("replynum"));

				productService.doudelete(replynum);
				productService.deleteReply(replynum);
				
				return;
				
			}else if(action.equals("/updatereply.do")) {
				
				int replynum = Integer.parseInt(request.getParameter("replynum"));
				String content = request.getParameter("upcontent");
				
				productService.updatereply(replynum,content);
				
				return;
			}else if(action.equals("/fatedelete.do")) {
				int replynum = Integer.parseInt(request.getParameter("replynum"));
				String content = "관리자나 본인에 의해 삭제된 댓글입니다.";
				
				productService.updatereply(replynum,content);
				
				return;
			}else if(action.equals("/prepare.do")) {	
				int detail = Integer.parseInt(request.getParameter("detailnum"));
				Date today = Date.valueOf(request.getParameter("today"));
				Bean = productService.getdetails(detail);
				OrderDAO orderDAO = new OrderDAO();
				OrderVO VO = new OrderVO();
				request.setAttribute("DBean", Bean);
				
				//해당 공연에 대한 예약된 좌석정보리스트 가져와서 저장하기
				List<OrderVO> selectseat = orderDAO.getSeat(today, detail);
				String chseat="";
				for(int j=0; j<selectseat.size();j++) {
					chseat += selectseat.get(j).getSelectseat();
					if(j!=selectseat.size()-1) {
						chseat += ",";
					}
				}
				
				
				request.setAttribute("DBean", Bean);
				
				request.setAttribute("chseat", chseat);
				
				nextPage = "/product/buyconnect.jsp";
				
			}else if(action.equals("/itemselect.do")) {
				
				String name = request.getParameter("name");
				
				String aa = request.getParameter("date");
				
				Date selectdate = Date.valueOf(request.getParameter("date"));
				System.out.println(selectdate);
				List<DetailBean> detList = productService.SelectByDate(selectdate,name);
				
				JSONObject result = new JSONObject();

				JSONArray Array = new JSONArray();
				JSONObject Info;
				SimpleDateFormat transFormat = new SimpleDateFormat("yyyy-MM-dd");
				
				for(int i=0;i<detList.size();i++) {
					DetailBean vo = detList.get(i);
					Info = new JSONObject();
					Info.put("detnum", Integer.toString(vo.getDetailnum()));
					Info.put("place", vo.getPlace());
					Info.put("seat", Integer.toString(vo.getSeat()));
					Info.put("totalreserved",Integer.toString(vo.getTotalreserved()));
					Info.put("today", transFormat.format(vo.getToday()));
					Info.put("starttime", vo.getStarttime());
					Array.add(Info);
				}
				result.put("List", Array);
				PrintWriter out = response.getWriter();
				
				String jsonInfo = result.toString();
				
				out.print(jsonInfo);
				
				return;
				
			}else if(action.equals("/Allproduct.do")) {
				List<ProductBean> List = productService.getList();
				
				JSONObject result = new JSONObject();

				JSONArray Array = new JSONArray();
				JSONObject Info;
				SimpleDateFormat transFormat = new SimpleDateFormat("yyyy-MM-dd");
				
				for(int i=0;i<List.size();i++) {
					ProductBean vo = List.get(i);
					Info = new JSONObject();
					Info.put("num", Integer.toString(vo.getNum()));
					Info.put("name", vo.getName());
					Info.put("genre", vo.getGenre());
					Info.put("cla", vo.getCla());
					Info.put("runtime", Integer.toString(vo.getRuntime()));
					Info.put("price", Integer.toString(vo.getPrice()));
					Info.put("startdate", transFormat.format(vo.getStartdate()));
					Info.put("enddate", transFormat.format(vo.getEnddate()));
					Info.put("image", vo.getImage());
					Info.put("content", vo.getContent());
					Info.put("runstatus", Integer.toString(vo.getRunstatus()));
					Array.add(Info);
				}
				result.put("List", Array);
				PrintWriter out = response.getWriter();
				
				String jsonInfo = result.toString();
				
				out.print(jsonInfo);
				
				return;
				
				
			}else if(action.equals("/Allitems.do")) {
				String name = request.getParameter("name");
				
				List<DetailBean> detList = productService.getdetail(name);
				
				JSONObject result = new JSONObject();

				JSONArray Array = new JSONArray();
				JSONObject Info;
				SimpleDateFormat transFormat = new SimpleDateFormat("yyyy-MM-dd");
				
				for(int i=0;i<detList.size();i++) {
					DetailBean vo = detList.get(i);
					Info = new JSONObject();
					Info.put("detnum", Integer.toString(vo.getDetailnum()));
					Info.put("place", vo.getPlace());
					Info.put("seat", Integer.toString(vo.getSeat()));
					Info.put("totalreserved",Integer.toString(vo.getTotalreserved()));
					Info.put("today", transFormat.format(vo.getToday()));
					Info.put("starttime", vo.getStarttime());
					Array.add(Info);
				}
				
				result.put("List", Array);
				PrintWriter out = response.getWriter();
				
				String jsonInfo = result.toString();
				
				out.print(jsonInfo);
				
				return;
			}
			if(checkPage == 0) {
				request.getRequestDispatcher(nextPage).forward(request, response);
			}else {
				response.sendRedirect(request.getContextPath()+nextPage);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
}
