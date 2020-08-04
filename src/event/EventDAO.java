package event;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

import com.mysql.fabric.xmlrpc.base.Array;

public class EventDAO {
	private Connection con;
	private PreparedStatement pstmt;
	private ResultSet rs;
	private DataSource ds;
	private String sql;
	
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
	
	//이벤트 게시판 글 입력
	public void insertEvent (EventBean bean) {
		Connection con = null;
		PreparedStatement pstmt = null;
		String sql = "";
		
		try {
			con = getConnection();
			sql = "select max(e_num) from event";
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();	
			int e_num = 0;
			if(rs.next()) {
				e_num = rs.getInt(1) + 1;
			}else {
				e_num = 1;
			}
			sql = "insert into event"
				+ "(e_num, e_title, e_content, e_file, e_startdate, e_enddate, e_date)"
				+ "values(?,?,?,?,?,?,now())";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, e_num);
			pstmt.setString(2, bean.getE_title());
			pstmt.setString(3, bean.getE_content());
			pstmt.setString(4, bean.getE_file());
			pstmt.setDate(5, bean.getE_startdate());
			pstmt.setDate(6, bean.getE_enddate());
			
			pstmt.executeUpdate();
			
		} catch (Exception e) {
			System.out.println("insertevent 내부에서 오류 : " + e);
		} finally {
			freeResource();
		}
	}
	
	//이벤트 글 리스트(검색했을 때)
	public List<EventBean> eventList(String search, int pageFirst, int pageSize) {
		List<EventBean> list = new ArrayList<EventBean>();
		try {
			con = getConnection();
			sql = "select * from event where search = ?"
				+ "order by e_num desc limit ?,?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, search);
			pstmt.setInt(2, pageFirst);
			pstmt.setInt(3, pageSize);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				EventBean bean = new EventBean();
				bean.setE_num(rs.getInt("e_num"));
				bean.setE_title(rs.getString("e_title"));
				bean.setE_content(rs.getString("e_content"));
				bean.setE_file(rs.getString("e_file"));
				bean.setE_startdate(rs.getDate("e_startdate"));
				bean.setE_enddate(rs.getDate("e_enddate"));				
				bean.setE_date(rs.getTimestamp("e_date"));
				list.add(bean);
			}
		} catch (Exception e) {
			System.out.println("eventList 내부에서 오류 : " + e);
		} finally {
			freeResource();
		}
		return list;
	}
	
	//이벤트 글 리스트 (모두)
	public List<EventBean> eventList(int pageFirst, int pageSize) {
		List<EventBean> list = new ArrayList<EventBean>();
		try {
			con = getConnection();
			sql = "select * from event order by e_num desc limit ?,?";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, pageFirst);
			pstmt.setInt(2, pageSize);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				EventBean bean = new EventBean();
				bean.setE_num(rs.getInt("e_num"));
				bean.setE_title(rs.getString("e_title"));
				bean.setE_content(rs.getString("e_content"));
				bean.setE_file(rs.getString("e_file"));
				bean.setE_startdate(rs.getDate("e_startdate"));
				bean.setE_enddate(rs.getDate("e_enddate"));
				bean.setE_date(rs.getTimestamp("e_date"));
				list.add(bean);
			}
		} catch (Exception e) {
			System.out.println("eventList 내부에서 오류 : " + e);
		} finally {
			freeResource();
		}
		return list;
	}
	
	//모든 이벤트 글 개수
	public int getAllEvent() {
		int count = 0;
		
		try {
			con = getConnection();
			sql = "select * from event";
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				count ++;
			}
		} catch (Exception e) {
			System.out.println("getAllEvent 내부에서 오류 : " + e);
		} finally {
			freeResource();
		}
		return count;
	}
	
	
	//이벤트 글 삭제
	public void deleteEvent(int e_num) {
		try {
			con = getConnection();
			sql = "delete from event where e_num = ?";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, e_num);
			pstmt.executeUpdate();
		} catch (Exception e) {
			System.out.println("deleteEvent err: " + e);
		} finally {
			freeResource();
		}
	}
	
	//이벤트 글 수정
	public int modEvent(EventBean bean) {
		int result = 0;
		try {
			con = getConnection();
			sql = "update event set e_title=?, e_content=?, e_file=?, e_startdate=?, e_enddate=? where e_num=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, bean.getE_title());
			pstmt.setString(2, bean.getE_content());
			pstmt.setString(3, bean.getE_file());
			pstmt.setDate(4, bean.getE_startdate());
			pstmt.setDate(5, bean.getE_enddate());
			pstmt.setInt(6, bean.getE_num());
			pstmt.executeUpdate();
			result = 1;
		} catch (Exception e) {
			System.out.println("modEvent err : " + e);
		} finally {
			freeResource();
		}
		return result;
	}
	
	//이벤트 글 상세보기
	public EventBean viewEvent(int e_num) {
		EventBean bean = new EventBean();
		try {
			con = getConnection();
			sql = "select * from event where e_num = ?";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, e_num);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				bean.setE_num(rs.getInt("e_num"));
				bean.setE_title(rs.getString("e_title"));
				bean.setE_content(rs.getString("e_content"));
				bean.setE_file(rs.getString("e_file"));
				bean.setE_startdate(rs.getDate("e_startdate"));
				bean.setE_enddate(rs.getDate("e_enddate"));
				bean.setE_date(rs.getTimestamp("e_date"));
			}
		} catch (Exception e) {
			System.out.println("viewEvent err : " + e);
		} finally {
			freeResource();
		}
		return bean;
	}
	
	//이벤트 글 번호 가져오기
	public EventBean getEvent(int e_num) {
		String sql = "";
		
		EventBean ebean = new EventBean();
		
		try {
			con = getConnection();
			sql = "select * from event where e_num = ?";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, e_num);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				ebean.setE_num(rs.getInt("e_num"));
				ebean.setE_title(rs.getString("e_title"));
				ebean.setE_startdate(rs.getDate("e_startdate"));
				ebean.setE_enddate(rs.getDate("e_enddate"));
				ebean.setE_file(rs.getString("e_file"));
				ebean.setE_content(rs.getString("e_content"));
				
			}
		} catch (Exception e) {
			System.out.println("getEvent err : " + e);
		} finally {
			freeResource();
		}
		
		return ebean;
	}
	
}
