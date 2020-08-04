package noticeboard;

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

public class NoticeboardDAO {
	private Connection con;
	private PreparedStatement pstmt;
	private ResultSet rs;
	private DataSource ds;
	private String sql;
	
	//DB연결
	private Connection getConnection() throws Exception{
		Context init = new InitialContext();
		DataSource ds =(DataSource)init.lookup("java:comp/env/jdbc/pp");
		con = ds.getConnection();
		return con;
	}
	//자원해제
	public void freeResource() {
		if(con != null){try{con.close();}catch(SQLException e){e.printStackTrace();}}
		if(rs != null){try{rs.close();}catch(SQLException e){e.printStackTrace();}}
		if(pstmt != null){try{pstmt.close();}catch(SQLException e){e.printStackTrace();}}
	}
	
	//공지사항 글 입력
	public void insertNoticeboard (NoticeboardBean VO) {
		Connection con = null;
		PreparedStatement pstmt = null;
		String sql = "";
		System.out.println(VO.getN_content());
		try {
			con = getConnection();
			sql = "select max(n_num) from noticeboard";
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();	
			int n_num = 0;
			if(rs.next()) {
				n_num = rs.getInt(1) + 1;
			}else {
				n_num = 1;
			}
			sql = "insert into noticeboard"
				+ "(n_num, n_cate, n_title, n_content, n_date)"
				+ "values(?,?,?,?,?)";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, n_num);
			pstmt.setString(2, VO.getN_cate());
			pstmt.setString(3, VO.getN_title());
			pstmt.setString(4, VO.getN_content());
			pstmt.setTimestamp(5, VO.getN_date());
			pstmt.executeUpdate();
		}catch (Exception e) {
			System.out.println("insertNoticeboard 메소드 내부에서 오류 : " + e);
		}finally {
			freeResource();
		}
	}
	
	//카테고리 별로 공지사항 리스트 출력 (n_cate = 셀렉트 박스 카테고리)
	public List<NoticeboardBean> noticeList(String n_cate, int pageFirst, int pageSize) {
		List<NoticeboardBean> noticeList = new ArrayList<NoticeboardBean>();
		try {
			con = getConnection();
			sql = "select * from noticeboard where n_cate=? "
				+ "order by n_num desc limit ?,?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, n_cate);
			pstmt.setInt(2, pageFirst);
			pstmt.setInt(3, pageSize);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				NoticeboardBean vo = new NoticeboardBean();
				vo.setN_num(rs.getInt("n_num"));
				vo.setN_cate(rs.getString("n_cate"));
				vo.setN_content(rs.getString("n_content"));
				vo.setN_title(rs.getString("n_title"));
				vo.setN_date(rs.getTimestamp("n_date"));
				noticeList.add(vo);
			}
		} catch (Exception e) {
			System.out.println("noticeList 메소드 내부에서 오루 : " + e);
		} finally {
			freeResource();
		}
		return noticeList;
	}
	//공지사항 리스트 출력
	public List<NoticeboardBean> noticeList(int pageFirst, int pageSize) {
		List<NoticeboardBean> noticeList = new ArrayList<NoticeboardBean>();
		try {
			con = getConnection();
			String query = "select * from noticeboard order by n_num desc limit ?,?";
			pstmt = con.prepareStatement(query);
			pstmt.setInt(1, pageFirst);
			pstmt.setInt(2, pageSize);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				NoticeboardBean vo = new NoticeboardBean();
				vo.setN_num(rs.getInt("n_num"));
				vo.setN_cate(rs.getString("n_cate"));
				vo.setN_content(rs.getString("n_content"));
				vo.setN_title(rs.getString("n_title"));
				vo.setN_date(rs.getTimestamp("n_date"));
				noticeList.add(vo);
			}		
		}catch (Exception e) {
			System.out.println("noticeList 메소드 내부에서 오류 : " + e);
		}finally {
			freeResource();
		}
		return noticeList;
	}
	
	//카테고리별 글 개수 가져오기
	public int getAllnotice(String n_cate) {
		int count = 0;
		try {
			con = getConnection();
			sql = "select * from noticeboard where n_cate = ?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, n_cate);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				count ++;
			}
		} catch (Exception e) {
			System.out.println("getAllnotice 메소드 내부에서 오류 : " + e);
		}finally {
			freeResource();
		}
		return count;
	}
	
	//모든 글 개수 가져오기
	public int getAllNotice() {
		int count = 0;
		try {
			con = getConnection();
			sql = "select * from noticeboard";
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				count ++;
			}
		} catch (Exception e) {
			System.out.println("getAllNotice()메소드에서 예외 발생 : " + e);
		}finally {
			freeResource();
		}
		return count;
	}//getAllNotice()메소드 끝
	
	//공지사항 글 삭제
	public void deleteNoticeboard(int n_num) {
		try {
			con = getConnection();
			sql = "delete from noticeboard where n_num = ?";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, n_num);
			pstmt.executeUpdate();
		}catch (Exception e) {
			System.out.println("deleteNoticeBoard 내부에서 오류 : " + e);
		}finally { 
			freeResource();
		}
	}
	//공지사항 글 수정하기
	public int modNotice(NoticeboardBean noticeVO) {
		int result = 0;
		try {
			con = getConnection();
			sql = "update noticeboard set n_title=?, n_content=?, n_cate=? where n_num = ?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, noticeVO.getN_title());
			pstmt.setString(2, noticeVO.getN_content());
			pstmt.setString(3, noticeVO.getN_cate());
			pstmt.setInt(4, noticeVO.getN_num());
			pstmt.executeUpdate();
			result = 1;
		} catch (Exception e) {
			System.out.println("modNotice 내부에서 오류 : " + e);
		}finally {
			freeResource();
		}
		return result;
	}
	
	//공지사항 글 상세보기
	public NoticeboardBean viewNotice(int n_num) {
		NoticeboardBean nvo = new NoticeboardBean();
		try {
			con = getConnection();
			sql = "select * from noticeboard where n_num = ?";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, n_num);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				nvo.setN_num(rs.getInt("n_num"));
				nvo.setN_title(rs.getString("n_title"));
				nvo.setN_cate(rs.getString("n_cate"));
				nvo.setN_content(rs.getString("n_content"));
				nvo.setN_date(rs.getTimestamp("n_date"));
			}
		} catch (Exception e) {
			System.out.println("viewNotice 메소드 내부에서 오류 : "+ e);
		}finally {
			freeResource();
		}
		return nvo;
	}

	

}