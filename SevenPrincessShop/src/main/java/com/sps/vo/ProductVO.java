package com.sps.vo;

import java.sql.Date;

public class ProductVO {

	private int product_idx;				// 상품 idx	(= stock_product_idx)
	private String product_name;			// 상품명
	private int product_price;				// 가격
	private int product_category;			// 카테고리 넘버
	private Date product_registerDate;		// 등록일
	private int product_hit;				// 판매수
	private String product_imgPath;			// 상품 이미지 경로
	private String product_Sstock;			// S 사이즈
	private String product_Mstock;			// M 
	private String product_Lstock;			// L
	private String product_Fstock;			// F
	private int product_stock;				// 옵션별 재고 테이블 키
	
	
}
