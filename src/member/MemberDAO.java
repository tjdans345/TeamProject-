package member;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Properties;

import javax.mail.Address;
import javax.mail.Authenticator;
import javax.mail.Message;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.Message.RecipientType;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.spi.DirStateFactory.Result;
import javax.sql.DataSource;

public class MemberDAO {

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
	
	//회원가입
	public void insertMember(MemberBean memberBean) {
		Connection con = null;
		PreparedStatement pstmt = null;
		String sql = "";
		
		try {
			con = getConnection();
			
			sql = "INSERT INTO USERS(id, password, name, email, zipcode, "
				+ " address1, address2, phone, profile_img, reg_date) VALUES "
				+ " (?,?,?,?,?,?,?,?,?,?)";
			
			pstmt = con.prepareStatement(sql);
			
			pstmt.setString(1, memberBean.getId());
			pstmt.setString(2, memberBean.getPassword());
			pstmt.setString(3, memberBean.getName());
			pstmt.setString(4, memberBean.getEmail());
			pstmt.setString(5, memberBean.getZipcode());
			pstmt.setString(6, memberBean.getAddress1());
			pstmt.setString(7, memberBean.getAddress2());
			pstmt.setString(8, memberBean.getPhone());
			pstmt.setString(9, memberBean.getProfile_img());
			pstmt.setTimestamp(10, memberBean.getReg_date());
			
			pstmt.executeUpdate();
			
		} catch (Exception e) {
			System.out.println("insertMember Inner Err : " + e.getMessage());
		} finally {
			try {
				if(con != null) con.close();
				if(pstmt != null) pstmt.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
	} // INSERTMEMBER END
	
	public void insertMember2(MemberBean memberBean) {
		Connection con = null;
		PreparedStatement pstmt = null;
		String sql = "";
		
		try {
			con = getConnection();
			
			sql = "INSERT INTO USERS(id, password, name, email, reg_date, n_status) VALUES "
				+ " (?,?,?,?,?,?)";
			
			pstmt = con.prepareStatement(sql);
			
			pstmt.setString(1, memberBean.getId());
			pstmt.setString(2, memberBean.getPassword());
			pstmt.setString(3, memberBean.getName());
			pstmt.setString(4, memberBean.getEmail());
			pstmt.setTimestamp(5, memberBean.getReg_date());
			pstmt.setInt(6, 1);
			
			pstmt.executeUpdate();
			
		} catch (Exception e) {
			System.out.println("insertMember Inner Err : " + e.getMessage());
		} finally {
			try {
				if(con != null) con.close();
				if(pstmt != null) pstmt.close();
			} catch (SQLException e) {
				System.out.println("insertMember2 메소드 내부에서 오류 : " + e);
			}
		}
	} // INSERTMEMBER2 END
	
	//아이디 중복체크
	public boolean idCheck(String id) {
		boolean result1 = true;
		
		try {
			this.con = this.getConnection();
			String sql = "SELECT id FROM users where id = ?";
			this.pstmt = this.con.prepareStatement(sql);
			this.pstmt.setString(1, id);
			this.rs = this.pstmt.executeQuery();
			
			if(this.rs.next()) {
				result1 = true;
			} else {
				result1 = false;
			}
		} catch (Exception e) {
			System.out.println("idCheck Inner Err : " + e);
		} finally {
			try {
				if(con!= null) con.close();
				if(pstmt!= null) pstmt.close();
				if(rs != null) rs.close();
			} catch (Exception e2) {
				e2.printStackTrace();
			}
		}
		
		return result1;
	}
	
	//로그인
	public int login(String id, String password) {
		Connection con = null;
		PreparedStatement pstmt = null;
		String sql ="";
		ResultSet rs = null;
		int check = 0;
		try {
			con=getConnection();
			sql = "SELECT password, status FROM USERS WHERE ID = ?";
			pstmt=con.prepareStatement(sql);
			
			pstmt.setString(1, id);
			
			rs=pstmt.executeQuery();
			
			if(rs.next()) {
				if(rs.getString("password").equals(password)) {
					
					if(rs.getInt("status") == 1) {
						check = 1 ; //로그인 성공
					}else {
						check = -2; // 이용정지상태	
					}
					
				}else {
					check = 0; // 비밀번호 틀림
				}
			}else {
				check = -1; // ID 없음
			}
			
		} catch (Exception e) {
			System.out.println("login Inner Err : " + e.getMessage());
		}
		return check;
	}//login END
	
	//회원삭제
	public void deleteMember(String id) {
		
		Connection con = null;		
		PreparedStatement pstmt = null;
		
		String sql="";
		
		try {			
			con=getConnection();
			sql="delete from users where id = ?";
			pstmt=con.prepareStatement(sql);
			pstmt.setString(1, id);
			pstmt.executeUpdate();
		
		} catch (Exception e) {
			System.out.println("deleteMember Inner Err : " + e.getMessage());
		} finally {
			try {
				if(con!=null) con.close();
				if(pstmt != null) pstmt.close();
			} catch (Exception e2) {
				e2.printStackTrace();
			}
		}
	} // DELETEMEMBER END
	
//	public MemberBean getAdmin(MemberBean memberBean) {
//		Connection con = null;
//		PreparedStatement pstmt = null;
//		ResultSet rs = null;
//		String sql ="";
//
//		try {
//			con = getConnection();
//			sql = "select * from users where is_admin = 1";
//			pstmt = con.prepareStatement(sql);
//			rs = pstmt.executeQuery();
//			if(rs.next()) {
//				memberBean.setId(rs.getString("id"));
//			}
//		} catch (Exception e) {
//			System.out.println("getAdmin Inner Err :" + e);
//		} finally {
//			try {
//				if(con!=null) con.close();
//				if(pstmt != null) pstmt.close();
//			} catch (Exception e2) {
//				e2.printStackTrace();
//			}
//		}
//		return memberBean;
//	}
	
	
	
	public MemberBean getMember(String id) {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql ="";
		MemberBean memberBean = new MemberBean(); 
		try {
			con = getConnection();
			sql = "select * from users where id = ?";
			pstmt=con.prepareStatement(sql);
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				memberBean.setId(rs.getString("id"));
				memberBean.setName(rs.getString("name"));
				memberBean.setPassword(rs.getString("password"));
				memberBean.setEmail(rs.getString("email"));
				memberBean.setZipcode(rs.getString("zipcode"));
				memberBean.setPhone(rs.getString("phone"));
				memberBean.setAddress1(rs.getString("address1"));
				memberBean.setAddress2(rs.getString("address2"));
				memberBean.setProfile_img(rs.getString("profile_img"));
				memberBean.setPoint(rs.getInt("point"));
				memberBean.setIs_admin(rs.getInt("is_admin"));
				memberBean.setStatus(rs.getInt("status"));
				memberBean.setLaddress1(rs.getString("Laddress1"));
				memberBean.setLaddress2(rs.getString("Laddress2"));
				memberBean.setLzipcode(rs.getString("Lzipcode"));
				memberBean.setN_status(rs.getInt("n_status"));
				memberBean.setReg_date(rs.getTimestamp("reg_date"));
			}
		} catch (Exception e) {
			System.out.println("getMember Inner Err : " + e);
		} finally {
			try {
				if(con!=null) con.close();
				if(pstmt != null) pstmt.close();
				if(rs != null) rs.close();
			} catch (Exception e2) {
				e2.printStackTrace();
			}
		}
		return memberBean;
	}
	
	public int updateMember(MemberBean memberBean) {
		Connection con = null;
		PreparedStatement pstmt = null;
		String sql ="";
		int result = 0;
		try {
			con =getConnection();
			sql = "update users set password=?, email=? , zipcode=? , address1=? , address2=?, phone=? where id = ?";
			pstmt=con.prepareStatement(sql);
			pstmt.setString(1, memberBean.getPassword());
			pstmt.setString(2, memberBean.getEmail());
			pstmt.setString(3, memberBean.getZipcode());
			pstmt.setString(4, memberBean.getAddress1());
			pstmt.setString(5, memberBean.getAddress2());
			pstmt.setString(6, memberBean.getPhone());
			pstmt.setString(7, memberBean.getId());
			
			result = pstmt.executeUpdate(); 
			
		} catch (Exception e) {
			System.out.println("updateMember Inner Err : " + e);
		} finally {
			try {
				if(con!=null) con.close();
				if(pstmt != null) pstmt.close();
			} catch (Exception e2) {
				e2.printStackTrace();
			}
		}
		return result;
	}
	
	public MemberBean findId(String name, String email) {
		Connection con = null;
		PreparedStatement pstmt = null;
		String sql ="";
		ResultSet rs = null;
		String id =null;
		MemberBean memberBean = new MemberBean();
		try {
			con=getConnection();
			sql = "SELECT id FROM users WHERE name = ? AND email = ?";
			pstmt=con.prepareStatement(sql);
			pstmt.setString(1, name);
			pstmt.setString(2, email);
			rs=pstmt.executeQuery();
			
			while(rs.next()) {
				memberBean.setId(rs.getString("id"));
			}
		} catch (Exception e) {
			System.out.println("findId Inner Err : " + e);
		} finally {
			try {
				if(con!=null)con.close();
				if(pstmt!=null)pstmt.close();
				if(rs!=null)rs.close();
			} catch (Exception e2) {
				e2.printStackTrace();
			}
		}
		return memberBean;
	}

	
	public int checkEmail(String email) {
		int check=0;
		Connection con =null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "";
		try {
			con=getConnection();
			sql="SELECT * FROM users WHERE email = ?";
			pstmt=con.prepareStatement(sql);
			pstmt.setString(1, email);
			rs=pstmt.executeQuery();
			
			if(rs.next()) {
				check = 1;
			}
			
		} catch (Exception e) {
			System.out.println("checkEmail Inner err : " + e);
		} finally {
			try {
				if(con!=null) con.close();
				if(pstmt!=null) pstmt.close();
				if(rs!=null) rs.close();
			} catch (Exception e2) {
				e2.printStackTrace();
			}
		}
		return check;
	}
	
	public boolean sendEmail(String email, String authNum) {
		boolean result = false;
		String sender = "z1kgam2@gmail.com";
		String subject = "회원가입 인증번호입니다.";
		String content = "안녕하세요 " + email + "님, <br>" + "귀하의 인증번호는    [<b>" + authNum + "</b>]   입니다.";

		try {
			Properties properties = System.getProperties();
			properties.put("mail.smtp.starttls.enable", "true");
			properties.put("mail.smtp.host", "smtp.gmail.com");
			properties.put("mail.smtp.auth", "true");
			properties.put("mail.smtp.port", "587");
			Authenticator auth = new Gmail();
			Session session = Session.getDefaultInstance(properties, auth);
			Message message = new MimeMessage(session);
			Address senderAd = new InternetAddress(sender);
			Address receiverAd = new InternetAddress(email);
			message.setHeader("content-type", "text/html;charset=UTF-8");
			message.setFrom(senderAd);
			message.addRecipient(RecipientType.TO, receiverAd);
			message.setSubject(subject);
			message.setContent(content, "text/html;charset=UTF-8");
			message.setSentDate(new Date());
			Transport.send(message);
			System.out.println(authNum);
			result = true;
		} catch (Exception var13) {
			result = false;
			System.out.println("Error in SendEmail()");
			var13.printStackTrace();
		} finally {
			try {
				if(con!=null)con.close();
				if(pstmt!=null)pstmt.close();
				if(rs!=null)rs.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}

		return result;
	}
	
	/* 6자리 인증번호 생성 메서드 */
	public String authNum() {
		StringBuffer authNum = new StringBuffer();

		for (int i = 0; i < 6; ++i) {
			int randNum = (int) (Math.random() * 10.0D);
			authNum.append(randNum);
		}
		return authNum.toString();
	} // authNum end
	
	public int updatePass(MemberBean memberBean) {
		Connection con = null;
		PreparedStatement pstmt = null;
		String sql = "";
		int result=0;
		try {
			con=getConnection();
			sql = "UPDATE users SET password = ? where id = ?";
			pstmt=con.prepareStatement(sql);
			pstmt.setString(1, memberBean.getPassword());
			pstmt.setString(2, memberBean.getId());
			return pstmt.executeUpdate();
		} catch (Exception e) {
			System.out.println("updatePass Inner Err : " + e);
		} finally {
			try {
				if(con!=null) con.close();
				if(pstmt!=null) pstmt.close();
			} catch (Exception e2) {
				e2.printStackTrace();
			}
		}
		
		return result;
	}

	public int profile(String id, String profile_img) {
		Connection con = null;
		PreparedStatement pstmt = null;
		String sql = "";
		try {
			con = getConnection();
			sql = "UPDATE users SET profile_img = ? WHERE id = ?";
			pstmt=con.prepareStatement(sql);
			pstmt.setString(1, profile_img);
			pstmt.setString(2, id);
			return pstmt.executeUpdate();
			
			
		} catch (Exception e) {
			System.out.println("profile Inner Err : " + e);
		} finally {
			try {
				if(con!=null) con.close();
				if(pstmt!=null) pstmt.close();
			} catch (Exception e2) {
				e2.printStackTrace();
			}
		}
		return -1;
	}
	
	public String getProfile(String id) {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "";
		try {
			con = getConnection();
			sql="SELECT profile_img FROM users WHERE id = ?";
			pstmt=con.prepareStatement(sql);
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				if(rs.getString("profile_img").equals("")||rs.getString("profile_img").equals("null")) {
					return "/PP/images/icon.png";
				}
				return "/PP/upload/" + rs.getString("profile_img");
			}
		} catch (Exception e) {
			System.out.println("getProfile Inner Err : " + e);
		} finally {
			try {
				if(con!=null)con.close();
				if(pstmt!=null)pstmt.close();
				if(rs!=null)rs.close();
			} catch (Exception e2) {
				System.out.println();
			}
		}
		return "/PP/images/icon.png";
	}
	
	public int updateAddress(MemberBean memberBean) {
		int result=0;
		Connection con =null;
		PreparedStatement pstmt = null;
		String sql ="";
		try {
			con=getConnection();
			sql="UPDATE users SET rpname = ?, zipcode=?, address1=?, address2=? WHERE id = ?";
			pstmt=con.prepareStatement(sql);
			pstmt.setString(1, memberBean.getRpname());
			pstmt.setString(2, memberBean.getZipcode());
			pstmt.setString(3, memberBean.getAddress1());
			pstmt.setString(4, memberBean.getAddress2());
			pstmt.setString(5, memberBean.getId());
			
			result=pstmt.executeUpdate();
			
		} catch (Exception e) {
			System.out.println("UpdateAddress Inner Err : " + e);
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

	public int updateNewAddress(MemberBean memberBean) {
		int result=0;
		Connection con =null;
		PreparedStatement pstmt = null;
		String sql ="";
		try {
			con=getConnection();
			sql="UPDATE users SET rpname = ?, Lzipcode=?, Laddress1=?, Laddress2=? WHERE id = ?";
			pstmt=con.prepareStatement(sql);
			pstmt.setString(1, memberBean.getRpname());
			pstmt.setString(2, memberBean.getLzipcode());
			pstmt.setString(3, memberBean.getLaddress1());
			pstmt.setString(4, memberBean.getLaddress2());
			pstmt.setString(5, memberBean.getId());
			return pstmt.executeUpdate();
			
		} catch (Exception e) {
			System.out.println("updateNewAddress Inner err :" + e);
		} finally {
			try {
				if(con!=null)con.close();
				if(pstmt!=null)pstmt.close();
			} catch (SQLException e2) {
				e2.printStackTrace();
			}
		}
		return result;
	}
	
	//입금확인요청이 들어왔을때 p_status 를 1로 point테이블에 insert시킴
	public void addpoint1(String id, String name, int point) {
		Connection con = null;
		PreparedStatement pstmt = null;
		String sql = "";
		try {
			con = getConnection();
			sql = "INSERT INTO POINT(id, name, point) VALUES (?,?,?)";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, id);
			pstmt.setString(2, name);
			pstmt.setInt(3, point);
			pstmt.executeUpdate();
			
			//최고 포인트 조회 후 똑같이 포인트신청상태(횟수)를 더해주기 위함
			sql = "select max(p_status) from point"; 
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();
			
			int p_status =0;
			if(rs.next()) {
				p_status =  rs.getInt("max(p_status)") + 1;		 
			}else {		
				p_status = 1; 
			}
			
			sql = "UPDATE POINT SET P_STATUS = ?  WHERE ID = ?";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, p_status);
			pstmt.setString(2, id);
			pstmt.executeUpdate();
			
		} catch (Exception e) {
			System.out.println("addpoint1 Inner Err : " + e);
		} finally {
			try {
				if(con!=null)con.close();
				if(pstmt!=null)pstmt.close();
			} catch (SQLException e2) {
				e2.printStackTrace();
			}
		}
	}

	//해당 아이디에 포인트를 추가함
	public void updatePoint(String id, int point, int num) {
		Connection con = null;
		PreparedStatement pstmt = null;
		String sql = "";
		try {
			con = getConnection();
			sql = "UPDATE USERS SET POINT = POINT + ? WHERE ID = ?";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, point);
			pstmt.setString(2, id);
			pstmt.executeUpdate();
			
			//최고 포인트 조회 후 똑같이 포인트신청상태(횟수)를 빼주기더해주기 위함
			sql = "select max(p_status) from point"; 
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();
			int p_status =0;
			if(rs.next()) {
				p_status =  rs.getInt("max(p_status)") - 1;		 
			}else {		
				p_status = 1; 
			}
			
			sql = "UPDATE POINT SET P_STATUS = ? WHERE ID = ?";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, p_status);
			pstmt.setString(2, id);
			pstmt.executeUpdate();
			
		} catch (Exception e) {
			System.out.println("updatePoint Inner Err : " + e);
		} finally {
			try {
				if(con!=null)con.close();
				if(pstmt!=null)pstmt.close();
			} catch (SQLException e2) {
				e2.printStackTrace();
			}
		}
	}

	//포인트 충전신청을한 id들 전체 내역조회(페이징)
	public int getPointTotal() {
		Connection con = null;
		PreparedStatement pstmt = null;
		String sql ="";
		int total = 0;
		ResultSet rs = null;
		try {
			con = getConnection();
			sql = "SELECT COUNT(*) FROM POINT";
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				total = rs.getInt(1);
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
		return total;
	}
	
	
	//포인트충전 신청한 리스트
	public List<LikeBean> getPointList(int pageFirst, int pageSize) {
		Connection con = null;
		PreparedStatement pstmt = null;
		String sql = "";
		ResultSet rs = null;
		List pointList = new ArrayList();
		try {
			con = getConnection();
			sql = "SELECT * FROM POINT";
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				MemberBean memberBean = new MemberBean();
				memberBean.setId(rs.getString("id"));
				memberBean.setName(rs.getString("name"));
				memberBean.setPoint(rs.getInt("point"));
				memberBean.setP_status(rs.getInt("p_status"));
				memberBean.setNum(rs.getInt("num"));
				pointList.add(memberBean);
			}
		} catch (Exception e) {

		} finally {
			try {
				if(rs!=null)rs.close();
				if(pstmt!=null)pstmt.close();
				if(con!=null)con.close();
			} catch (Exception e2) {
				e2.printStackTrace();
			}
		}
		return pointList;
	}
	
	
	public int updatetest(MemberBean memberBean) {
		Connection con = null;
		PreparedStatement pstmt = null;
		String sql ="";
		int result = 0;
		try {
			con =getConnection();
			sql = "update users set point = ? where id = ?";
			pstmt=con.prepareStatement(sql);
			pstmt.setInt(1, memberBean.getPoint());
			pstmt.setString(2, memberBean.getId());
			
			result = pstmt.executeUpdate(); 
			
		} catch (Exception e) {
			System.out.println("updateMember Inner Err : " + e);
		} finally {
			try {
				if(con!=null) con.close();
				if(pstmt != null) pstmt.close();
			} catch (Exception e2) {
				e2.printStackTrace();
			}
		}
		return result;
	}
	
	//입금신청 내역 삭제
	public void delPoint(String id, int num) {
		Connection con = null;
		PreparedStatement pstmt = null;
		String sql = "";
		try {
			con = getConnection();
			sql = "DELETE FROM POINT WHERE ID = ? AND NUM = ?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, id);
			pstmt.setInt(2, num);
			pstmt.executeUpdate();
		} catch (Exception e) {
			System.out.println("delPoint Inner Err : " + e);
		} finally {
			try {
				if(pstmt!=null)pstmt.close();
				if(con!=null)con.close();
			} catch (Exception e2) {
				e2.printStackTrace();
			}
		}
	}
	
	public int NaverUserCheck(String id) {
		int check = 0;
		String sql ="";
		
		try {
			
			con=getConnection();
			sql="select * from users where id = ?";
			pstmt=con.prepareStatement(sql);
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				check = 1;
			}
			
		} catch (Exception e) {
			System.out.println("NaverUserCheck 메소드 내부에서 오류 :" + e);
		} finally {
			try {
				if(con!=null)con.close();
				if(pstmt!=null)pstmt.close();
			} catch (SQLException e2) {
				e2.printStackTrace();
			}
		}
		
			//return == 1 기존에 로그인 이력 있음.
			return check;
		
	}
	
}
	

