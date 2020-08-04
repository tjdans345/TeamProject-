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

public class ProductDAO {
	
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
	
	public ArrayList<ProductBean> getAllProduct() {
		ArrayList<ProductBean> products = new ArrayList<ProductBean>();
		Connection con = null;
		PreparedStatement pstmt = null;
		String sql = "";
		ResultSet rs = null;
		try {
			con = getConnection();
			sql = "SELECT * FROM product";
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				int num = rs.getInt("num");
				String name = rs.getString("name");
				String genre = rs.getString("genre");
				String cla = rs.getString("cla");
				int runtime = rs.getInt("runtime");
				int price = rs.getInt("price");
				Date startdate = rs.getDate("startdate");
				Date enddate = rs.getDate("enddate");
				String image = rs.getString("image");
				String content = rs.getString("content");
			}
		} catch (Exception e) {
			System.out.println("getAllProduct Inner Err : " + e);
		} finally {
			resource();
		}
		
		return products;
	}
	
	public void insertpro(ProductBean productBean) {
		String sql = "";
		int num =0;
		try {
			con = getConnection();

			sql = "select max(num) from product"; 
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				num =  rs.getInt("max(num)") + 1;		 
			}else {		
				num = 1; 
			}
			
			sql ="insert into product(num,name,genre,cla,runtime,"
					+ "price,startdate,enddate,image,content) "
					+ "values(?,?,?,?,?,?,?,?,?,?)";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, num);
			pstmt.setString(2, productBean.getName());
			pstmt.setString(3, productBean.getGenre());
			pstmt.setString(4, productBean.getCla());
			pstmt.setInt(5, productBean.getRuntime());
			pstmt.setInt(6, productBean.getPrice());
			pstmt.setDate(7, productBean.getStartdate());
			pstmt.setDate(8, productBean.getEnddate());
			pstmt.setString(9, productBean.getImage());
			pstmt.setString(10, productBean.getContent());
			
			pstmt.executeUpdate();
			
		} catch (Exception e) {
			System.out.println("insertpro메소드 에서 예외발생 : " + e);
		}finally {
			resource();
		}
	}

	public ProductBean getBoard(int num) {
		
		String sql="";
		
		ProductBean Bean = new ProductBean();
		
		try {
			con = getConnection();

			sql = "select * from product where num=?";

			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, num);

			rs = pstmt.executeQuery();
			System.out.println(pstmt);
			if(rs.next()) {
				Bean.setNum(num);
				Bean.setName(rs.getString("name"));
				Bean.setGenre(rs.getString("genre"));
				Bean.setCla(rs.getString("cla"));
				Bean.setRuntime(rs.getInt("runtime"));
				Bean.setPrice(rs.getInt("price"));
				Bean.setStartdate(rs.getDate("startdate"));
				Bean.setEnddate(rs.getDate("enddate"));
				Bean.setImage(rs.getString("image"));
				Bean.setContent(rs.getString("content"));
				Bean.setRunstatus(rs.getInt("runstatus"));
				System.out.println(Bean.getRunstatus());
			}
		
		} catch (Exception e) {
			System.out.println("getBoard메소드 에서 예외발생 : " + e);
		}finally {
			resource();
		}
		
		return Bean;
	}

	public void delete(int num) {
		String sql="";
		
		try {
			con = getConnection();
			
			sql = "delete from product where num=?";
			
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, num);
			
			pstmt.executeUpdate();
		} catch (Exception e) {
			System.out.println("delete메소드 에서 예외발생 : " + e);
		}finally {
			resource();
		}
		
	}
	
	public List<ProductBean> getList() {
		String sql = "";
		List<ProductBean> List = new ArrayList<ProductBean>();
		
		try {
			con = getConnection();

			sql = "select * from product order by name asc";
			
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();
			
			while (rs.next()) {
				ProductBean Bean = new ProductBean();
				Bean.setNum(rs.getInt("num"));
				Bean.setName(rs.getString("name"));
				Bean.setGenre(rs.getString("genre"));
				Bean.setCla(rs.getString("cla"));
				Bean.setRuntime(rs.getInt("runtime"));
				Bean.setPrice(rs.getInt("price"));
				Bean.setStartdate(rs.getDate("startdate"));
				Bean.setEnddate(rs.getDate("enddate"));
				Bean.setImage(rs.getString("image"));
				Bean.setContent(rs.getString("content"));
				Bean.setRunstatus(rs.getInt("runstatus"));
				List.add(Bean);
			}
		} catch (Exception e) {
			System.out.println("getList메소드에서 예외발생 : " + e);
		}finally {
			resource();
		}
		
		return List;
	}

	public List<ProductBean> getList(int pageFirst, int pageSize) {
		String sql = "";
		List<ProductBean> List = new ArrayList<ProductBean>();
		
		try {
			con = getConnection();

			sql = "select * from product order by startdate desc limit ?,?";
			
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, pageFirst);
			pstmt.setInt(2, pageSize);
			rs = pstmt.executeQuery();
			
			while (rs.next()) {
				ProductBean Bean = new ProductBean();
				Bean.setNum(rs.getInt("num"));
				Bean.setName(rs.getString("name"));
				Bean.setGenre(rs.getString("genre"));
				Bean.setCla(rs.getString("cla"));
				Bean.setRuntime(rs.getInt("runtime"));
				Bean.setPrice(rs.getInt("price"));
				Bean.setStartdate(rs.getDate("startdate"));
				Bean.setEnddate(rs.getDate("enddate"));
				Bean.setImage(rs.getString("image"));
				Bean.setContent(rs.getString("content"));
				Bean.setRunstatus(rs.getInt("runstatus"));
				List.add(Bean);
			}
		} catch (Exception e) {
			System.out.println("getList메소드에서 예외발생 : " + e);
		}finally {
			resource();
		}
		
		return List;
	}
	
	//상품 게시물 총 수
	public int getCount() {
		String sql = "";
		List<ProductBean> List = new ArrayList<ProductBean>();
		int count = 0;
		try {
			con = getConnection();

			sql = "select * from product";
			
			pstmt = con.prepareStatement(sql);
			
			rs = pstmt.executeQuery();
			
			while (rs.next()) {
				count++;
			}
		} catch (Exception e) {
			System.out.println("getCount메소드에서 예외발생 : " + e);
		}finally {
			resource();
		}
		
		return count;
	}

	public List<ProductBean> getList(String search) {
		String sql = "";
		List<ProductBean> List = new ArrayList<ProductBean>();
		
		try {
			con = getConnection();

			sql = "select * from product where name LIKE '%"+search+"%' order by name asc";
			
			pstmt = con.prepareStatement(sql);
			
			rs = pstmt.executeQuery();
			
			while (rs.next()) {
				ProductBean Bean = new ProductBean();
				Bean.setNum(rs.getInt("num"));
				Bean.setName(rs.getString("name"));
				Bean.setGenre(rs.getString("genre"));
				Bean.setCla(rs.getString("cla"));
				Bean.setRuntime(rs.getInt("runtime"));
				Bean.setPrice(rs.getInt("price"));
				Bean.setStartdate(rs.getDate("startdate"));
				Bean.setEnddate(rs.getDate("enddate"));
				Bean.setImage(rs.getString("image"));
				Bean.setContent(rs.getString("content"));
				Bean.setRunstatus(rs.getInt("runstatus"));
				List.add(Bean);
			}
		} catch (Exception e) {
			System.out.println("getList메소드에서 예외발생 : " + e);
		}finally {
			resource();
		}
		
		return List;
	}

}
