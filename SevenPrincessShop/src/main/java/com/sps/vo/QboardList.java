package com.sps.vo;

import java.util.ArrayList;

public class QboardList {

	private ArrayList<Qboard> qBoardList = new ArrayList<Qboard>();
	private int pageSize = 10;	//한페이지에 나타낼글의 수량
	private int totalCount = 0;	// 이건 DB에서 받아오는거 전체 글의 수량
	private int totalPage = 0;	// 이건 전체글의 수량에서 페이지 사이즈만큼 나누면 이거 나옴 ^^
	private int currentPage = 1;// 현재 페이지 번호를 기준으로 앞뒤 불러올려고 있는 거임 ㅇㅇ
	private int startNo = 0;	// 이게 이제 바바 
	private int endNo = 0;		//	잠만
	private int startPage = 0;	//	
	private int endPage = 0;

	// 카큘레이터 구조를 이해했다묜!!
	// 결국 중요한건 토탈카운트와 현재페이지 정보밖에 없어
	// 그 두개를 받아서 init메소드로 list개체를 만들어서 카큘돌리면 
	// 페이징을위한 정보셋팅 완료야
	
	public QboardList() { }
//	pageSize, totalCount, currentPage를 인수로 넘겨받아 멤버 변수를 초기화 시키는 메소드
	public void initQboardList(int pageSize, int totalCount, int currentPage) {
		this.pageSize = pageSize;
		this.totalCount = totalCount;
		this.currentPage = currentPage;
		calculator();
	}
	
	private void calculator() {
		totalPage = (totalCount - 1) / pageSize + 1;						// 총 페이지 수는 전체글-1 / 10(한페이지글개수)+1
		
		currentPage = currentPage > totalPage ? totalPage : currentPage;	// 총 페이지수 보다 넘어온 현재페이지가 크다면 현재페이지는 총페이지넘버(마지막장) 그게 아니라면 현재페이지
		
		startNo = (currentPage - 1) * pageSize;	// 이건 DB IDX 탐색 시작점 지정 ex현재 6 페이지라면 (6-1)*11 임 idx=55
		
		endNo = startNo + pageSize;	// 55 + 10 = 65 
		
		endNo = endNo > totalCount ? totalCount : endNo; // DB 탐색 끝 idx가 토탈카운트 보다 크다면 토탈 카운트가 끝 idx 로 지정
		
		startPage = (currentPage - 1) / 10 * 10 + 1;	// 6 - 1 ) / 10 * 10 + 1  > 0.5 * 10 = 5+1 = 6;
		
		endPage = startPage + 9;

		endPage = endPage > totalPage ? totalPage : endPage;
	}
	
	
	
	
	public ArrayList<Qboard> getQBoardList() {
		return qBoardList;
	}
	public void setQBoardList(ArrayList<Qboard> qBoardList) {
		this.qBoardList = qBoardList;
	}
	public int getPageSize() {
		return pageSize;
	}
	public void setPageSize(int pageSize) {
		this.pageSize = pageSize;
	}
	public int getTotalCount() {
		return totalCount;
	}
	public void setTotalCount(int totalCount) {
		this.totalCount = totalCount;
	}
	public int getTotalPage() {
		return totalPage;
	}
	public void setTotalPage(int totalPage) {
		this.totalPage = totalPage;
	}
	public int getCurrentPage() {
		return currentPage;
	}
	public void setCurrentPage(int currentPage) {
		this.currentPage = currentPage;
	}
	public int getStartNo() {
		return startNo;
	}
	public void setStartNo(int startNo) {
		this.startNo = startNo;
	}
	public int getEndNo() {
		return endNo;
	}
	public void setEndNo(int endNo) {
		this.endNo = endNo;
	}
	public int getStartPage() {
		return startPage;
	}
	public void setStartPage(int startPage) {
		this.startPage = startPage;
	}
	public int getEndPage() {
		return endPage;
	}
	public void setEndPage(int endPage) {
		this.endPage = endPage;
	}
	@Override
	public String toString() {
		return "QboardList [mvcBoardList=" + qBoardList + ", pageSize=" + pageSize + ", totalCount=" + totalCount
				+ ", totalPage=" + totalPage + ", currentPage=" + currentPage + ", startNo=" + startNo + ", endNo="
				+ endNo + ", startPage=" + startPage + ", endPage=" + endPage + "]";
	}
	
}
