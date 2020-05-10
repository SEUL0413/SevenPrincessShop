package com.sps.vo;

import java.util.Date;

public class OrderListVO {

	private int orderList_idx;				// 주문 인덱스
	private int orderList_client_idx;		// 주문 손님 인덱스
	private int orderList_client_name;		// 주문 손님 이름
	private int  orderList_product_idx;		// 주문 상품 인덱스
	private int  orderList_product_name;	// 주문 상품 이름
	private String orderList_address;		// 주문 주소  
	private String orderList_detailAddress;	// 주문 상세 주소 
	private String orderList_status;		// 주문 상태 (장바구니, 주문완료, 배달 준비, 배달 중, 배달 완료)
	private String orderList_size;			// 주문 사이즈
	private String orderList_color;			// 주문 색상
	private String orderList_stock;			// 주문 개수
	private String orderList_orderDate;		// 주문 날짜
	
}
