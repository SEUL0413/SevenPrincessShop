package com.sps.vo;

import java.sql.Date;

public class OrderListVO {

	private int orderList_idx;					//주문내역의 주문 idx
	private int orderList_client_idx;			//주문자의 idx
	private int orderList_product_idx;			//주문 상품의 idx
	private String orderList_orderStatus;		//주문건에 대한 상태 value 통일 baket=장바구니 / payment=결제완료 / preparing=상품준비중 / sale=판매완료_배송 / cencel=취소 
	private Date orderList_orderDate;			// 주문 날자
	
}
