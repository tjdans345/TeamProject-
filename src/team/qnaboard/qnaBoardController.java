package team.qnaboard;

import java.awt.Graphics2D;
import java.awt.image.BufferedImage;
import java.awt.image.renderable.ParameterBlock;
import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Enumeration;
import java.util.List;

import javax.imageio.ImageIO;
import javax.media.jai.JAI;
import javax.media.jai.RenderedOp;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import member.MemberBean;

@WebServlet("/qboard/*")
public class qnaBoardController extends HttpServlet{
   
   qnaBean Bean;
   
   @Override
   protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
      doHandle(request, response);
   }
   
   @Override
   protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
      doHandle(request, response);
   }
   
   
   protected void doHandle(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
      
      qnaDao qnaDao = new qnaDao();
      qnaBean qnaBean = new qnaBean();
      
      String nextPage = "";
      int checkPage = 0;
      request.setCharacterEncoding("utf-8");
      response.setContentType("text/html;charset=utf-8");
      String action = request.getPathInfo();  //  
      System.out.println("action : " + action);
      HttpSession session = request.getSession();

      
      
      
      if(action.equals("/qwriteForm.do")) { //1:1문의하기 폼으로 가기
         
         String check = request.getParameter("check");
         
         request.setAttribute("check", check);
         
         nextPage = "/board/qna_write.jsp";
         
      
      }else if(action.equals("/qnaWrite.do")) { //1:1문의 글작성
          
         checkPage = 1;
          
         ServletContext ctx = getServletContext();
  		 String realPath = ctx.getRealPath("/board/image/");
  		
  		 int max = 10 * 1024 * 1024;
  		 
  		 MultipartRequest multi = new MultipartRequest(request, realPath, max, "UTF-8", new DefaultFileRenamePolicy());
          
  		 String cate = multi.getParameter("cate");
  		 String title = multi.getParameter("title");
  		 String contents = multi.getParameter("contents");
  		 String id = (String)session.getAttribute("id");
  		 String boardFile1 = multi.getFilesystemName("boardFile1");
  		 
  		 Enumeration e = multi.getFileNames();
  		 
  		 String name = "";
  		 
  		 while (e.hasMoreElements()) {
  			 
 			name = (String)e.nextElement();
 		}
  		 
  		request.setAttribute("cate", cate);
  		request.setAttribute("title", title);
  		request.setAttribute("contents", contents);
  		request.setAttribute("boardFile1", boardFile1);
  		request.setAttribute("id", id);
  		
  		qnaBean.setQna_cate(cate);
  		qnaBean.setQna_title(title);
  		qnaBean.setQna_contents(contents);
  		qnaBean.setFile(boardFile1);
  		qnaBean.setid(id);
  				
  		         
         qnaDao.insertfboard(qnaBean);         
          
         nextPage = "/qboard/qnaList.do";

          
       }else if(action.equals("/qnaList.do")) { //문의내역 리스트
         
         String id =(String)session.getAttribute("id");
         
         int total = qnaDao.getAllQna(id);
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
         List<qnaBean> qnaList = qnaDao.qnaList(pageFirst, pageSize, id);
         request.setAttribute("qnaList", qnaList);
         request.setAttribute("blockSize", blockSize);
         request.setAttribute("blockFirst", blockFirst);
         request.setAttribute("blockLast", blockLast);
         request.setAttribute("totalPage", totalPage);
         request.setAttribute("nowPage", nowPage);

         nextPage = "/board/qna_my.jsp";

         
      } else if(action.equals("/viewQna.do")) { //1:1문의 글 상세보기
         String qna_num = request.getParameter("qna_num");
         qnaBean = qnaDao.viewQna(Integer.parseInt(qna_num));
         request.setAttribute("qna", qnaBean);
         nextPage = "/board/viewQna.jsp";
         
      } else if(action.equals("/deleteQna.do")) { //1:1문의 글 삭제
         int qna_num = Integer.parseInt(request.getParameter("qna_num"));
         System.out.println(qna_num); 
         qnaDao.deleteQna(qna_num);
         
         nextPage = "/qboard/qnaList.do";
      
      } else if(action.equals("/qnaUpdateForm.do")) { //1:1문의하기 수정 폼으로 가기
         
         int qna_num =Integer.parseInt(request.getParameter("qna_num"));
         qnaBean = qnaDao.getqna(qna_num);
         
         request.setAttribute("qnaUpdate", qnaBean);
         
         nextPage = "/board/qna_update.jsp";
         
      } else if(action.equals("/qnaUpdate.do")) { //1:1문의하기 수정
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
         
         nextPage = "/qboard/qnaList.do";
         
      }
      

      if(checkPage == 0) {
         request.getRequestDispatcher(nextPage).forward(request, response);
      }else {
         response.sendRedirect(request.getContextPath()+nextPage);
      }
      
   }//doHandle

}//qnaBoardController