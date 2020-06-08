package com.sps.vo;

import java.util.Date;

public class OrderListVO {

	private int orderList_idx;				// 주문 인덱스
	private int orderList_client_idx;		// 주문 손님 인덱스
	private String orderList_client_name;	// 주문 손님 이름
	private int  orderList_product_idx;		// 주문 상품 인덱스
	private String  orderList_product_name;	// 주문 상품 이름
	private String orderList_address;		// 주문 주소  
	private String orderList_detailAddress;	// 주문 상세 주소 
	private String orderList_addressNumber;	// 주문 우편번호 	
	private String orderList_status;		// 주문 상태 (장바구니, 주문완료, 배달 준비, 배달 중, 배달 완료)
	private String orderList_size;			// 주문 사이즈
	private String orderList_color;			// 주문 색상
	private String orderList_stock;			// 주문 개수
	private String orderList_orderDate;		// 주문 날짜
	
	public OrderListVO() { }

	public OrderListVO(int orderList_idx, int orderList_client_idx, int orderList_product_idx, String orderList_status,
			String orderList_orderDate) {
		super();
		this.orderList_idx = orderList_idx;
		this.orderList_client_idx = orderList_client_idx;
		this.orderList_product_idx = orderList_product_idx;
		this.orderList_status = orderList_status;
		this.orderList_orderDate = orderList_orderDate;
	}

	public int getOrderList_idx() {
		return orderList_idx;
	}

	public void setOrderList_idx(int orderList_idx) {
		this.orderList_idx = orderList_idx;
	}

	public int getOrderList_client_idx() {
		return orderList_client_idx;
	}

	public void setOrderList_client_idx(int orderList_client_idx) {
		this.orderList_client_idx = orderList_client_idx;
	}

	public String getOrderList_client_name() {
		return orderList_client_name;
	}

	public void setOrderList_client_name(String orderList_client_name) {
		this.orderList_client_name = orderList_client_name;
	}

	public int getOrderList_product_idx() {
		return orderList_product_idx;
	}

	public void setOrderList_product_idx(int orderList_product_idx) {
		this.orderList_product_idx = orderList_product_idx;
	}

	public String getOrderList_product_name() {
		return orderList_product_name;
	}

	public void setOrderList_product_name(String orderList_product_name) {
		this.orderList_product_name = orderList_product_name;
	}

	public String getOrderList_address() {
		return orderList_address;
	}

	public void setOrderList_address(String orderList_address) {
		this.orderList_address = orderList_address;
	}

	public String getOrderList_detailAddress() {
		return orderList_detailAddress;
	}

	public void setOrderList_detailAddress(String orderList_detailAddress) {
		this.orderList_detailAddress = orderList_detailAddress;
	}

	public String getOrderList_addressNumber() {
		return orderList_addressNumber;
	}

	public void setOrderList_addressNumber(String orderList_addressNumber) {
		this.orderList_addressNumber = orderList_addressNumber;
	}

	public String getOrderList_status() {
		return orderList_status;
	}

	public void setOrderList_status(String orderList_status) {
		this.orderList_status = orderList_status;
	}

	public String getOrderList_size() {
		return orderList_size;
	}

	public void setOrderList_size(String orderList_size) {
		this.orderList_size = orderList_size;
	}

	public String getOrderList_color() {
		return orderList_color;
	}

	public void setOrderList_color(String orderList_color) {
		this.orderList_color = orderList_color;
	}

	public String getOrderList_stock() {
		return orderList_stock;
	}

	public void setOrderList_stock(String orderList_stock) {
		this.orderList_stock = orderList_stock;
	}

	public String getOrderList_orderDate() {
		return orderList_orderDate;
	}

	public void setOrderList_orderDate(String orderList_orderDate) {
		this.orderList_orderDate = orderList_orderDate;
	}

	@Override
	public String toString() {
		return "OrderListVO [orderList_idx=" + orderList_idx + ", orderList_client_idx=" + orderList_client_idx
				+ ", orderList_client_name=" + orderList_client_name + ", orderList_product_idx="
				+ orderList_product_idx + ", orderList_product_name=" + orderList_product_name + ", orderList_address="
				+ orderList_address + ", orderList_detailAddress=" + orderList_detailAddress
				+ ", orderList_addressNumber=" + orderList_addressNumber + ", orderList_status=" + orderList_status
				+ ", orderList_size=" + orderList_size + ", orderList_color=" + orderList_color + ", orderList_stock="
				+ orderList_stock + ", orderList_orderDate=" + orderList_orderDate + "]";
	}

	
}
