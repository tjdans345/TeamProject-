package Order;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.servlet.http.HttpSession;
import javax.sql.DataSource;

import com.mysql.fabric.Response;

import Product.DetailBean;
import Product.ProductBean;
import member.MemberBean;

public class OrderDAO {
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

	//장바구니에 추가하기
	public void insertOrder(OrderVO vo) {
		String sql = "";
		int num =0;
		try {
			con = getConnection();

			sql = "select max(num) from productorder"; 
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				num =  rs.getInt("max(num)") + 1;		 
			}else {		
				num = 1; 
			}
			
			sql ="insert into productorder(num,detailnum,name,genre,cla,runtime,price,startdate,enddate,image,content,"
					+ "place,seat,totalreserved,today,starttime,id,qty,totalprice,orderdate,selectseat)"
					+ "values(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,now(),?)";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, num);
			pstmt.setInt(2, vo.getDetailnum());
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
			pstmt.setString(17, vo.getId());
			pstmt.setInt(18, vo.getQty());
			pstmt.setInt(19, vo.getTotalprice());
			pstmt.setString(20, vo.getSelectseat());
			
			pstmt.executeUpdate();
			
		} catch (Exception e) {
			System.out.println("insertOrder메소드 에서 예외발생 : " + e);
		}finally {
			resource();
		}
	}
	
	//해당 id의 전체 장바구니 내역 리스트조회 (페이징까지)
	public ArrayList<OrderVO> getCartList(String id, int pageFirst, int pageSize){
		ArrayList<OrderVO> cartList = new ArrayList<OrderVO>();
		
		Connection con = null;
		PreparedStatement pstmt = null;
		String sql = "";
		ResultSet rs = null;
		try {
			con = getConnection();
			sql = "SELECT * FROM PRODUCTORDER WHERE ID = ? ORDER BY NUM DESC LIMIT ?,?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, id);
			pstmt.setInt(2, pageFirst);
			pstmt.setInt(3, pageSize);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				OrderVO orderVO = new OrderVO();
				orderVO.setNum(rs.getInt("num"));
				orderVO.setId(rs.getString("id"));
				orderVO.setName(rs.getString("name"));
				orderVO.setQty(rs.getInt("qty"));
				orderVO.setTotalprice(rs.getInt("totalprice"));
				orderVO.setOrderdate(rs.getDate("orderdate"));				
				cartList.add(orderVO);
			}
			
		} catch (Exception e) {
			System.out.println("getCartList Inner Err : " + e);
		} finally {
			try {
				if(rs!=null)rs.close();
				if(pstmt!=null)pstmt.close();
				if(con!=null)con.close();
			} catch (Exception e2) {
				e2.printStackTrace();
			}
		}
		
		return cartList;
	}
	
	//해당 id의 전체 장바구니 내역 총개수
		public ArrayList<OrderVO> getCartList(String id){
			ArrayList<OrderVO> cartList = new ArrayList<OrderVO>();
			
			Connection con = null;
			PreparedStatement pstmt = null;
			String sql = "";
			ResultSet rs = null;
			try {
				con = getConnection();
				sql = "SELECT * FROM PRODUCTORDER WHERE ID = ?";
				pstmt = con.prepareStatement(sql);
				pstmt.setString(1, id);
				rs = pstmt.executeQuery();
				while(rs.next()) {
					OrderVO orderVO = new OrderVO();
					orderVO.setNum(rs.getInt("num"));
					orderVO.setId(rs.getString("id"));
					orderVO.setName(rs.getString("name"));
					orderVO.setQty(rs.getInt("qty"));
					orderVO.setTotalprice(rs.getInt("totalprice"));
					orderVO.setOrderdate(rs.getDate("orderdate"));				
					cartList.add(orderVO);
				}
				
			} catch (Exception e) {
				System.out.println("getCartList Inner Err : " + e);
			} finally {
				try {
					if(rs!=null)rs.close();
					if(pstmt!=null)pstmt.close();
					if(con!=null)con.close();
				} catch (Exception e2) {
					e2.printStackTrace();
				}
			}
			
			return cartList;
		}


	//장바구니 내역삭제
	public void delCart(int num, String id) {
		
		Connection con = null;
		PreparedStatement pstmt = null;
		String sql = "";
		try {
			con = getConnection();
			sql = "DELETE FROM PRODUCTORDER WHERE NUM = ? AND ID = ?";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, num);
			pstmt.setString(2, id);
			pstmt.executeUpdate();
		} catch (Exception e) {
			System.out.println("delCart Inner Err : " + e);
		} finally {
			try {
				if(pstmt!=null)pstmt.close();
				if(con!=null)con.close();
			} catch (Exception e2) {
				e2.printStackTrace();
			}
		}
		
	}
	
	//장바구니 수정
	public int modCart(int num, String id) {
		Connection con = null;
		PreparedStatement pstmt = null;
		String sql = "";
		int result = 0;
		OrderVO orderVO = new OrderVO();
		try {
			con = getConnection();
			sql = "UPDATE PRODUCTORDER SET QTY = ?, TOTALPRICE = ? WHERE NUM = ? AND ID = ?";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, orderVO.getQty());
			pstmt.setInt(2, orderVO.getTotalprice());
			pstmt.setInt(3, num);
			pstmt.setString(4, id);
		} catch (Exception e) {
			System.out.println("modCart Inner Err : " + e);
		} finally {
			try {
				if(pstmt!=null)pstmt.close();
				if(con!=null)con.close();
			} catch (Exception e2) {
				e2.printStackTrace();
			}
		}
		return result;
	}
	
	//장바구니 갯수 조회
	public int getCountCartList(String id) {
		Connection con = null;
		PreparedStatement pstmt = null;
		String sql ="";
		int cartcount = 0;
		ResultSet rs = null;
		try {
			con = getConnection();
			sql = "SELECT COUNT(*) FROM PRODUCTORDER WHERE ID =?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				cartcount = rs.getInt(1);
			}
		} catch (Exception e) {
			System.out.println("getCountCartList Inner Err : " + e);
		} finally {
			try {
				if(rs!=null)rs.close();
				if(pstmt!=null)pstmt.close();
				if(con!=null)con.close();
			} catch (Exception e2) {
				e2.printStackTrace();
			}
		}
		return cartcount;
		
	}

	//장바구니 전체삭제
	public void delAllCart(String id) {
		Connection con = null;
		PreparedStatement pstmt = null;
		String sql = "";
		try {
			con = getConnection();
			sql = "DELETE FROM PRODUCTORDER WHERE ID = ?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, id);
			pstmt.executeUpdate();
		} catch (Exception e) {
			System.out.println("delAllCart Inner Err : " + e);
		} finally {
			try {
				if(pstmt!=null)pstmt.close();
				if(con!=null)con.close();
			} catch (Exception e2) {
				e2.printStackTrace();
			}
		}
	}
	
	//장바구니 전체의 가격 불러오기
	public int getTotalPrice(String id) {
		Connection con = null;
		PreparedStatement pstmt = null;
		String sql = "";
		int total = 0;
		ResultSet rs = null;
		try {
			con = getConnection();
			sql = "SELECT SUM(TOTALPRICE) FROM PRODUCTORDER WHERE ID = ?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				total = rs.getInt(1);
			}
		} catch (Exception e) {
			System.out.println("getTotalPrice Inner Err : " + e);
		} finally {
			try {
				if(rs!=null)rs.close();
				if(pstmt!=null)pstmt.close();
				if(con!=null)con.close();
			} catch (Exception e2) {
				e2.printStackTrace();
			}
		}
		return total;
	}
	
	//장바구니에 이미 추가한 공연명이 같은 상품이 있는지 판별
	public boolean checkproduct(String id, String name) {
		boolean checkp = false;
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "";
		try {
			con = getConnection();
			sql = "SELECT id, name FROM PRODUCTORDER WHERE ID = ? AND NAME = ?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, id);
			pstmt.setString(2, name);
			rs = pstmt.executeQuery();
			if(rs.next()) 	checkp = true;
		} catch (Exception e) {
			System.out.println("checkproduct Inner Err : " + e);
		} finally {
			try {
				if(rs!=null)rs.close();
				if(pstmt!=null)pstmt.close();
				if(con!=null)con.close();
			} catch (Exception e2) {
				e2.printStackTrace();
			}
		}
		return checkp;
	}
	
	//해당 아이디와 장바구니번호에 해당하는 정보 얻기
	public OrderVO getPayInfo(String id, int num) {
		Connection con = null;
		PreparedStatement pstmt = null;
		String sql = "";
		ResultSet rs = null;
		OrderVO vo = new OrderVO();
		try {
			con = getConnection();
			sql = "SELECT * FROM PRODUCTORDER WHERE ID = ? AND NUM = ?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, id);
			pstmt.setInt(2, num);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				vo.setNum(rs.getInt("num"));
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
				vo.setId(rs.getString("id"));
				vo.setQty(rs.getInt("qty"));
				vo.setTotalprice(rs.getInt("totalprice"));
				vo.setOrderdate(rs.getDate("orderdate"));
				vo.setSelectseat(rs.getString("selectseat"));
			}
		} catch (Exception e) {
			System.out.println("getPayInfo Inner Err : " + e);
		} finally {
			try {
				if(rs!=null)rs.close();
				if(pstmt!=null)pstmt.close();
				if(con!=null)con.close();
			} catch (Exception e2) {
				e2.printStackTrace();
			}
		}
		return vo;
	}
	
	public OrderVO getPayInfo(String id) {
		Connection con = null;
		PreparedStatement pstmt = null;
		String sql = "";
		ResultSet rs = null;
		OrderVO vo = new OrderVO();
		try {
			con = getConnection();
			sql = "SELECT * FROM PRODUCTORDER WHERE ID = ?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				vo.setNum(rs.getInt("num"));
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
				vo.setId(rs.getString("id"));
				vo.setQty(rs.getInt("qty"));
				vo.setTotalprice(rs.getInt("totalprice"));
				vo.setOrderdate(rs.getDate("orderdate"));
				vo.setSelectseat(rs.getString("selectseat"));
			}
		} catch (Exception e) {
			System.out.println("getPayInfo Inner Err : " + e);
		} finally {
			try {
				if(rs!=null)rs.close();
				if(pstmt!=null)pstmt.close();
				if(con!=null)con.close();
			} catch (Exception e2) {
				e2.printStackTrace();
			}
		}
		return vo;
	}
	
	
	//결제테이블에 결제내용 추가하기
	public void addPayment(OrderVO payVO) {
		Connection con = null;
		PreparedStatement pstmt = null;
		String sql = "";
		int p_num = 0;
		ResultSet rs = null;
		try {
			con = getConnection();
			
			sql = "SELECT MAX(p_num) FROM PAYMENT";
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				p_num = rs.getInt("max(p_num)") + 1;
			}else {
				p_num = 1;
			}
			
			sql = "INSERT INTO payment(p_num, totalprice, qty, name, id, p_paydate, selectseat, today,detailnum,genre,image,place,runtime) VALUES (?,?,?,?,?,now(),?,?,?,?,?,?,?)";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, p_num);
			pstmt.setInt(2, payVO.getTotalprice());
			pstmt.setInt(3, payVO.getQty());
			pstmt.setString(4, payVO.getName());
			pstmt.setString(5, payVO.getId());
			pstmt.setString(6, payVO.getSelectseat());
			pstmt.setDate(7, payVO.getToday());
			pstmt.setInt(8, payVO.getDetailnum());
			pstmt.setString(9, payVO.getGenre());
			pstmt.setString(10, payVO.getImage());
			pstmt.setString(11, payVO.getPlace());
			pstmt.setInt(12, payVO.getRuntime());
			pstmt.executeUpdate();
			
		} catch (Exception e) {
			System.out.println("addPayment Inner Err : " + e);
		} finally {
			try {
				if(rs!=null)rs.close();
				if(pstmt!=null)pstmt.close();
				if(con!=null)con.close();
			} catch (Exception e2) {
				e2.printStackTrace();
			}
		}
	}
	
	//결제테이블 결제완료
	public void payResult(String id, int num, int totalprice) {
		Connection con = null;
		PreparedStatement pstmt = null;
		String sql = "";
		ResultSet rs = null;
		MemberBean memberBean = new MemberBean();
		OrderVO orderVO = new OrderVO();
		try {
			con = getConnection();
			sql = "SELECT point FROM USERS WHERE ID = ?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				memberBean.setId(id);
				memberBean.setPoint(rs.getInt("point"));
			}
			int point = memberBean.getPoint();
			
			sql = "UPDATE USERS set point = point-? WHERE ID = ?";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, totalprice);
			pstmt.setString(2, id);
			pstmt.executeUpdate();
			System.out.println(totalprice);
		} catch (Exception e) {
			System.out.println("payResult Inner Err : " + e);
		} finally {
			try {
				if(rs!=null)rs.close();
				if(pstmt!=null)pstmt.close();
				if(con!=null)con.close();
			} catch (Exception e2) {
				e2.printStackTrace();
			}
		}
	}
	
	//해당 id의 결제내역 보기
	public ArrayList<OrderVO> getPaymentList(String id) {
		ArrayList<OrderVO> paymentList = new ArrayList<OrderVO>();
		Connection con = null;
		PreparedStatement pstmt = null;
		String sql = "";
		ResultSet rs = null;
		
		try {
			con = getConnection();
			sql = "SELECT * FROM PAYMENT WHERE ID = ?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				OrderVO paymentVO = new OrderVO();
				paymentVO.setId(id);
				paymentVO.setName(rs.getString("name"));
				paymentVO.setQty(rs.getInt("qty"));
				paymentVO.setP_seq_num(rs.getInt("p_seq_num"));
				paymentVO.setP_num(rs.getInt("p_num"));
				paymentVO.setTotalprice(rs.getInt("totalprice"));
				paymentVO.setP_paydate(rs.getDate("p_paydate"));
				paymentList.add(paymentVO);
			}
		} catch (Exception e) {
			System.out.println("getPaymentList Inner Err : " + e);
		} finally {
			try {
				if(rs!=null)rs.close();
				if(pstmt!=null)pstmt.close();
				if(con!=null)con.close();
			} catch (Exception e2) {
				e2.printStackTrace();
			}
		}
		
		return paymentList;
	}
	
	//해당 id의 결제내역 보기(페이징)
		public ArrayList<OrderVO> getPaymentList(String id, int pageFirst, int pageSize) {
			ArrayList<OrderVO> paymentList = new ArrayList<OrderVO>();
			Connection con = null;
			PreparedStatement pstmt = null;
			String sql = "";
			ResultSet rs = null;
			
			try {
				con = getConnection();
				sql = "SELECT * FROM PAYMENT WHERE ID = ? ORDER BY p_seq_num DESC LIMIT ?,?";
				pstmt = con.prepareStatement(sql);
				pstmt.setString(1, id);
				pstmt.setInt(2, pageFirst);
				pstmt.setInt(3, pageSize);
				rs = pstmt.executeQuery();
				while(rs.next()) {
					OrderVO paymentVO = new OrderVO();
					paymentVO.setId(id);
					paymentVO.setName(rs.getString("name"));
					paymentVO.setQty(rs.getInt("qty"));
					paymentVO.setP_seq_num(rs.getInt("p_seq_num"));
					paymentVO.setP_num(rs.getInt("p_num"));
					paymentVO.setTotalprice(rs.getInt("totalprice"));
					paymentVO.setP_paydate(rs.getDate("p_paydate"));
					paymentList.add(paymentVO);
				}
			} catch (Exception e) {
				System.out.println("getPaymentList Inner Err : " + e);
			} finally {
				try {
					if(rs!=null)rs.close();
					if(pstmt!=null)pstmt.close();
					if(con!=null)con.close();
				} catch (Exception e2) {
					e2.printStackTrace();
				}
			}
			
			return paymentList;
		}
	
	//해당 id의 총 결제금액 
	public int getTotalPayPrice(String id) {
		Connection con = null;
		PreparedStatement pstmt = null;
		String sql = "";
		ResultSet rs = null;
		int totalpayprice = 0;
		try {
			con = getConnection();
			sql = "SELECT SUM(TOTALPRICE) FROM PAYMENT WHERE ID = ?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				totalpayprice = rs.getInt(1);
			}
		} catch (Exception e) {
			System.out.println("getTotalPayPrice Inner Err : " + e);
		} finally {
			try {
				if(rs!=null)rs.close();
				if(pstmt!=null)pstmt.close();
				if(con!=null)con.close();
			} catch (Exception e2) {
				e2.printStackTrace();
			}
		}
		return totalpayprice;
	}
	
	//해당 id의 결제번호에 해당하는 결제내역 삭제
	public void delPay(int p_num, String id) {
		Connection con = null;
		PreparedStatement pstmt = null;
		String sql = "";
		try {
			con = getConnection();
			sql = "DELETE FROM PAYMENT WHERE P_NUM = ? AND ID = ?";
			pstmt=con.prepareStatement(sql);
			pstmt.setInt(1, p_num);
			pstmt.setString(2, id);
			pstmt.executeUpdate();
		} catch (Exception e) {
			System.out.println("delPay Inner Err : " + e);
		} finally {
			try {
				if(pstmt!=null)pstmt.close();
				if(con!=null)con.close();
			} catch (Exception e2) {
				e2.printStackTrace();
			}
		}
	}
	
	//해당 id의 전체 결제내역 삭제
	public void delAllpay(String id) {
		Connection con = null;
		PreparedStatement pstmt = null;
		String sql = "";
		try {
			con = getConnection();
			sql = "DELETE FROM PAYMENT WHERE ID = ?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, id);
			pstmt.executeUpdate();
		} catch (Exception e) {
			System.out.println("delAllpay Inner Err : " + e);
		} finally {
			try {
				if(pstmt!=null)pstmt.close();
				if(con!=null)con.close();
			} catch (Exception e2) {
				e2.printStackTrace();
			}
		}
	}
	
	//해당 id의 주문완료 개수
	public int getCountPay(String id) {
		int countPay = 0;
		Connection con = null;
		PreparedStatement pstmt = null;
		String sql = "";
		ResultSet rs = null;
		try {
			con = getConnection();
			sql = "SELECT COUNT(*) FROM PAYMENT WHERE ID = ?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				countPay = rs.getInt(1);
			}
		} catch (Exception e) {
			System.out.println("getCountPay Inner Err : " + e);
		} finally {
			try {
				if(rs!=null)rs.close();
				if(pstmt!=null)pstmt.close();
				if(con!=null)con.close();
			} catch (Exception e2) {
				e2.printStackTrace();
			}
		}
		return countPay;
	}
	
	//장바구니 전체 결제
	public void addAllPay(List<OrderVO> list){
		try {
			con=getConnection();
			int p_num = 0;
			String sql = "SELECT MAX(p_num) FROM PAYMENT";
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				p_num = rs.getInt("max(p_num)") + 1;
			}else {
				p_num = 1;
			}
			sql = "insert into payment (p_num,qty,p_paydate,totalprice,name,id,selectseat,today,detailnum,genre,image,place,runtime) values ";
			for(int i = 0 ; i<list.size() ; i++) {
				OrderVO vo =  list.get(i);
				sql+="("+
						p_num +
						","+vo.getQty()+
						", now()" +
						","+ vo.getTotalprice()+",'"+vo.getName() +
						"','"+ vo.getId() +
						"','"+vo.getSelectseat() + 
						"','"+vo.getToday() + 
						"',"+vo.getDetailnum() + 
						",'"+vo.getGenre() + 
						"','"+vo.getImage() +
						"','"+vo.getPlace() +
						"',"+vo.getRuntime() +
					  ")";
				System.out.println(vo.getSelectseat());
				if(i!=list.size()-1) {
					sql+=",";
				}
			}
			pstmt=con.prepareStatement(sql);
			System.out.println(pstmt);
			System.out.println();
			pstmt.executeUpdate();
		} catch (Exception e) {
			System.out.println("addAllPay Inner Err : "+ e);
		}finally {
			resource();
		}
	}
	
	//해당 id의 장바구니 전체정보를 List에 담아 반환
	public List<OrderVO> getPayInfo1(String id) {
		List<OrderVO> list = new ArrayList<OrderVO>();
		try {
			int p_num =0;
			con = getConnection();
			String sql = "SELECT MAX(p_num) FROM PAYMENT";
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				p_num = rs.getInt("max(p_num)") + 1;
			}else {
				p_num = 1;
			}
			sql = "select * from productorder where id = ?";
			pstmt=con.prepareStatement(sql);
			pstmt.setString(1, id);
			rs=pstmt.executeQuery();
			while(rs.next()) {
				OrderVO vo = new OrderVO(
										rs.getInt("detailnum"),
										rs.getInt("runtime"),
										rs.getInt("qty"),
										rs.getInt("totalprice"),
										p_num,
										rs.getString("genre"),
										rs.getString("image"),
										rs.getString("place"),
										id,
										rs.getString("selectseat"),
										rs.getString("name"),
										rs.getDate("today")
										); 
				list.add(vo);
			}
		} catch (Exception e) {e.printStackTrace();}finally {resource();}
		return list;
	}
	
	public void AllpayResult(String id, int totalprice) {
		Connection con = null;
		PreparedStatement pstmt = null;
		String sql = "";
		ResultSet rs = null;
		MemberBean memberBean = new MemberBean();
		OrderVO orderVO = new OrderVO();
		try {
			con = getConnection();
			sql = "SELECT POINT FROM USERS WHERE ID = ?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				memberBean.setId(id);
				memberBean.setPoint(rs.getInt("point"));
			}
			int point = memberBean.getPoint();
			
			sql = "UPDATE USERS SET POINT = POINT - ? WHERE ID = ?";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, totalprice);
			pstmt.setString(2, id);
			pstmt.executeUpdate();
			System.out.println("총결제 totalprice : " + totalprice);
		} catch (Exception e) {

		} finally {
			resource();
		}
	}
	
	//선택한 콘서트의 예약된 좌석 구하기
	public List<OrderVO> getSeat(Date today, int detailnum) {
		Connection con = null;
		PreparedStatement pstmt = null;
		String sql = "";
		ResultSet rs = null;
		List<OrderVO> selectseat = new ArrayList<OrderVO>();
		try {
			con = getConnection();
			sql = "SELECT * FROM PAYMENT WHERE TODAY = ? AND DETAILNUM = ?";
			pstmt = con.prepareStatement(sql);
			pstmt.setDate(1, today);
			pstmt.setInt(2, detailnum);
			rs = pstmt.executeQuery();
			//System.out.println(pstmt);
			while(rs.next()) {
				OrderVO vo = new OrderVO(
										detailnum, 
										rs.getInt("runtime"),
										rs.getInt("qty"), 
										rs.getInt("totalprice"),
										rs.getInt("p_seq_num"),
										rs.getString("genre"),
										rs.getString("image"),
										rs.getString("place"),
										rs.getString("id"),
										rs.getString("selectseat"),
										rs.getString("name"),
										today); 
				selectseat.add(vo);
			}
			
		} catch (Exception e) {
			System.out.println("getSeat Inner Err :" + e);
		} finally {
			try {
				if(rs!=null)rs.close();
				if(pstmt!=null)pstmt.close();
				if(con!=null)con.close();
			} catch (Exception e2) {

			}
		}
		return selectseat;
	}

	public OrderVO selectNum(int num) {
		
		OrderVO vo = new OrderVO();
		String sql = "";
		
		try {
			con = getConnection();
			sql = "select * from productorder where num = ?";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, num);
			
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				
				vo.setNum(rs.getInt("num"));
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
				vo.setId(rs.getString("id"));
				vo.setQty(rs.getInt("qty"));
				vo.setTotalprice(rs.getInt("totalprice"));
				vo.setOrderdate(rs.getDate("orderdate"));
				vo.setSelectseat(rs.getString("selectseat"));
				
			}
			
			
		} catch (Exception e) {
			System.out.println("selectNum메소드에서 예외발생 : " + e);
		} finally {
			try {
				if(rs!=null)rs.close();
				if(pstmt!=null)pstmt.close();
				if(con!=null)con.close();
			} catch (Exception e2) {

			}
		}
		
		
		return vo;
		
		
		
		
		
	}

	public void deletoder(int num) {
		String sql = "";
		
		try {
			con = getConnection();
			sql = "delete from productorder where num = ?";
			pstmt=con.prepareStatement(sql);
			pstmt.setInt(1, num);
			pstmt.executeUpdate();
			
			
			
		} catch (Exception e) {
			System.out.println("deleteoder 메소드 내부에서 오류 :" + e); 
		} finally {
			try {
				if(rs!=null)rs.close();
				if(pstmt!=null)pstmt.close();
				if(con!=null)con.close();
			} catch (Exception e2) {

			}
		}
		
	}

	public List<OrderVO> selectId(String id) {
		
	List<OrderVO> orderList = new ArrayList<OrderVO>();
	
	String sql = "";
	
	try {
		con = getConnection();
		sql = "select * from productorder where id = ?";
		pstmt = con.prepareStatement(sql);
		pstmt.setString(1, id);
		rs = pstmt.executeQuery();
		
		while(rs.next()) {
			OrderVO vo = new OrderVO();
			vo.setNum(rs.getInt("num"));
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
			vo.setId(rs.getString("id"));
			vo.setQty(rs.getInt("qty"));
			vo.setTotalprice(rs.getInt("totalprice"));
			vo.setOrderdate(rs.getDate("orderdate"));
			vo.setSelectseat(rs.getString("selectseat"));
			orderList.add(vo);
			
		}
		
	} catch (Exception e) {
		System.out.println("selectId 메소드 내부에서 오류 :" + e);
	} finally {
		try {
			if(rs!=null)rs.close();
			if(pstmt!=null)pstmt.close();
			if(con!=null)con.close();
		} catch (Exception e2) {

		}
	}
		
		
		return orderList;
	}
	
}
