package member;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

public class LikeDAO {
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
	
	// 해당 id의 총 좋아요 누른 개수
	public int getTotal(String id) {
		int count = 0;
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql="";
		try {
			con=getConnection();
			sql="SELECT count(*) FROM likeboard WHERE id = ?";
			pstmt=con.prepareStatement(sql);
			pstmt.setString(1, id);
			rs=pstmt.executeQuery();
			if(rs.next()) {
				count=rs.getInt(1);
			}
		} catch (Exception e) {
			System.out.println("getTotal Inner Err : " + e);
		} finally {
			try {
				if(con!=null)con.close();
				if(pstmt!=null)pstmt.close();
				if(rs!=null)rs.close();
			} catch (SQLException e2) {
				e2.printStackTrace();
			}
		}
		return count;
	}//getTotal END
	
	
	public List<LikeBean> getLikeList(String id, int pageFirst, int pageSize){
		Connection con =null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql ="";
		List<LikeBean> likeList = new ArrayList<LikeBean>();
		
		try {
			con = getConnection();
			sql = "SELECT * FROM likeboard WHERE id = ? ORDER BY likenum desc limit ?,?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, id);
			pstmt.setInt(2, pageFirst);
			pstmt.setInt(3, pageSize);
			rs=pstmt.executeQuery();
			while(rs.next()) {
				LikeBean likeBean = new LikeBean();
				likeBean.setId(rs.getString("id"));
				likeBean.setNum(rs.getInt("num"));
				likeBean.setLikenum(rs.getInt("likenum"));
				likeBean.setName(rs.getString("name"));
				likeBean.setImage(rs.getString("image"));
				likeList.add(likeBean);
				
			}
		} catch (Exception e) {
			System.out.println("getLikeList inner err :" +e);
		} finally {
			try {
				if(con!=null)con.close();
				if(pstmt!=null)pstmt.close();
				if(rs!=null)rs.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return likeList;
	}
	
	//찜하기
	public void addLike(int num, String id, String name, String image) {
		Connection con = null;
		PreparedStatement pstmt = null;
		String sql="";
		int likenum = 0;
		ResultSet rs = null;
		try {
			
			con=getConnection();
			
			sql = "SELECT MAX(likenum) FROM likeboard";
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				likenum = rs.getInt("max(likenum)") + 1;
			}else {
				likenum = 1;
			}
			
			sql = "INSERT INTO likeboard(likenum, num, id, name, image) VALUES (?, ?, ?, ?, ?)";
			pstmt=con.prepareStatement(sql);
			pstmt.setInt(1, likenum);
			pstmt.setInt(2, num);			
			pstmt.setString(3, id);
			pstmt.setString(4, name);
			pstmt.setString(5, image);
			
			pstmt.executeUpdate();
			
		} catch (Exception e) {
			System.out.println("addLike Inerr Err : " + e);
		} finally {
			try {
				if(con!=null)con.close();
				if(pstmt!=null)pstmt.close();
				
			} catch (SQLException e2) {
				e2.printStackTrace();
			}
		}
	} // addLike END
	
	//좋아요 판별
	public boolean checkLike(int num, String id) {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql="";
		boolean checkproduct= false;	
		try {
			con=getConnection();
			sql="SELECT * FROM likeboard where num = ? and id = ?";
			pstmt=con.prepareStatement(sql);
			pstmt.setInt(1, num);
			pstmt.setString(2, id);
			rs = pstmt.executeQuery();
			if(rs.next()) checkproduct = true;
		} catch (Exception e) {
		
		} finally {
			try {
				if(con!=null)con.close();
				if(pstmt!=null)pstmt.close();
				if(rs!=null)rs.close();
			} catch (SQLException e2) {
				e2.printStackTrace();
			}
		}
		return checkproduct;
	} // checkLike END
	
	//이미 좋아요 된상태(true)라면 ? 좋아요를 삭제함
	public void delLike(int num, String id) {
		Connection con = null;
		PreparedStatement pstmt = null;
		String sql="";
		try {
			con = getConnection();
			sql = "DELETE FROM likeboard WHERE num = ? and id = ?";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, num);
			pstmt.setString(2, id);
			pstmt.executeUpdate();
		} catch (Exception e) {
			System.out.println("delLike Inner Err : " + e);
		} finally {
			try {
				if(con!=null)con.close();
				if(pstmt!=null)pstmt.close();
				
			} catch (SQLException e2) {
				e2.printStackTrace();
			}
		}
	} // delLike END
	
	
	//해당 게시글의 총 좋아요 개수
	public int getProductTotalLike(int num) {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs =  null;
		String sql = "";
		int likeCount = 0;
		try {
			con=getConnection();
			sql = "SELECT count(*) FROM likeboard where num = ?";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, num);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				likeCount = rs.getInt(1);
			}
		} catch (Exception e) {
			System.out.println("getProductTotalLike Inner Err : " + e);
		} finally {
				try {
					if(con!=null)con.close();
					if(pstmt!=null)pstmt.close();
					if(rs!=null)rs.close();
				} catch (SQLException e2) {
					e2.printStackTrace();
				}
			}
		return likeCount;		
	} // getProductTotalLike END

	
}
