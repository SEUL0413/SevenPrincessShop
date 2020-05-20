package com.sps.vo;

public class AboardVO {

	private int aboard_idx;			// 답변 인덱스
	private int aboard_qboard_idx;	// 답변에 대한 질문 인덱스
	private String aboard_title;	// 답변 제목
	private String aboard_content;	// 답변 내용
	private String aboard_date;		// 답변 날짜
	
	public int getAboard_idx() {
		return aboard_idx;
	}
	public void setAboard_idx(int aboard_idx) {
		this.aboard_idx = aboard_idx;
	}
	public int getAboard_qboard_idx() {
		return aboard_qboard_idx;
	}
	public void setAboard_qboard_idx(int aboard_qboard_idx) {
		this.aboard_qboard_idx = aboard_qboard_idx;
	}
	public String getAboard_title() {
		return aboard_title;
	}
	public void setAboard_title(String aboard_title) {
		this.aboard_title = aboard_title;
	}
	public String getAboard_content() {
		return aboard_content;
	}
	public void setAboard_content(String aboard_content) {
		this.aboard_content = aboard_content;
	}
	public String getAboard_date() {
		return aboard_date;
	}
	public void setAboard_date(String aboard_date) {
		this.aboard_date = aboard_date;
	}
	@Override
	public String toString() {
		return "AboardVO [aboard_idx=" + aboard_idx + ", aboard_qboard_idx=" + aboard_qboard_idx + ", aboard_title="
				+ aboard_title + ", aboard_content=" + aboard_content + ", aboard_date=" + aboard_date + "]";
	}
	
}


