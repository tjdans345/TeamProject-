package Product;

import java.sql.Date;

public class DetailBean {
	
	private int detailnum, runtime, price, seat, totalreserved, num;
	private String name, genre, cla, image, content, place, starttime,selectseat;
	private Date startdate, enddate, today;
	
	public DetailBean()  {
		
	}

	public DetailBean(int runtime, int price, int seat, int totalreserved, String name, String genre, String cla,
			String image, String content, String place, String starttime, Date startdate, Date enddate, Date today) {
		this.runtime = runtime; 
		this.price = price;
		this.seat = seat;
		this.totalreserved = totalreserved;
		this.name = name;
		this.genre = genre;
		this.cla = cla;
		this.image = image;
		this.content = content;
		this.place = place;
		this.starttime = starttime;
		this.startdate = startdate;
		this.enddate = enddate;
		this.today = today;
	}

	public int getDetailnum() {
		return detailnum;
	}

	public void setDetailnum(int detailnum) {
		this.detailnum = detailnum;
	}

	public int getRuntime() {
		return runtime;
	}

	public void setRuntime(int runtime) {
		this.runtime = runtime;
	}

	public int getPrice() {
		return price;
	}

	public void setPrice(int price) {
		this.price = price;
	}

	public int getSeat() {
		return seat;
	}

	public void setSeat(int seat) {
		this.seat = seat;
	}

	public int getTotalreserved() {
		return totalreserved;
	}

	public void setTotalreserved(int totalreserved) {
		this.totalreserved = totalreserved;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getGenre() {
		return genre;
	}

	public void setGenre(String genre) {
		this.genre = genre;
	}

	public String getCla() {
		return cla;
	}

	public void setCla(String cla) {
		this.cla = cla;
	}

	public String getImage() {
		return image;
	}

	public void setImage(String image) {
		this.image = image;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public String getPlace() {
		return place;
	}

	public void setPlace(String place) {
		this.place = place;
	}

	public String getStarttime() {
		return starttime;
	}

	public void setStarttime(String starttime) {
		this.starttime = starttime;
	}

	public Date getStartdate() {
		return startdate;
	}

	public void setStartdate(Date startdate) {
		this.startdate = startdate;
	}

	public Date getEnddate() {
		return enddate;
	}

	public void setEnddate(Date enddate) {
		this.enddate = enddate;
	}

	public Date getToday() {
		return today;
	}

	public void setToday(Date today) {
		this.today = today;
	}

	public String getSelectseat() {
		return selectseat;
	}

	public void setSelectseat(String selectseat) {
		this.selectseat = selectseat;
	}

	public int getNum() {
		return num;
	}

	public void setNum(int num) {
		this.num = num;
	}

}
