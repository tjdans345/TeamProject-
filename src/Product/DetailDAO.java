package Product;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

public class DetailDAO {
	
	Connection con;
	PreparedStatement pstmt;
	ResultSet rs;
	
	private Connection getConnection() throws Exception{		
		Context init = new InitialContext();
		
		DataSource ds = (DataSource)init.lookup("java:comp/env/jdbc/pp");
		
		Connection con = ds.getConnection();
		
		return con;
	}
	
	public void resource() {
		if(rs != null) try{rs.close();}catch(Exception e) {e.printStackTrace();}
		if(pstmt != null) try{pstmt.close();}catch(Exception e) {e.printStackTrace();}
		if(con != null) try{con.close();}catch(Exception e) {e.printStackTrace();}		
	}


	public void insertDetail(DetailBean vo) {
		String sql = "";
		int detailnum =0;
		try {
			con = getConnection();

			sql = "select max(detailnum) from details"; 
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				detailnum =  rs.getInt("max(detailnum)") + 1;		 
			}else {		
				detailnum = 1; 
			}
			
			sql ="insert into details(detailnum,num,name,genre,cla,runtime,price,startdate,enddate,image,content,"
					+ "place,seat,totalreserved,today,starttime) "
					+ "values(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)";
			
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, detailnum);
			pstmt.setInt(2, vo.getNum());
			pstmt.setString(3, vo.getName());
			pstmt.setString(4, vo.getGenre());
			pstmt.setString(5, vo.getCla());
			pstmt.setInt(6, vo.getRuntime());
			pstmt.setInt(7, vo.getPrice());
			pstmt.setDate(8, vo.getStartdate());
			pstmt.setDate(9, vo.getEnddate());
			pstmt.setString(10, vo.getImage());
			pstmt.setString(11, vo.getContent());
			pstmt.setString(12, vo.getPlace());
			pstmt.setInt(13, vo.getSeat());
			pstmt.setInt(14, vo.getTotalreserved());
			pstmt.setDate(15, vo.getToday());
			pstmt.setString(16, vo.getStarttime());
			
			pstmt.executeUpdate();
			
		} catch (Exception e) {
			System.out.println("insertDetail메소드 에서 예외발생 : " + e);
		}finally {
			resource();
		}
		
	}

	public List<DetailBean> getdetail(String name) {
		String sql="";
		List<DetailBean> detail = new ArrayList<DetailBean>();

		try {
			con = getConnection();

			sql = "select * from details where name=? order by today asc, starttime asc";

			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, name);

			rs = pstmt.executeQuery();

			while (rs.next()) {
				DetailBean vo = new DetailBean();
				vo.setDetailnum(rs.getInt("detailnum"));
				vo.setName(rs.getString("name"));
				vo.setGenre(rs.getString("genre"));
				vo.setCla(rs.getString("cla"));
				vo.setRuntime(rs.getInt("runtime"));
				vo.setPrice(rs.getInt("price"));
				vo.setStartdate(rs.getDate("startdate"));
				vo.setEnddate(rs.getDate("enddate"));
				vo.setImage(rs.getString("image"));
				vo.setContent(rs.getString("content"));
				vo.setPlace(rs.getString("place"));
				vo.setSeat(rs.getInt("seat"));
				vo.setTotalreserved(rs.getInt("totalreserved"));
				vo.setToday(rs.getDate("today"));
				vo.setStarttime(rs.getString("starttime"));
				vo.setNum(rs.getInt("num"));
				detail.add(vo);
			}
		} catch (Exception e) {
			System.out.println("getdetail메소드 에서 예외발생 : " + e);
		}finally {
			resource();
		}
		return detail;
	}
	
	public DetailBean getdetails(int detail) {
		DetailBean vo = new DetailBean();
		String sql="";
		
		try {
			con = getConnection();

			sql = "select * from details where detailnum=?";

			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, detail);

			rs = pstmt.executeQuery();

			if(rs.next()) {
				vo.setDetailnum(rs.getInt("detailnum"));
				vo.setName(rs.getString("name"));
				vo.setGenre(rs.getString("genre"));
				vo.setCla(rs.getString("cla"));
				vo.setRuntime(rs.getInt("runtime"));
				vo.setPrice(rs.getInt("price"));
				vo.setStartdate(rs.getDate("startdate"));
				vo.setEnddate(rs.getDate("enddate"));
				vo.setImage(rs.getString("image"));
				vo.setContent(rs.getString("content"));
				vo.setPlace(rs.getString("place"));
				vo.setSeat(rs.getInt("seat"));
				vo.setTotalreserved(rs.getInt("totalreserved"));
				vo.setToday(rs.getDate("today"));
				vo.setStarttime(rs.getString("starttime"));
				vo.setNum(rs.getInt("num"));
			}
		} catch (Exception e) {
			System.out.println("details메소드 에서 예외발생 : " + e);
		}finally {
			resource();
		}
			
		return vo;
	}
	//content 페이지 공연장소 조회 메소드 (오버로딩)
	public DetailBean getdetails2(int num) {
		DetailBean vo = new DetailBean();
		String sql="";
		
		try {
			con = getConnection();

			sql = "select * from details where num=?";

			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, num);

			rs = pstmt.executeQuery();

			if(rs.next()) {
				vo.setDetailnum(rs.getInt("detailnum"));
				vo.setName(rs.getString("name"));
				vo.setGenre(rs.getString("genre"));
				vo.setCla(rs.getString("cla"));
				vo.setRuntime(rs.getInt("runtime"));
				vo.setPrice(rs.getInt("price"));
				vo.setStartdate(rs.getDate("startdate"));
				vo.setEnddate(rs.getDate("enddate"));
				vo.setImage(rs.getString("image"));
				vo.setContent(rs.getString("content"));
				vo.setPlace(rs.getString("place"));
				vo.setSeat(rs.getInt("seat"));
				vo.setTotalreserved(rs.getInt("totalreserved"));
				vo.setToday(rs.getDate("today"));
				vo.setStarttime(rs.getString("starttime"));
				vo.setNum(rs.getInt("num"));
			}
		} catch (Exception e) {
			System.out.println("details메소드 에서 예외발생 : " + e);
		}finally {
			resource();
		}
			
		return vo;
	}

	public void UpdateSeat(int num, int sub) {
		String sql = "";
		
		try {
			con = getConnection();

			sql = "update details set totalreserved=? where detailnum=?"; 
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, sub);
			pstmt.setInt(2, num);
			pstmt.executeUpdate();
			
			
		} catch (Exception e) {
			System.out.println("UpdateSeat메소드 에서 예외발생 : " + e);
		}finally {
			resource();
		}
		
	}

	public void detaildelete(String name) {
		String sql="";

		try {
			con = getConnection();

			sql = "delete from details where name=?";

			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, name);

			pstmt.executeUpdate();
		} catch (Exception e) {
			System.out.println("detaildelete메소드 에서 예외발생 : " + e);
		}finally {
			resource();
		}
		
	}

	public List<DetailBean> SelectByDate(Date selectdate, String name) {
		List<DetailBean> detList = new ArrayList<DetailBean>();
		String sql = "";
		
		try {
			con = getConnection();

			sql = "select * from details where name=? and today=?";

			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, name);
			pstmt.setDate(2, selectdate);

			rs = pstmt.executeQuery();

			while (rs.next()) {
				DetailBean vo = new DetailBean();
				vo.setDetailnum(rs.getInt("detailnum"));
				vo.setName(rs.getString("name"));
				vo.setGenre(rs.getString("genre"));
				vo.setCla(rs.getString("cla"));
				vo.setRuntime(rs.getInt("runtime"));
				vo.setPrice(rs.getInt("price"));
				vo.setStartdate(rs.getDate("startdate"));
				vo.setEnddate(rs.getDate("enddate"));
				vo.setImage(rs.getString("image"));
				vo.setContent(rs.getString("content"));
				vo.setPlace(rs.getString("place"));
				vo.setSeat(rs.getInt("seat"));
				vo.setTotalreserved(rs.getInt("totalreserved"));
				vo.setToday(rs.getDate("today"));
				vo.setStarttime(rs.getString("starttime"));
				vo.setNum(rs.getInt("num"));
				detList.add(vo);
			}
		} catch (Exception e) {
			System.out.println("SelectByDate메소드 에서 예외발생 : " + e);
		}finally {
			resource();
		}
		return detList;
	}
}
