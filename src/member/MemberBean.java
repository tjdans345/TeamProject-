package member;

import java.sql.Timestamp;

public class MemberBean {
	
	private String id;
	private String password;
	private String name; 
	private String email;
	private int status; 
	private int is_admin;
	private String zipcode;
	private String address1;
	private String address2;
	private String phone;
	private int point;
	private String profile_img;
	private Timestamp reg_date;
	private String Lzipcode;
	private String Laddress1;
	private String Laddress2;
	private String rpname;
	private int p_status; 
	private int num;
	private int n_status;
	
	
	public int getN_status() {
		return n_status;
	}
	public void setN_status(int n_status) {
		this.n_status = n_status;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public int getStatus() {
		return status;
	}
	public void setStatus(int status) {
		this.status = status;
	}
	public int getIs_admin() {
		return is_admin;
	}
	public void setIs_admin(int is_admin) {
		this.is_admin = is_admin;
	}
	public String getZipcode() {
		return zipcode;
	}
	public void setZipcode(String zipcode) {
		this.zipcode = zipcode;
	}
	public String getAddress1() {
		return address1;
	}
	public void setAddress1(String address1) {
		this.address1 = address1;
	}
	public String getAddress2() {
		return address2;
	}
	public void setAddress2(String address2) {
		this.address2 = address2;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public int getPoint() {
		return point;
	}
	public void setPoint(int point) {
		this.point = point;
	}
	public String getProfile_img() {
		return profile_img;
	}
	public void setProfile_img(String profile_img) {
		this.profile_img = profile_img;
	}
	public Timestamp getReg_date() {
		return reg_date;
	}
	public void setReg_date(Timestamp reg_date) {
		this.reg_date = reg_date;
	}
	public String getLzipcode() {
		return Lzipcode;
	}
	public void setLzipcode(String lzipcode) {
		Lzipcode = lzipcode;
	}
	public String getLaddress1() {
		return Laddress1;
	}
	public void setLaddress1(String laddress1) {
		Laddress1 = laddress1;
	}
	public String getLaddress2() {
		return Laddress2;
	}
	public void setLaddress2(String laddress2) {
		Laddress2 = laddress2;
	}
	public String getRpname() {
		return rpname;
	}
	public void setRpname(String rpname) {
		this.rpname = rpname;
	}
	public int getP_status() {
		return p_status;
	}
	public void setP_status(int p_status) {
		this.p_status = p_status;
	}
	public int getNum() {
		return num;
	}
	public void setNum(int num) {
		this.num = num;
	}

	
	
	
	
	
	
	
}
