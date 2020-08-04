package team.faqboard;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;


public class faqDao {
	
	//DB연결
	private Connection con;
	private PreparedStatement pstmt;
	private ResultSet rs;
	private DataSource ds;
	
	//DB연결
	private Connection getConnection() throws Exception{
		Context init = new InitialContext();
		DataSource ds =(DataSource)init.lookup("java:comp/env/jdbc/pp");
		Connection con = ds.getConnection();
		return con;
		}
	
	//자원해제 메소드
	public void freeResource(){
	if(con != null){try{con.close();}catch(Exception err){}}
	if(rs != null){try{rs.close();}catch(Exception err){}}
	if(pstmt != null){try{con.close();}catch(Exception err){}}
	}
	

		
	public List<faqBean> getFaqList(String search, int startrow, int endrow) {
		String sql = "";
		List<faqBean> poolList = new ArrayList<faqBean>();
		
		try {

			con = getConnection();
					
			sql = "select * from faqboard where faq_cate like ? or faq_title like ? order by faq_date desc limit ?, ?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, "%" + search + "%");
			pstmt.setString(2, "%" + search + "%");
			pstmt.setInt(3, startrow);
			pstmt.setInt(4, endrow);						
			rs = pstmt.executeQuery();

			while (rs.next()) {
				faqBean fBean = new faqBean();

				fBean.setFaq_num(rs.getInt("faq_num"));
				fBean.setFaq_cate(rs.getString("faq_cate"));
				fBean.setFaq_title(rs.getString("faq_title"));
				fBean.setFaq_contents(rs.getString("faq_contents"));
				fBean.setFaq_date(rs.getDate("faq_date"));
				poolList.add(fBean);
			}

		} catch (Exception e) {
			System.out.println("getPoolList()메소드 내부에서 예외발생 : " + e.toString());
		} finally {
			freeResource();
		}

		return poolList;
	}// getPoolList
	
	

	public int getfaqCount(String search) {
		
		String sql = "";
		int count = 0;

		try {

			con = getConnection();			

			sql = "select * from faqboard where faq_cate like ? or faq_title like ?";	
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, "%" + search + "%");
			pstmt.setString(2, "%" + search + "%");
			rs = pstmt.executeQuery();

			while (rs.next()) {
				count++;
			}

		} catch (Exception e) {
			System.out.println("getPoolCount()메소드 내부에서 예외발생 : " + e.toString());
		} finally {
			freeResource();
		}

		return count;
		
	}// getPoolCount끝

	
	
	//faq게시판 글 번호 가져오는 메서드
	public faqBean getfaq(int faqNum) {
		String sql = "";

		faqBean fBean = new faqBean();

		try {

			con = getConnection();
			sql = "select * from faqboard where faq_num = ?";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, faqNum);
			rs = pstmt.executeQuery();

			while (rs.next()) {
				fBean.setFaq_num(rs.getInt("faq_num"));
				fBean.setFaq_cate(rs.getString("faq_cate"));
				fBean.setFaq_title(rs.getString("faq_title"));
				fBean.setFaq_contents(rs.getString("faq_contents"));
				fBean.setFaq_date(rs.getDate("faq_date"));
			}
		} catch (Exception e) {
			System.out.println("getPool()메소드 내부에서 예외발생 : " + e.toString());
		} finally {
			freeResource();
		}

		return fBean;
	}// getPool

	
	//FAQ 게시판 글 작성 메소드
	public void insertfboard(faqBean faqBean) {
		
		Connection con = null;
		PreparedStatement pstmt = null;
		String sql = "";
		
		try {
			con = getConnection();
			sql = "select max(faq_num) from faqboard";
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();	
			int faq_num = 0;
			if(rs.next()) {
				faq_num = rs.getInt(1) + 1;
			}else {
				faq_num = 1;
			}
			
			sql = "insert into faqboard(faq_num, faq_cate, faq_title, faq_contents, faq_date)"
				+ "values(?,?,?,?,now())";
			
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, faq_num);
			pstmt.setString(2, faqBean.getFaq_cate());
			pstmt.setString(3, faqBean.getFaq_title());
			pstmt.setString(4, faqBean.getFaq_contents());
			
			pstmt.executeUpdate();
			
		}catch (Exception e) {
			System.out.println("insertfboard 메소드 내부에서 예외발생 : " + e);
		}finally {
			freeResource();
		}
		
	}//insertfboard
	

	//FAQ글 수정 메소드
	public int updatefboard(faqBean faqBean) {
		int result = 0;
		
		String sql = "";
		
		try {
			con = getConnection();
			
			sql = "update faqboard set faq_cate=?, faq_title=?, faq_contents=? where faq_num = ?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, faqBean.getFaq_cate());
			pstmt.setString(2, faqBean.getFaq_title());
			pstmt.setString(3, faqBean.getFaq_contents());
			pstmt.setInt(4, faqBean.getFaq_num());
			
			pstmt.executeUpdate();
			
			result = 1;
		} catch (Exception e) {
			System.out.println("updatefboard 내부에서 예외발생 : "+ e);
		}finally {
			freeResource();
		}
		return result;
	}//updatefboard

	
	//faq게시판 글삭제 메소드
	public void deletefboard(int faq_num) {
		
		String sql = "";
		
		try {
			con = getConnection();
			sql = "delete from faqboard where faq_num = ?";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, faq_num);
			pstmt.executeUpdate();
		
		}catch (Exception e) {
			System.out.println("deletefboard 내부에서 예외발생 : "+ e);
		}finally { 
			freeResource();
		}
	}//deletefboard
	
	

}//faqDao


