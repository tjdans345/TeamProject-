package Product;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

public class ReplyDAO {
	Connection con;
	PreparedStatement pstmt;
	ResultSet rs;

	@SuppressWarnings("unused")
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

	public List<ReplyVO> getreply(int num) {
		List<ReplyVO> List = new ArrayList<ReplyVO>();
		
		String sql = "";
		
		try {
			con = getConnection();

			sql = "select * from proreply where productnum=? order by replynum desc";
			
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, num);
			
			rs = pstmt.executeQuery();
			
			while (rs.next()) {
				ReplyVO vo = new ReplyVO();
				vo.setReplynum(rs.getInt("replynum"));
				vo.setProductnum(rs.getInt("productnum"));
				vo.setParentsnum(rs.getInt("parentsnum"));
				vo.setId(rs.getString("id"));
				vo.setContent(rs.getString("content"));
				vo.setDate(rs.getDate("date"));
				List.add(vo);
			}
		} catch (Exception e) {
			System.out.println("getreply메소드에서 예외발생 : " + e);
		}finally {
			resource();
		}
		return List;
	}

	public void insertReply(ReplyVO vo) {
		String sql = "";
		int replynum =0;
		try {
			con = getConnection();

			sql = "select max(replynum) from proreply"; 
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				replynum =  rs.getInt("max(replynum)") + 1;		 
			}else {		
				replynum = 1; 
			}
			
			sql ="insert into proreply(replynum,parentsnum,productnum,id,content,date)"
					+ "values(?,?,?,?,?,now())";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, replynum);
			pstmt.setInt(2, vo.getParentsnum());
			pstmt.setInt(3, vo.getProductnum());
			pstmt.setString(4, vo.getId());
			pstmt.setString(5, vo.getContent());

			pstmt.executeUpdate();
			
		} catch (Exception e) {
			System.out.println("insertReply메소드 에서 예외발생 : " + e);
		}finally {
			resource();
		}
		
	}

	public void deleteReply(int replynum) {
		String sql = "";
		
		try {
			con = getConnection();

			sql = "delete from proreply where replynum=?"; 
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, replynum);
			pstmt.executeUpdate();
			
			pstmt.executeUpdate();
			
		} catch (Exception e) {
			System.out.println("deleteReply메소드 에서 예외발생 : " + e);
		}finally {
			resource();
		}
	}

	public void doudelete(int replynum) {
		String sql = "";
		
		try {
			con = getConnection();

			sql = "delete from proreply where parentsnum=?"; 
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, replynum);
			pstmt.executeUpdate();
			
			pstmt.executeUpdate();
			
		} catch (Exception e) {
			System.out.println("doudelete메소드 에서 예외발생 : " + e);
		}finally {
			resource();
		}
	}

	public void updatereply(int replynum, String content) {
		String sql = "";
		
		try {
			con = getConnection();

			sql = "update proreply set content=?, date=now() where replynum=?"; 
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, content);
			pstmt.setInt(2, replynum);
			pstmt.executeUpdate();
			
			pstmt.executeUpdate();
			
		} catch (Exception e) {
			System.out.println("updatereply메소드 에서 예외발생 : " + e);
		}finally {
			resource();
		}
	}

	public void replydelete(int num) {
		String sql = "";
		
		try {
			con = getConnection();

			sql = "delete from proreply where productnum=?"; 
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, num);
			pstmt.executeUpdate();
			
			pstmt.executeUpdate();
			
		} catch (Exception e) {
			System.out.println("replydelete메소드 에서 예외발생 : " + e);
		}finally {
			resource();
		}
	}
}
