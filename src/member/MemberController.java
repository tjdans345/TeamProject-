package member;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Random;

import javax.mail.Authenticator;  
import javax.mail.PasswordAuthentication;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import Order.OrderDAO;
import Order.OrderVO;


 
	class Gmail extends Authenticator{

	@Override
	protected PasswordAuthentication getPasswordAuthentication() {
		
		return new PasswordAuthentication("z1kgam2@gmail.com", "xptmxm1!");
	}
	
}



@WebServlet("/member/*")
public class MemberController extends HttpServlet {
	
	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doHandle(request, response);
	}

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doHandle(request, response);
	}
	
	private void doHandle(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{


		MemberDAO memberDAO = new MemberDAO();
		MemberBean memberBean=new MemberBean();
		HttpSession session = request.getSession();
		
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html;charset=UTF-8");
		
		String action =request.getPathInfo();
		System.out.println(action);
		String nextPage = "";
	
			if(action.equals("/join.do")) {
				
				nextPage = "/members/join.jsp";
				
			}else if(action.equals("/login.do")) {
				
				nextPage = "/members/login.jsp";
				
			}else if(action.equals("/joinAction.do")) {
				
				String id = request.getParameter("id");
				String password = request.getParameter("password");
				String name = request.getParameter("name");
				String phone = request.getParameter("phone");
				String email = request.getParameter("email");
				String zipcode = request.getParameter("zipcode");
				String address1 = request.getParameter("address1");
				String address2 = request.getParameter("address2");
				
				memberBean.setId(id);
				memberBean.setPassword(password);
				memberBean.setName(name);
				memberBean.setPhone(phone);
				memberBean.setEmail(email);
				memberBean.setZipcode(zipcode);
				memberBean.setAddress1(address1);
				memberBean.setAddress2(address2);
				
				memberDAO.insertMember(memberBean);
				
				nextPage = "/members/login.jsp";
				
			}else if(action.equals("/loginAction.do")) {
							
				String id = request.getParameter("id");
				String password = request.getParameter("password");					
				
				memberBean = memberDAO.getMember(id);
				
				String profile_img = memberBean.getProfile_img();
				String name = memberBean.getName();
				String zipcode = memberBean.getZipcode();
				String address1 = memberBean.getAddress1();
				String address2 = memberBean.getAddress2();
				int is_admin = memberBean.getIs_admin();
				int check = memberDAO.login(id, password); 

				
				if(check == 1) {
					session.setAttribute("id", id);
					session.setAttribute("name",name);
					session.setAttribute("profile_img",profile_img);
					session.setAttribute("is_admin", is_admin);
					session.setAttribute("user", memberBean);

					PrintWriter pw = response.getWriter();
					pw.print("<script>" + "alert('로그인에 성공했습니다.');" + "location.href='"+request.getContextPath()+ "/index/index.jsp';" + "</script>");
					return;
					
				}else if(check == -2) {					
					PrintWriter pw = response.getWriter();
					pw.print("<script>" + "alert('이용정지 상태입니다.');" + "location.href='" + request.getContextPath()+ "/members/login.jsp';" + "</script>");
					
					return;
					
				}else if(check == 0) {					
					PrintWriter pw = response.getWriter();
					pw.print("<script>" + "alert('비밀번호가 틀립니다.');" + "location.href='" + request.getContextPath()+ "/members/login.jsp';" + "</script>");
					
					return;
				}else {
					PrintWriter pw = response.getWriter();
					pw.print("<script>" + "alert('아이디가 존재하지 않습니다.');" + "location.href='" + request.getContextPath() +  "/members/join.jsp';" + "</script>");
					
					return;
				}
				
				
			}else if(action.equals("/deleteMember.do")) {
				
		
				String id = (String) session.getAttribute("id");
				
				System.out.println(id);
				
				memberDAO.deleteMember(id);
				
				session.invalidate();
								
				nextPage = "/main/main.do";
				
			}else if(action.equals("/logout.do")) {
				String id = (String)session.getAttribute("id");
				OrderDAO orderDAO = new OrderDAO();				
				session.invalidate();
				orderDAO.delAllCart(id);
				nextPage = "/main/main.do";
				
			}else if(action.equals("/myInfo.do")) {
				
				String id =(String)session.getAttribute("id");
				
				memberBean = memberDAO.getMember(id);
				
				request.setAttribute("memberBean", memberBean);
					
				nextPage = "/members/MyInfo.jsp";
				
			}else if(action.equals("/modifyAction.do")) {
				
				memberBean.setId(request.getParameter("id"));
				memberBean.setEmail(request.getParameter("email"));
				memberBean.setName(request.getParameter("name"));
				memberBean.setPassword(request.getParameter("password"));
				memberBean.setZipcode(request.getParameter("zipcode"));
				memberBean.setAddress1(request.getParameter("address1"));
				memberBean.setAddress2(request.getParameter("address2"));
				memberBean.setPhone(request.getParameter("phone"));
				memberBean.setPoint(Integer.parseInt(request.getParameter("point")));
				
				
				int result = memberDAO.updateMember(memberBean);  
				
				System.out.println(result);
				
				if(result == 0) { // 수정실패
					PrintWriter pw = response.getWriter();
					pw.print("<script>");
					pw.print("alert('수정실패 !')");
					pw.print("history.go(-1);");
					pw.print("</script>");
				}else { // 수정성공
					
					PrintWriter pw = response.getWriter();
					pw.print("<script>");
					pw.print("alert('성공 !')");
					pw.print("</script>");
					session.setAttribute("id", memberBean.getId());
					session.setAttribute("result", result);
				}
				
				nextPage = "/mypage/mypage.jsp";
				
			}else if(action.equals("/pwCheckForm.do")) {
				
				nextPage ="/members/pwCheck.jsp";
				
			}else if(action.equals("/pwCheck.do")) {
				
				PrintWriter pw = response.getWriter();
				
				String id =(String)session.getAttribute("id");
				
				String password = request.getParameter("password");
								
				MemberBean tempBean = memberDAO.getMember(id);
				
				String DBPassword = tempBean.getPassword();
			
				System.out.println(DBPassword);
				System.out.println(password);
				if(!password.equals(DBPassword)) {
					
					pw.print("<script>");
					pw.print("alert('비밀번호가 틀립니다.')");
					pw.print("history.back();");
					pw.print("</script>");
					
				}else {
					pw.print("<script>");
					pw.print("alert('회원정보 페이지보기로 갑니다')");
					pw.print("</script>");
				}
				nextPage = "/member/myInfo.do";
				
			}else if(action.equals("/findId.do")) {
				
				nextPage = "/members/userSearch.jsp";
				
			}else if(action.equals("/findIdAction.do")) {
				
				String name = request.getParameter("name");
				String email = request.getParameter("email");
				
				memberBean = memberDAO.findId(name, email);

				String id = memberBean.getId();
				
				request.setAttribute("id", id);
				
				System.out.println(id);
				
				nextPage = "/members/findIdResult.jsp";
				
			}else if(action.equals("/findPw.do")) {
				
				nextPage = "/members/userSearch2.jsp";
				
			}else if(action.equals("/findPwAction.do")) {
				String id = request.getParameter("id");
				String email = request.getParameter("email");
				
				int check = memberDAO.checkEmail(email);
				
				request.setAttribute("id", id);
				request.setAttribute("email", email);
				request.setAttribute("check", check);
				
				if(check == 1) {
					String authNum = memberDAO.authNum(); 
					boolean result = memberDAO.sendEmail(email, authNum);
					request.setAttribute("authNum", authNum);
				}
				
				nextPage = "/members/findPwResult.jsp";
				
			}else if(action.equals("/updatePass.do")) {
				
				String id = request.getParameter("id");
				System.out.println(id);
				request.setAttribute("id", id);
				
				nextPage = "/members/updatePass.jsp";
				
			}else if(action.equals("/updatePassAction.do")) {
				String id = request.getParameter("id");
				String password = request.getParameter("password");

				memberBean.setId(id);
				memberBean.setPassword(password);
				System.out.println(password);
				System.out.println(id);
				int result = memberDAO.updatePass(memberBean);
				
				if(result == 0) { // 수정실패
					PrintWriter pw = response.getWriter();
					pw.print("<script>");
					pw.print("alert('수정실패 !')");
					pw.print("history.go(-1);");
					pw.print("</script>");
				
				}else { // 수정성공
					
					PrintWriter pw = response.getWriter();
					pw.print("<script>");
					pw.print("alert('성공 !')");
					pw.print("</script>");
					session.setAttribute("id", memberBean.getId());
					session.setAttribute("result", result);
				}
				
				nextPage = "/member/login.do";
				
			}else if(action.equals("/updateProfile.do")) {
				
				String id = request.getParameter("id");
				String profile_img = request.getParameter("profile_img");
				request.setAttribute("id", id);
				request.setAttribute("profileimg", profile_img);
				nextPage = "/members/profileUpdate.jsp";
				
			}else if(action.equals("/updateProfileAction.do")) {
				String id = "";
				String profile_img ="";
				File file = null;
				String savePath = request.getRealPath("/upload").replaceAll("\\\\", "/");
				try {
				int fileMaxSize = 20*1024*1024;
				MultipartRequest multi = new MultipartRequest(request, savePath, fileMaxSize, "UTF-8", new DefaultFileRenamePolicy());
				id = multi.getParameter("id");
				profile_img = multi.getParameter("profile_img");
				file = multi.getFile("profile_img");
				} catch (Exception e) {
					PrintWriter pw = response.getWriter();
					pw.print("<script>");
					pw.print("alert('파일 크기는 20MB를 넘을 수 없습니다.');");
					pw.print("</script>");
					nextPage = "/members/profileUpdate.jsp";
					return;
				}
				
				
				if(!id.equals((String)session.getAttribute("id"))) {
					PrintWriter pw = response.getWriter();
					pw.print("<script>");
					pw.print("alert('아이디 저장X');");
					pw.print("</script>");
					nextPage = "../index/index.jsp";
				}
				String fileName = "";
				if(file!=null) {
					String ext = file.getName().substring(file.getName().lastIndexOf(".")+1);
					if(ext.equals("jpg") || ext.equals("png") || ext.equals("gif")) {
						String prev = new MemberDAO().getMember(id).getProfile_img();
						File prevFile = new File(savePath + "/" + prev);
						if(prevFile.exists()) {
							prevFile.delete();
						}
						fileName = file.getName();
					}else {
						if(file.exists()) {
							file.delete();
						}
						PrintWriter pw = response.getWriter();
						pw.print("<script>");
						pw.print("alert('이미지파일만 업로드 가능합니다.');");
						pw.print("history.back();");
						pw.print("</script>");
						return;						
					}
				}
				new MemberDAO().profile(id, fileName);
				PrintWriter pw = response.getWriter();
				pw.print("<script>");
				pw.print("alert('이미지를 변경했습니다.');");
				pw.print("</script>");
				memberBean = memberDAO.getMember(id);
				session.removeAttribute(profile_img);
				session.setAttribute("profile_img",fileName);
				System.out.println("프로필 이미지 : "+fileName);
				nextPage = "/main/main.do";
				
			}else if(action.equals("/address.do")) {
				
				String id =(String)session.getAttribute("id");
				
				memberBean = memberDAO.getMember(id);
				
				request.setAttribute("memberBean", memberBean);
													
				nextPage = "/members/address.jsp";
				
			}else if(action.equals("/BaddressAction.do")) {
				
				
				memberBean.setId(request.getParameter("id"));
				memberBean.setRpname(request.getParameter("rpname"));
				memberBean.setZipcode(request.getParameter("zipcode"));
				memberBean.setAddress1(request.getParameter("address1"));
				memberBean.setAddress2(request.getParameter("address2"));

				int result = memberDAO.updateAddress(memberBean);
				 
				System.out.println("result : " + result);
				
				if(result==0) {
					PrintWriter pw = response.getWriter();
					pw.print("<script>");
					pw.print("alert('수정 실패');");
					pw.print("</script>");
				}else {
					PrintWriter pw = response.getWriter();
					pw.print("<script>");
					pw.print("alert('수정 성공');");
					pw.print("</script>");

				}
					
				
				nextPage = "/main/main.do";
				
			}else if(action.equals("/NaddressAction.do")) {
								
				memberBean.setId(request.getParameter("id"));
				memberBean.setRpname(request.getParameter("rpname"));
				memberBean.setLzipcode(request.getParameter("Lzipcode"));
				memberBean.setLaddress1(request.getParameter("Laddress1"));
				memberBean.setLaddress2(request.getParameter("Laddress2"));
				
				memberDAO.updateNewAddress(memberBean);
				
				nextPage = "/main/main.do";
			}
				
			request.getRequestDispatcher(nextPage).forward(request, response);
			
	}// doHandle END
	

} // UserController END
