package com.sps.vo;

import java.util.Date;

public class ReviewVO {

	private int review_idx;				// 리뷰 인덱스
	private int review_client_idx;		// 리뷰 남긴 고객 인덱스
	private int review_client_name;		// 리뷰 남긴 고객 이름
	private int review_product_idx;		// 리뷰 남긴 상품 인덱스
	private int review_product_name;	// 리뷰 남긴 상품 이름
	private String review_title;		// 리뷰 제목
	private String review_content;		// 리뷰 내용
	private int review_productGrade;	// 리뷰 별점
	private String review_writeDate;	// 리뷰 날짜
	private String review_imgPath;		// 리뷰 사진
	
}
