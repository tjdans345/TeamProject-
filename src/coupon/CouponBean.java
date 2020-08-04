package coupon;

import java.sql.Date;

public class CouponBean {
	
	private int event_num;
	private String event_title;
	private String event_image;
	private String event_timage;
	private String event_content;
	private Date event_startdate;
	private Date event_enddate;
	
	
	public String getEvent_timage() {
		return event_timage;
	}
	public void setEvent_timage(String event_timage) {
		this.event_timage = event_timage;
	}
	public int getEvent_num() {
		return event_num;
	}
	public void setEvent_num(int event_num) {
		this.event_num = event_num;
	}
	public String getEvent_title() {
		return event_title;
	}
	public void setEvent_title(String event_title) {
		this.event_title = event_title;
	}
	public String getEvent_image() {
		return event_image;
	}
	public void setEvent_image(String event_image) {
		this.event_image = event_image;
	}
	public String getEvent_content() {
		return event_content;
	}
	public void setEvent_content(String event_content) {
		this.event_content = event_content;
	}
	public Date getEvent_startdate() {
		return event_startdate;
	}
	public void setEvent_startdate(Date event_startdate) {
		this.event_startdate = event_startdate;
	}
	public Date getEvent_enddate() {
		return event_enddate;
	}
	public void setEvent_enddate(Date event_enddate) {
		this.event_enddate = event_enddate;
	}
	
	
	
}
