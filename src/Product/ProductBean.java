package Product;

import java.sql.Date;

public class ProductBean {
	

	private String name, genre, cla, image, content;
	private int num, runtime, price, runstatus;
	private Date startdate, enddate;
	private int qty;
	public ProductBean() {

	}
	public ProductBean(String name, String genre, String cla, String image, String content, int num, int runtime,
			int price, Date startdate, Date enddate, int qty, int runstatus) {
		this.name = name;
		this.genre = genre;
		this.cla = cla;
		this.image = image;
		this.content = content;
		this.num = num;
		this.runtime = runtime;
		this.price = price;
		this.startdate = startdate;
		this.enddate = enddate;
		this.qty = qty;
		this.runstatus = runstatus;
	}
	
	
	public int getRunstatus() {
		return runstatus;
	}
	public void setRunstatus(int runstatus) {
		this.runstatus = runstatus;
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
	public int getNum() {
		return num;
	}
	public void setNum(int num) {
		this.num = num;
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
	public int getQty() {
		return qty;
	}
	public void setQty(int qty) {
		this.qty = qty;
	}

	
	
	
	
}