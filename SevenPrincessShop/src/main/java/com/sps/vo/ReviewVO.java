package com.sps.vo;


public class ReviewVO {

   private int review_idx;            // 리뷰 인덱스
   private int review_client_idx;      // 리뷰 남긴 고객 인덱스
   private int review_orderList_idx;   // 리뷰에 해당되는 주문 번호
   private String review_client_name;		// 리뷰 남긴 고객 이름
   private int review_product_idx;      // 리뷰 남긴 상품 인덱스
   private int review_product_name;   // 리뷰 남긴 상품 이름
   private String review_title;      // 리뷰 제목
   private String review_content;      // 리뷰 내용
   private int review_productGrade;   // 리뷰 별점
   private String review_writeDate;   // 리뷰 날짜
   private String review_imgPath;      // 리뷰 사진
   
   public ReviewVO() {	}

	public ReviewVO(int review_idx, int review_client_idx, String review_client_name, int review_product_idx,
			int review_product_name, String review_content, int review_productGrade,
			String review_writeDate, String review_imgPath) {
		super();
		this.review_idx = review_idx;
		this.review_client_idx = review_client_idx;
		this.review_client_name = review_client_name;
		this.review_product_idx = review_product_idx;
		this.review_product_name = review_product_name;
		this.review_content = review_content;
		this.review_productGrade = review_productGrade;
		this.review_writeDate = review_writeDate;
		this.review_imgPath = review_imgPath;
	}
	
	

	public ReviewVO(String review_client_name, String review_content, int review_productGrade, String review_writeDate,
			String review_imgPath) {
		super();
		this.review_client_name = review_client_name;
		this.review_content = review_content;
		this.review_productGrade = review_productGrade;
		this.review_writeDate = review_writeDate;
		this.review_imgPath = review_imgPath;
	}

   
   
   public int getReview_idx() {
      return review_idx;
   }
   public void setReview_idx(int review_idx) {
      this.review_idx = review_idx;
   }
   public int getReview_client_idx() {
      return review_client_idx;
   }
   public void setReview_client_idx(int review_client_idx) {
      this.review_client_idx = review_client_idx;
   }
   public int getReview_orderList_idx() {
      return review_orderList_idx;
   }
   public void setReview_orderList_idx(int review_orderList_idx) {
      this.review_orderList_idx = review_orderList_idx;
   }
   public String getReview_client_name() {
      return review_client_name;
   }
   public void setReview_client_name(String review_client_name) {
      this.review_client_name = review_client_name;
   }
   public int getReview_product_idx() {
      return review_product_idx;
   }
   public void setReview_product_idx(int review_product_idx) {
      this.review_product_idx = review_product_idx;
   }
   public int getReview_product_name() {
      return review_product_name;
   }
   public void setReview_product_name(int review_product_name) {
      this.review_product_name = review_product_name;
   }
   public String getReview_title() {
      return review_title;
   }
   public void setReview_title(String review_title) {
      this.review_title = review_title;
   }
   public String getReview_content() {
      return review_content;
   }
   public void setReview_content(String review_content) {
      this.review_content = review_content;
   }
   public int getReview_productGrade() {
      return review_productGrade;
   }
   public void setReview_productGrade(int review_productGrade) {
      this.review_productGrade = review_productGrade;
   }
   public String getReview_writeDate() {
      return review_writeDate;
   }
   public void setReview_writeDate(String review_writeDate) {
      this.review_writeDate = review_writeDate;
   }
   public String getReview_imgPath() {
      return review_imgPath;
   }
   public void setReview_imgPath(String review_imgPath) {
      this.review_imgPath = review_imgPath;
   }
   @Override
   public String toString() {
      return "ReviewVO [review_idx=" + review_idx + ", review_client_idx=" + review_client_idx
            + ", review_orderList_idx=" + review_orderList_idx + ", review_client_name=" + review_client_name
            + ", review_product_idx=" + review_product_idx + ", review_product_name=" + review_product_name
            + ", review_title=" + review_title + ", review_content=" + review_content + ", review_productGrade="
            + review_productGrade + ", review_writeDate=" + review_writeDate + ", review_imgPath=" + review_imgPath
            + "]";
   }
   
}