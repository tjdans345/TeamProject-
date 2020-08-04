package admin;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.List;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

import member.MemberBean;

public class AdminDAO {
	
	Connection con;
	PreparedStatement pstmt;
	ResultSet rs;
	DataSource ds;
	//DB연결
	
	private Connection getConnection() throws Exception {
		
		Context init = new InitialContext();
		DataSource ds = (DataSource)init.lookup("java:comp/env/jdbc/pp");
		Connection con = ds.getConnection();
		ResultSet rs = null;
		return con;
		
	}
	
	//전체 회원 조회 메소드
	public List<AdminBean> getAllmember(int startRow, int endRow, String search, String selectserach) {
		
		Connection con=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		DataSource ds=null;
		String sql = "";
		List<AdminBean> memberlist = new ArrayList<AdminBean>();
		try {
			// 디비 이름순으로 뽑아올수있으려나 ?
			//1,2 디비연결 후 커넥션을 얻어옵니다.
			int count = 0;
			con=getConnection();
			sql = "select * from users where "+selectserach+" like ? order by reg_date desc limit ?,?";
			pstmt=con.prepareStatement(sql);
			pstmt.setString(1, "%"+search+"%");
			pstmt.setInt(2, startRow);
			pstmt.setInt(3, endRow);
			rs= pstmt.executeQuery();
			
			while(rs.next()) {
				AdminBean aBean = new AdminBean();
				aBean.setId(rs.getString("id"));
				aBean.setPassword(rs.getString("password"));
				aBean.setName(rs.getString("name"));
				aBean.setEmail(rs.getString("email"));
				aBean.setStatus(rs.getInt("status"));
				aBean.setIs_admin(rs.getInt("is_admin"));
				aBean.setZipcode(rs.getString("zipcode"));
				aBean.setAddress1(rs.getString("address1"));
				aBean.setAddress2(rs.getString("address2"));
				aBean.setPhone(rs.getString("phone"));
				aBean.setPoint(rs.getInt("point"));
				aBean.setReg_date(rs.getTimestamp("reg_date"));
				memberlist.add(aBean);
			}
			
		} catch (Exception e) {
			System.out.println("getAllmember 메소드 내부에서 오류 :" + e);
		} finally {
			try {
				if(con!=null)con.close();
				if(pstmt!=null)pstmt.close();
				if(rs!=null)rs.close();
			} catch (Exception e2) {
				e2.printStackTrace();
			}
		}
			return memberlist; //전체 회원정보 memberlist 리턴
	}
	
	//전체 회원 조회 메소드 (검색기준값 없을때)
		public List<AdminBean> getAllmember(int startRow, int endRow, String search) {
			
			Connection con=null;
			PreparedStatement pstmt=null;
			ResultSet rs=null;
			DataSource ds=null;
			String sql = "";
			List<AdminBean> memberlist = new ArrayList<AdminBean>();
			try {
				// 디비 이름순으로 뽑아올수있으려나 ?
				//1,2 디비연결 후 커넥션을 얻어옵니다.
				int count = 0;
				con=getConnection();
				sql = "select * from users where id like ? order by reg_date desc limit ?,?";
				pstmt=con.prepareStatement(sql);
				pstmt.setString(1, "%"+search+"%");
				pstmt.setInt(2, startRow);
				pstmt.setInt(3, endRow);
				rs= pstmt.executeQuery();
				
				while(rs.next()) {
					AdminBean aBean = new AdminBean();
					aBean.setId(rs.getString("id"));
					aBean.setPassword(rs.getString("password"));
					aBean.setName(rs.getString("name"));
					aBean.setEmail(rs.getString("email"));
					aBean.setStatus(rs.getInt("status"));
					aBean.setIs_admin(rs.getInt("is_admin"));
					aBean.setZipcode(rs.getString("zipcode"));
					aBean.setAddress1(rs.getString("address1"));
					aBean.setAddress2(rs.getString("address2"));
					aBean.setPhone(rs.getString("phone"));
					aBean.setPoint(rs.getInt("point"));
					aBean.setReg_date(rs.getTimestamp("reg_date"));
					aBean.setN_status(rs.getInt("n_status"));
					memberlist.add(aBean);
				}
				
			} catch (Exception e) {
				System.out.println("getAllmember 메소드 내부에서 오류 :" + e);
			} finally {
				try {
					if(con!=null)con.close();
					if(pstmt!=null)pstmt.close();
					if(rs!=null)rs.close();
				} catch (Exception e2) {
					e2.printStackTrace();
				}
			}
				System.out.println(memberlist);
				return memberlist; //전체 회원정보 memberlist 리턴
		}
	
	
	
	//회원 수 조회 메소드
	public int AllMemberCount(String search) {
		
		Connection con=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		DataSource ds=null;
		String sql = "";
		
		int count = 0;
		
		try {
			con=getConnection();
			sql = "select * from users where id like ?";
			pstmt=con.prepareStatement(sql);
			pstmt.setString(1, "%"+search+"%");
			rs=pstmt.executeQuery();
			
			while(rs.next()) {
				count++;
			}
		} catch (Exception e) {
			System.out.println("AllMemberCount 메소드 내부에서 오류 : " + e);
		} finally {
			try {
				if(con!=null)con.close();
				if(pstmt!=null)pstmt.close();
				if(rs!=null)rs.close();
			} catch (Exception e2) {
				e2.printStackTrace();
			}
		}
			return count;
	}
	
	
	
	//멤버 삭제(관리자 페이지)
	public int MemberDelete(String id) {
		Connection con = null;
		PreparedStatement pstmt = null;
		int result = 0;
		String sql = "";
		
		try {
			
			con = getConnection();
			sql = "delete from users where id = ?";
			pstmt=con.prepareStatement(sql);
			pstmt.setString(1, id);
			pstmt.executeUpdate();
			
		} catch (Exception e) {
			System.out.println("MemberDelte 메소드 내부에서 오류 :" + e);
		} finally {
			try {
				if(con!=null)con.close();
				if(pstmt!=null)pstmt.close();
			} catch (Exception e2) {
				e2.printStackTrace();
			}
		}
			return result;
	}
	
	//회원 정보 상세보기 (관리자 페이지)
	public AdminBean MemberView(String id) {
		
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "";
		
		try {
			con = getConnection();
			sql = "select * from users where id = ?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, id);		
			rs=pstmt.executeQuery();
			
			AdminBean aBean2 = new AdminBean();
			
			if(rs.next()) {
			aBean2.setId(rs.getString("id"));
			aBean2.setPassword(rs.getString("password"));
			aBean2.setName(rs.getString("name"));
			aBean2.setEmail(rs.getString("email"));
			aBean2.setStatus(rs.getInt("status"));
			aBean2.setIs_admin(rs.getInt("is_admin"));
			aBean2.setZipcode(rs.getString("zipcode"));
			aBean2.setAddress1(rs.getString("address1"));
			aBean2.setAddress2(rs.getString("address2"));
			aBean2.setPhone(rs.getString("phone"));
			aBean2.setPoint(rs.getInt("point"));
			aBean2.setReg_date(rs.getTimestamp("reg_date"));
			}
			
			return aBean2;
			
			
			
			
		} catch (Exception e) {
			System.out.println("MemberView 메소드 내부에서 오류  : " + e);
		}finally {
			try {
				if(con!=null)con.close();
				if(pstmt!=null)pstmt.close();
				if(rs!=null)rs.close();
			} catch (Exception e2) {
				e2.printStackTrace();
			}
		}
		
		
		
		
		
		
		return null;
	}
	
	//회원 정보 수정 (관리자 페이지)
	public int MemberUpdate(MemberBean memberInfo) {
		
		Connection con = null;
		PreparedStatement pstmt = null;
		int result = 0;
		String sql = "";
		
		try {
			con = getConnection();
			sql = "update users set id=?, password=? , name=? , phone=? , email=?, status=?, is_admin=? where id = ?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, memberInfo.getId());
			pstmt.setString(2, memberInfo.getPassword());
			pstmt.setString(3, memberInfo.getName());
			pstmt.setString(4, memberInfo.getPhone());
			pstmt.setString(5, memberInfo.getEmail());
			pstmt.setInt(6, memberInfo.getStatus());
			pstmt.setInt(7, memberInfo.getIs_admin());
			pstmt.setString(8, memberInfo.getId());
			
			result = pstmt.executeUpdate();
			
			
			
		} catch (Exception e) {
			System.out.println("MemberUpdate 메소드 내부에서 오류" + e );
		} finally {
			try {
				if(con!=null)con.close();
				if(pstmt!=null)pstmt.close();
			} catch (Exception e2) {
				e2.printStackTrace();
			}
		}
		
		
		return result;
	}

	public void runChange(int runstatus, int num) {
		System.out.println("디이에오 와쓰");
		Connection con = null;
		PreparedStatement pstmt = null;
		int result = 0;
		String sql = "";
		
		try {
			con = getConnection();
			sql = "update product set runstatus=? where num=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, runstatus);
			pstmt.setInt(2, num);
			
			pstmt.executeUpdate();
		} catch (Exception e) {
			System.out.println("runChange 메소드 내부에서 오류 :" + e);
		} finally {
			try {
				if(con!=null)con.close();
				if(pstmt!=null)pstmt.close();
			} catch (Exception e2) {
				e2.printStackTrace();
			}
		}
		
	}
	

}


















