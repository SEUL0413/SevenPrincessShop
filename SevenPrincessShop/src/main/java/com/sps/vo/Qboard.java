package com.sps.vo;

public class Qboard {
	
	
	private int qboard_idx;			// 질문 날짜
	private int qboard_client_idx;	// 질문한 고객 인덱스
	private int qboard_product_idx;	// 질문에 대한 상품 인덱스(필수x)
	private String qboard_title;	// 질문 제목
	private String qboard_content;	// 질문 내용
	private String qboard_date;		// 질문 등록 날짜
	private String qboard_type;		// 질문 유형 (배송문의,환불문의,상품문의,주문변경,기타문의)
	
	
	public int getQboard_idx() {
		return qboard_idx;
	}
	public void setQboard_idx(int qboard_idx) {
		this.qboard_idx = qboard_idx;
	}
	public int getQboard_client_idx() {
		return qboard_client_idx;
	}
	public void setQboard_client_idx(int qboard_client_idx) {
		this.qboard_client_idx = qboard_client_idx;
	}
	public int getQboard_product_idx() {
		return qboard_product_idx;
	}
	public void setQboard_product_idx(int qboard_product_idx) {
		this.qboard_product_idx = qboard_product_idx;
	}
	public String getQboard_title() {
		return qboard_title;
	}
	public void setQboard_title(String qboard_title) {
		this.qboard_title = qboard_title;
	}
	public String getQboard_content() {
		return qboard_content;
	}
	public void setQboard_content(String qboard_content) {
		this.qboard_content = qboard_content;
	}
	public String getQboard_date() {
		return qboard_date;
	}
	public void setQboard_date(String qboard_date) {
		this.qboard_date = qboard_date;
	}
	public String getQboard_type() {
		return qboard_type;
	}
	public void setQboard_type(String qboard_type) {
		this.qboard_type = qboard_type;
	}
	@Override
	public String toString() {
		return "Qboard [qboard_idx=" + qboard_idx + ", qboard_client_idx=" + qboard_client_idx + ", qboard_product_idx="
				+ qboard_product_idx + ", qboard_title=" + qboard_title + ", qboard_content=" + qboard_content
				+ ", qboard_date=" + qboard_date + ", qboard_type=" + qboard_type + "]";
	}
	
}
