package Order;

import java.sql.Date;

public class OrderVO {	         
	private int num,detailnum, runtime, price, seat, totalreserved,qty,totalprice  ;
	private int p_num, p_seq_num;
	private String name, genre, cla, image, content, place, starttime,id,selectseat;
	private Date startdate, enddate, today,orderdate, p_paydate;
	
	public OrderVO() {
		
	}

	public int getNum() {
		return num;
	}

	public void setNum(int num) {
		this.num = num;
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



	public int getQty() {
		return qty;
	}

	public void setQty(int qty) {
		this.qty = qty;
	}

	public int getTotalprice() {
		return totalprice;
	}

	public void setTotalprice(int totalprice) {
		this.totalprice = totalprice;
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

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
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

	public Date getOrderdate() {
		return orderdate;
	}

	public void setOrderdate(Date orderdate) {
		this.orderdate = orderdate;
	}

	public int getP_num() {
		return p_num;
	}

	public void setP_num(int p_num) {
		this.p_num = p_num;
	}

	public int getP_seq_num() {
		return p_seq_num;
	}

	public void setP_seq_num(int p_seq_num) {
		this.p_seq_num = p_seq_num;
	}

	public Date getP_paydate() {
		return p_paydate;
	}

	public void setP_paydate(Date p_paydate) {
		this.p_paydate = p_paydate;
	}

	public String getSelectseat() {
		return selectseat;
	}

	public void setSelectseat(String selectseat) {
		this.selectseat = selectseat;
	}

	public OrderVO(int totalprice, int qty,int p_seq_num, String name, String selectseat,String id) {
		super();
		this.totalprice = totalprice;
		this.qty = qty;
		this.p_seq_num = p_seq_num;
		this.name = name;
		this.selectseat = selectseat;
		this.id = id;
	}

	public OrderVO(int detailnum, int runtime, int qty, int totalprice, int p_seq_num, String genre, String image,
			String place, String id, String selectseat, String name, Date today) {
		super();
		this.detailnum = detailnum;
		this.runtime = runtime;
		this.qty = qty;
		this.totalprice = totalprice;
		this.p_seq_num = p_seq_num;
		this.genre = genre;
		this.image = image;
		this.place = place;
		this.id = id;
		this.selectseat = selectseat;
		this.name = name;
		this.today = today;
	}
	

	
	
	
	
}