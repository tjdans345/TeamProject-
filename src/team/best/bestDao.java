package team.best;

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

import Product.DetailBean;
import member.LikeBean;


public class bestDao {
	
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
	
	
	public List<DetailBean> getBestList() {
		
		List<DetailBean> bestList = new ArrayList<DetailBean>();
		String sql = "";
		
		try {
			
			con = getConnection();
			
			sql = "select * from details";
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
			int num = rs.getInt(2);
			
			/* sql = "select * from details order by totalreserved desc limit 0, 10"; */
			/* sql = "select * from details group by name order by sum(totalreserved) desc limit 0, 10";*/
			sql = "select d.name, d.num, sum(totalreserved) as totalreserved, d.image, d.today, d.place, d.startdate, (select count(*) from likeboard where num = ?) "
				+ "as totallike from details d join likeboard l on d.num = l.num group by name order by sum(totalreserved) desc limit 0, 10";
			
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, num);
			rs = pstmt.executeQuery();
			System.out.println(pstmt);
			
			while(rs.next()) {
				
				DetailBean Dbean = new DetailBean();
				/* LikeBean Lbean = new LikeBean(); */
				
				Dbean.setNum(rs.getInt("num"));
				Dbean.setImage(rs.getString("image"));
				Dbean.setName(rs.getString("name"));
				Dbean.setTotalreserved(rs.getInt("totalreserved"));
				Dbean.setToday(rs.getDate("today"));
				Dbean.setPlace(rs.getString("place"));
				Dbean.setStartdate(rs.getDate("startdate"));
				
				
/*				
				Dbean.setDetailnum(rs.getInt("detailnum"));
				Dbean.setNum(rs.getInt("num"));
				Dbean.setName(rs.getString("name"));
				Dbean.setGenre(rs.getString("genre"));
				Dbean.setCla(rs.getString("cla"));
				Dbean.setRuntime(rs.getInt("runtime"));
				Dbean.setPrice(rs.getInt("price"));
				Dbean.setStartdate(rs.getDate("startdate"));
				Dbean.setEnddate(rs.getDate("enddate"));
				Dbean.setImage(rs.getString("image"));
				Dbean.setContent(rs.getString("content"));
				Dbean.setPlace(rs.getString("place"));
				Dbean.setSeat(rs.getInt("seat"));
				Dbean.setTotalreserved(rs.getInt("totalreserved"));
				Dbean.setToday(rs.getDate("today"));
				Dbean.setStarttime(rs.getString("starttime"));
*/				
				
				bestList.add(Dbean);
				
			}
			}
			
		} catch (Exception e) {
			System.out.println("getBestList() 에서 예외발생" + e);
			
		} finally {
			if(con != null){try{con.close();}catch(Exception err){}}
			if(rs != null){try{rs.close();}catch(Exception err){}}
			if(pstmt != null){try{con.close();}catch(Exception err){}}
		}
		
		return bestList;
	}


}//faqDao


