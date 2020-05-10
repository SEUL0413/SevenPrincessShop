package com.sps.vo;

import java.util.Date;

public class ReviewVO {

	private int review_idx; 				// 리뷰 idx
	private int review_client_idx;			// 고객 idx
	private int review_product_idx;			// 해당 상품의 idx
	private String review_title;			// 제목
	private String review_content;			// 내용
	private int review_productGrade;		// 별점	// String => int�? �?�?
//	private String review_client_id;		// 
	private Date review_writeDate;			// 작성일
	private String review_imgPath;			// 리뷰 이미지 경로
	
}
