package com.sps.vo;

public class JoinVO {

	private OrderListVO orderListVO;
	private ClientVO clientVO;
	private ProductVO productVO;
	public OrderListVO getOrderListVO() {
		return orderListVO;
	}
	public void setOrderListVO(OrderListVO orderListVO) {
		this.orderListVO = orderListVO;
	}
	public ClientVO getClientVO() {
		return clientVO;
	}
	public void setClientVO(ClientVO clientVO) {
		this.clientVO = clientVO;
	}
	public ProductVO getProductVO() {
		return productVO;
	}
	public void setProductVO(ProductVO productVO) {
		this.productVO = productVO;
	}
	@Override
	public String toString() {
		return "JoinVO [orderListVO=" + orderListVO + ", clientVO=" + clientVO + ", productVO=" + productVO + "]";
	}
	
}
