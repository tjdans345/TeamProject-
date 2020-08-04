package team.qnaboard;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

import team.faqboard.faqBean;

public class qnaDao {
	
	
	private Connection con;
	private PreparedStatement pstmt;
	private ResultSet rs;
	private DataSource ds;
	private String sql;
	
	//DB연결
	private Connection getConnection() throws Exception{
	Context init = new InitialContext();
	DataSource ds =(DataSource)init.lookup("java:comp/env/jdbc/pp");
	Connection con = ds.getConnection();
	return con;
	}
	
	//자원해제
	private void freeResource(){
	if(con != null){try{con.close();}catch(Exception err){}}
	if(rs != null){try{rs.close();}catch(Exception err){}}
	if(pstmt != null){try{con.close();}catch(Exception err){}}
	}
	
	//모든 QNA 모든 목록 가져오기
	public List<qnaBean> qnaList(int pageFirst, int pageSize) {
		List<qnaBean> qnaList = new ArrayList<qnaBean>();
		try {
			con = getConnection();
			String query = "select * from qnaboard order by qna_num desc limit ?,?";
			pstmt = con.prepareStatement(query);
			pstmt.setInt(1, pageFirst);
			pstmt.setInt(2, pageSize);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				qnaBean qbean = new qnaBean();
				qbean.setQna_num(rs.getInt("qna_num"));
				qbean.setQna_cate(rs.getString("qna_cate"));
				qbean.setQna_title(rs.getString("qna_title"));
				qbean.setQna_contents(rs.getString("qna_contents"));
				qbean.setQna_date(rs.getDate("qna_date"));
				qbean.setQna_status(rs.getInt("qna_status"));
				qbean.setFile(rs.getString("file"));
				
				qnaList.add(qbean);
			}		
		}catch (Exception e) {
			System.out.println("qnaList에서 오류 : e");
		}finally {
			freeResource();
		}
		return qnaList;
	}//qnaList()끝
	

	//고객id별 QNA 목록 가져오기
	public List<qnaBean> qnaList(int pageFirst, int pageSize, String id) {
		List<qnaBean> qnaList = new ArrayList<qnaBean>();
		try {
			con = getConnection();
			String query = "select * from qnaboard where id = ? order by qna_num desc limit ?,?";
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, id);
			pstmt.setInt(2, pageFirst);
			pstmt.setInt(3, pageSize);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				qnaBean qbean = new qnaBean();
				qbean.setQna_num(rs.getInt("qna_num"));
				qbean.setid(rs.getString("id"));
				qbean.setQna_cate(rs.getString("qna_cate"));
				qbean.setQna_title(rs.getString("qna_title"));
				qbean.setQna_contents(rs.getString("qna_contents"));
				qbean.setQna_date(rs.getDate("qna_date"));
				qbean.setQna_status(rs.getInt("qna_status"));
				qbean.setFile(rs.getString("file"));
				
				qnaList.add(qbean);
			}		
		}catch (Exception e) {
			System.out.println("qnaList에서 오류 : e");
		}finally {
			freeResource();
		}
		return qnaList;
	}//qnaList()끝
	
	//관리자 고객 전체 문의사항 들고오기
		public List<qnaBean> qnaList(int pageFirst, int pageSize, int status) {
			List<qnaBean> qnaList = new ArrayList<qnaBean>();
			try {
				con = getConnection();
				String query = "select * from qnaboard where qna_status = ? order by qna_num desc limit ?,?";
				pstmt = con.prepareStatement(query);
				pstmt.setInt(1, status);
				pstmt.setInt(2, pageFirst);
				pstmt.setInt(3, pageSize);
				rs = pstmt.executeQuery();
				while(rs.next()) {
					qnaBean qbean = new qnaBean();
					qbean.setQna_num(rs.getInt("qna_num"));
					qbean.setid(rs.getString("id"));
					qbean.setQna_cate(rs.getString("qna_cate"));
					qbean.setQna_title(rs.getString("qna_title"));
					qbean.setQna_contents(rs.getString("qna_contents"));
					qbean.setQna_date(rs.getDate("qna_date"));
					qbean.setQna_status(rs.getInt("qna_status"));
					
					qnaList.add(qbean);
				}		
			}catch (Exception e) {
				System.out.println("qnaList에서 오류 : e");
			}finally {
				freeResource();
			}
			return qnaList;
		}//qnaList()끝
	

	//QNA 글 작성 메소드
	public void insertfboard(qnaBean qnaBean) {
		
		Connection con = null;
		PreparedStatement pstmt = null;
		String sql = "";
		
		try {
			con = getConnection();
			sql = "select max(qna_num) from qnaboard";
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();	
			int faq_num = 0;
			if(rs.next()) {
				faq_num = rs.getInt(1) + 1;
			}else {
				faq_num = 1;
			}
			
			sql = "insert into qnaboard(qna_num, id, qna_cate, qna_title, qna_contents, qna_date, qna_status, answer, file, file2)"
				+ "values(?,?,?,?,?,now(),0,?,?,?)";
			
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, faq_num);
			pstmt.setString(2, qnaBean.getid());
			pstmt.setString(3, qnaBean.getQna_cate());
			pstmt.setString(4, qnaBean.getQna_title());
			pstmt.setString(5, qnaBean.getQna_contents());
			pstmt.setString(6, qnaBean.getAnswer());
			pstmt.setString(7, qnaBean.getFile());
			pstmt.setString(8, qnaBean.getFile2());
			
			pstmt.executeUpdate();
			
		}catch (Exception e) {
			System.out.println("insertfboard 에서 예외발생 : " + e);
		}finally {
			freeResource();
		}
	}//insertfboard()끝

	
	
	//모든 글 개수 가져오는 메소드
	public int getAllQna() {
		int count = 0;
		String sql = "";
		try {
			con = getConnection();
			sql = "select * from qnaboard";
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				count ++;
			}
		} catch (Exception e) {
			System.out.println("getAllQna()에서 예외발생 : " + e);
		}finally {
			freeResource();
		}
		return count;
	}//getAllQna()끝
	
	
	//고객id별 글 개수 가져오는 메소드
	public int getAllQna(String id) {
		int count = 0;
		String sql = "";
		try {
			con = getConnection();
			sql = "select * from qnaboard where id = ? ";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				count ++;
			}
		} catch (Exception e) {
			System.out.println("getAllQna()에서 예외발생 : " + e);
		}finally {
			freeResource();
		}
		return count;
	}//getAllQna()끝
	
	//관리자 페이지 답변 상태 조회 
	public int getAllQna(int status) {
		int count = 0;
		String sql = "";
		try {
			con = getConnection();
			sql = "select * from qnaboard where qna_status = ? ";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, status);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				count ++;
			}
		} catch (Exception e) {
			System.out.println("getAllQna()에서 예외발생 : " + e);
		}finally {
			freeResource();
		}
		return count;
	}
	
	//글 상세보기 메소드
	public qnaBean viewQna(int qna_num){//1:1 문의 글 상세보기
		qnaBean qbean = new qnaBean();
		try {
			con = getConnection();
			sql = "select * from qnaboard where qna_num = ?";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, qna_num);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				qbean.setQna_num(rs.getInt("qna_num"));
				qbean.setid(rs.getString("id"));
				qbean.setQna_title(rs.getString("qna_title"));
				qbean.setQna_cate(rs.getString("qna_cate"));
				qbean.setQna_contents(rs.getString("qna_contents"));
				qbean.setQna_status(rs.getInt("qna_status"));
				qbean.setAnswer(rs.getString("answer"));
				qbean.setFile(rs.getString("file"));
			}
		} catch (Exception e) {
			System.out.println("viewQna()에서 예외 발생 : " + e);
		} finally {
			freeResource();
		}
		return qbean;
	}//viewQna()끝
	
	
	//QNA 글 삭제 메소드
	public void deleteQna(int qna_num) {//1:1 문의 글 삭제
		try {
			con = getConnection();
			sql = "delete from qnaboard where qna_num = ?";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, qna_num);
			pstmt.executeUpdate();
		} catch (Exception e) {
			System.out.println("deleteQna()에서 예외 발생: " + e);
		} finally {
			freeResource();
		}
	}//deleteQna()끝

	
	//FAQ 글 수정 메소드
	public int updateQnaBoard(qnaBean qnaBean) {
		int result = 0;
		
		String sql = "";
		
		try {
			con = getConnection();
			
			sql = "update qnaboard set qna_cate=?, qna_title=?, qna_contents=?, qna_status=?, answer=? where qna_num = ?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, qnaBean.getQna_cate());
			pstmt.setString(2, qnaBean.getQna_title());
			pstmt.setString(3, qnaBean.getQna_contents());
			pstmt.setInt(4, qnaBean.getQna_status());
			pstmt.setString(5, qnaBean.getAnswer());
			pstmt.setInt(6, qnaBean.getQna_num());
			
			pstmt.executeUpdate();
			
			result = 1;
		} catch (Exception e) {
			System.out.println("updateQnaBoard 내부에서 예외발생 : "+ e);
		}finally {
			freeResource();
		}
		return result;
	}//updatefboard()끝

	
	//QNA 게시판 글 번호 가져오는 메서드
	public qnaBean getqna(int qnaNum) {
		String sql = "";
	
		qnaBean qBean = new qnaBean();
	
		try {
	
			con = getConnection();
			sql = "select * from qnaboard where qna_num = ?";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, qnaNum);
			rs = pstmt.executeQuery();
	
			while (rs.next()) {
				qBean.setQna_num(rs.getInt("qna_num"));
				qBean.setid(rs.getString("id"));
				qBean.setQna_cate(rs.getString("qna_cate"));
				qBean.setQna_title(rs.getString("qna_title"));
				qBean.setQna_contents(rs.getString("qna_contents"));
				qBean.setQna_date(rs.getDate("qna_date"));
				qBean.setQna_status(rs.getInt("qna_status"));
				qBean.setAnswer(rs.getString("answer"));
			}
		} catch (Exception e) {
			System.out.println("getPool()메소드 내부에서 예외발생 : " + e.toString());
		} finally {
			freeResource();
		}
		return qBean;
	}//getqna()끝

}//qnaDao
