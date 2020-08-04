package Order;

public class OrderService {

	OrderDAO OrDao = new OrderDAO();
	
	public void insertOrder(OrderVO vo) {
		OrDao.insertOrder(vo);
	}

}
