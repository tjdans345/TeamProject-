package team.qnaboard;

import java.util.Date;

public class qnaBean {
	
	private int qna_num;
	private String id; 
	private String qna_cate; 
	private String qna_title; 
	private String qna_contents; 
	private Date qna_date;
	private int qna_status;
	private String answer;
	private String file;
	private String file2;
	
	public qnaBean() {
		
	}
	
	//getter, setter 메소드
	public int getQna_num() {
		return qna_num;
	}

	public void setQna_num(int qna_num) {
		this.qna_num = qna_num;
	}

	public String getid() {
		return id;
	}

	public void setid(String id) {
		this.id = id;
	}

	public String getQna_cate() {
		return qna_cate;
	}

	public void setQna_cate(String qna_cate) {
		this.qna_cate = qna_cate;
	}

	public String getQna_title() {
		return qna_title;
	}

	public void setQna_title(String qna_title) {
		this.qna_title = qna_title;
	}

	public String getQna_contents() {
		return qna_contents;
	}

	public void setQna_contents(String qna_contents) {
		this.qna_contents = qna_contents;
	}

	public Date getQna_date() {
		return qna_date;
	}

	public void setQna_date(Date qna_date) {
		this.qna_date = qna_date;
	}

	public int getQna_status() {
		return qna_status;
	}

	public void setQna_status(int qna_status) {
		this.qna_status = qna_status;
	}

	public String getAnswer() {
		return answer;
	}

	public void setAnswer(String answer) {
		this.answer = answer;
	}
	
	public String getFile() {
	return file;
	}

	public void setFile(String file) {
	this.file = file;
	}

	public String getFile2() {
		return file2;
	}

	public void setFile2(String file2) {
		this.file2 = file2;
	}
	
	

}
