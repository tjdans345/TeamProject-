package event;

import java.sql.Date;
import java.sql.Timestamp;

public class EventBean {
	private int e_num;			//이벤트 글 번호
	private String e_title;		//이벤트 글제목
	private String e_content;	//이벤트 내용
	private String e_file;		//이벤트 파일
	private Date e_startdate;	//이벤트 시작일
	private Date e_enddate;		//이벤트 종료일
	private Timestamp e_date;	//게시 날짜
	
	public Date getE_startdate() {
		return e_startdate;
	}
	public void setE_startdate(Date e_startdate) {
		this.e_startdate = e_startdate;
	}
	public Date getE_enddate() {
		return e_enddate;
	}
	public void setE_enddate(Date e_enddate) {
		this.e_enddate = e_enddate;
	}	
	public int getE_num() {
		return e_num;
	}
	public void setE_num(int e_num) {
		this.e_num = e_num;
	}
	public String getE_title() {
		return e_title;
	}
	public void setE_title(String e_title) {
		this.e_title = e_title;
	}
	public String getE_content() {
		return e_content;
	}
	public void setE_content(String e_content) {
		this.e_content = e_content;
	}
	public String getE_file() {
		return e_file;
	}
	public void setE_file(String e_file) {
		this.e_file = e_file;
	}
	public Timestamp getE_date() {
		return e_date;
	}
	public void setE_date(Timestamp e_date) {
		this.e_date = e_date;
	}

	
}
