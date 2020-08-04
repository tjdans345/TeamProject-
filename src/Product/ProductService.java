package Product;

import java.sql.Date;
import java.util.List;

public class ProductService {
	
	ProductDAO dao;
	DetailDAO Ddao;
	ReplyDAO Rdao;
	
	public ProductService() {
		dao = new ProductDAO();
		Ddao = new DetailDAO();
		Rdao = new ReplyDAO();
	}
	
	public void insert(ProductBean productBean) {
		dao.insertpro(productBean);
	}

	public ProductBean getBoard(int num) {
		ProductBean Bean = dao.getBoard(num);
		return Bean;
	}

	public void delete(int num) {
		dao.delete(num);
	}

	public void insertDetail(DetailBean bean) {
		Ddao.insertDetail(bean); 
		
	}

	public List<ProductBean> getList() {
		List<ProductBean> list = dao.getList();
		return list;
	}

	public List<ReplyVO> getreply(int num) {
		List<ReplyVO> list = Rdao.getreply(num);
		return list;
	}

	public void insertReply(ReplyVO vo) {
		Rdao.insertReply(vo);
	}

	public void deleteReply(int replynum) {
		Rdao.deleteReply(replynum);
	}

	public void doudelete(int replynum) {
		Rdao.doudelete(replynum);
		
	}

	public void updatereply(int replynum, String content) {
		Rdao.updatereply(replynum,content);	
	}

	public void replydelete(int num) {
		Rdao.replydelete(num);
		
	}

	public List<DetailBean> getdetail(String name) {
		List<DetailBean> detail = Ddao.getdetail(name);
		return detail;
	}
	
	public DetailBean getdetails(int detail) {
		DetailBean Bean = Ddao.getdetails(detail);
		return Bean;
	}

	public void UpdateSeat(int num, int sub) {
		Ddao.UpdateSeat(num,sub);
	}

	public void detaildelete(String name) {
		Ddao.detaildelete(name);
	}

	public List<DetailBean> SelectByDate(Date selectdate, String name) {
		List<DetailBean> detList = Ddao.SelectByDate(selectdate,name);
		return detList;
	}

	public List<ProductBean> getList(String search) {
		List<ProductBean> list = dao.getList(search);
		return list;
	}

}
