package Product;

import java.sql.Date;

public class ReplyVO {
	private int replynum, parentsnum, productnum;
	private String id, content;
	private Date date;
	
	public ReplyVO() {
		
	}

	public ReplyVO(int replynum, int parentsnum, int productnum, String id, String content) {
		super();
		this.replynum = replynum;
		this.parentsnum = parentsnum;
		this.productnum = productnum;
		this.id = id;
		this.content = content;
	}

	public int getReplynum() {
		return replynum;
	}

	public void setReplynum(int replynum) {
		this.replynum = replynum;
	}

	public int getParentsnum() {
		return parentsnum;
	}

	public void setParentsnum(int parentsnum) {
		this.parentsnum = parentsnum;
	}

	public int getProductnum() {
		return productnum;
	}

	public void setProductnum(int productnum) {
		this.productnum = productnum;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public Date getDate() {
		return date;
	}

	public void setDate(Date date) {
		this.date = date;
	}
	
	
}

