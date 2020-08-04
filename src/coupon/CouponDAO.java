package coupon;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

public class CouponDAO {

	Connection con;
	PreparedStatement pstmt;
	ResultSet rs;
	DataSource ds;
	
	//DB연결
	private Connection getConnection() throws Exception{
		
		Context init = new InitialContext();
		DataSource ds = (DataSource)init.lookup("java:comp/env/jdbc/pp");
		Connection con = ds.getConnection();
		ResultSet rs = null;
		return con;
		
	}
	
	public int getAllEvent() {
		int count = 0;
		String sql = "";
		try {
			con = getConnection();
			sql = "select * from coupon";
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				count ++;
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if(rs != null) try{rs.close();}catch(Exception e) {e.printStackTrace();}
			if(pstmt != null) try{pstmt.close();}catch(Exception e) {e.printStackTrace();}
			if(con != null) try{con.close();}catch(Exception e) {e.printStackTrace();}
		}
		
		return count;
	}
	
	public void insertevent(CouponBean couponBean) {
		String sql = "";
		int event_num = 0;
		
		try {
			con = getConnection();
			
			sql = "select max(event_num) from coupon";
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				event_num = rs.getInt("max(event_num)") + 1;
			}else {
				event_num = 1;
			}
			
			sql = "insert into coupon(event_num,event_title,event_image,event_timage,"
					+ "event_content,event_startdate,event_enddate) "
					+ "values(?,?,?,?,?,?,?)";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, event_num);
			pstmt.setString(2, couponBean.getEvent_title());
			pstmt.setString(3, couponBean.getEvent_image());
			pstmt.setString(4, couponBean.getEvent_timage());
			pstmt.setString(5, couponBean.getEvent_content());
			pstmt.setDate(6, couponBean.getEvent_startdate());
			pstmt.setDate(7, couponBean.getEvent_enddate());
			
			pstmt.executeUpdate();
			
		} catch (Exception e) {
			System.out.println("insertevent에서 예외 발생" + e);
		} finally {
			if(rs != null) try{rs.close();}catch(Exception e) {e.printStackTrace();}
			if(pstmt != null) try{pstmt.close();}catch(Exception e) {e.printStackTrace();}
			if(con != null) try{con.close();}catch(Exception e) {e.printStackTrace();}
		}
		
	} //insertevent 메소드 끝
	
	public CouponBean eventInfo(int event_num) {
		
		CouponBean bean = null;
		String sql = "";
		
		try {
			con = getConnection();
			
			sql = "select * from coupon where event_num=?";
			
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, event_num);
			
			rs = pstmt.executeQuery();
			
			while (rs.next()) {
				bean = new CouponBean();
				bean.setEvent_num(rs.getInt(1));
				bean.setEvent_title(rs.getString(2));
				bean.setEvent_image(rs.getString(3));
				bean.setEvent_timage(rs.getString(4));
				bean.setEvent_content(rs.getString(5));
				bean.setEvent_startdate(rs.getDate(6));
				bean.setEvent_enddate(rs.getDate(7));
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if(rs != null) try{rs.close();}catch(Exception e) {e.printStackTrace();}
			if(pstmt != null) try{pstmt.close();}catch(Exception e) {e.printStackTrace();}
			if(con != null) try{con.close();}catch(Exception e) {e.printStackTrace();}
		}
		
		return bean;
	}//eventInfo 메소드 끝
	
	
	
	public List<CouponBean> getList(int pageFirst, int pageSize) {
		String sql = "";
		List<CouponBean> list = new ArrayList<CouponBean>();
		
		try {
			con = getConnection();
			
			sql = "select * from coupon order by event_num desc limit ?,?";
			
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, pageFirst);
			pstmt.setInt(2, pageSize);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				CouponBean bean = new CouponBean();
				bean.setEvent_num(rs.getInt("event_num"));
				bean.setEvent_title(rs.getString("event_title"));
				bean.setEvent_image(rs.getString("event_image"));
				bean.setEvent_timage(rs.getString("event_timage"));
				bean.setEvent_content(rs.getString("event_content"));
				bean.setEvent_startdate(rs.getDate("event_startdate"));
				bean.setEvent_enddate(rs.getDate("event_enddate"));
				
				list.add(bean);
				
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if(rs != null) try{rs.close();}catch(Exception e) {e.printStackTrace();}
			if(pstmt != null) try{pstmt.close();}catch(Exception e) {e.printStackTrace();}
			if(con != null) try{con.close();}catch(Exception e) {e.printStackTrace();}
		}
		return list;
	}//getList메소드 끝
	
	public CouponBean getEventNum(int event_num) {
		
		String sql = "";
		
		CouponBean eBean = new CouponBean();
		
		try {
			con = getConnection();
			
			sql = "select * from coupon where event_num=?";
			
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, event_num);
			rs = pstmt.executeQuery();
			
			while (rs.next()) {
				eBean.setEvent_num(rs.getInt("event_num"));
				eBean.setEvent_title(rs.getString("event_title"));
				eBean.setEvent_image(rs.getString("event_image"));
				eBean.setEvent_timage(rs.getString("event_timage"));
				eBean.setEvent_content(rs.getString("event_content"));
				eBean.setEvent_startdate(rs.getDate("event_startdate"));
				eBean.setEvent_enddate(rs.getDate("event_enddate"));
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if(rs != null) try{rs.close();}catch(Exception e) {e.printStackTrace();}
			if(pstmt != null) try{pstmt.close();}catch(Exception e) {e.printStackTrace();}
			if(con != null) try{con.close();}catch(Exception e) {e.printStackTrace();}
		}
		
		return eBean;
	}//getEventNum 메소드 끝
	
	
	public void eventUpdateProc(CouponBean couponBean) {
		
		String sql = "";
		
		try {
			con = getConnection();
			
			sql = "update coupon set event_title=?, event_image=?, event_timage=?"
				+ ", event_content=?, event_startdate=?, event_enddate=? where event_num=?";
			
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, couponBean.getEvent_title());
			pstmt.setString(2, couponBean.getEvent_image());
			pstmt.setString(3, couponBean.getEvent_timage());
			pstmt.setString(4, couponBean.getEvent_content());
			pstmt.setDate(5, couponBean.getEvent_startdate());
			pstmt.setDate(6, couponBean.getEvent_enddate());
			pstmt.setInt(7, couponBean.getEvent_num());
			pstmt.executeUpdate();
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if(rs != null) try{rs.close();}catch(Exception e) {e.printStackTrace();}
			if(pstmt != null) try{pstmt.close();}catch(Exception e) {e.printStackTrace();}
			if(con != null) try{con.close();}catch(Exception e) {e.printStackTrace();}
		}
		
	}//
	
	public void eventDelete(int event_num) { //이벤트 삭제 메소드
		
		String sql = "";
		
		try {
			con = getConnection();
			
			sql = "delete from coupon where event_num=?";
			
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, event_num);
			pstmt.executeUpdate();
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if(rs != null) try{rs.close();}catch(Exception e) {e.printStackTrace();}
			if(pstmt != null) try{pstmt.close();}catch(Exception e) {e.printStackTrace();}
			if(con != null) try{con.close();}catch(Exception e) {e.printStackTrace();}
		}
		
	}// eventDelete 메소드 끝
	
	
}
