package com.sps.vo;

import java.util.ArrayList;

public class ProductListVO {

   private ArrayList<ProductVO> productList = new ArrayList<ProductVO>();
   private int pageSize = 10;
   private int totalCount = 0;
   private int totalPage = 0;
   private int currentPage = 1;
   private int startNo = 0;
   private int endNo = 0;
   private int startPage = 0;
   private int endPage = 0;
   
   private String searchKey;
   private String searchValue;
   
   private String startDate;
   private String endDate;

   public ProductListVO() { }
   
   public void initProductList(int pageSize, int totalCount, int currentPage) {
      this.pageSize = pageSize;
      this.totalCount = totalCount;
      this.currentPage = currentPage;
      calculator();
   }
   
   private void calculator() {
      totalPage = (totalCount - 1) / pageSize + 1;
      currentPage = currentPage > totalPage ? totalPage : currentPage;
      startNo = (currentPage - 1) * pageSize; 
      endNo = startNo + pageSize - 1;
      endNo = endNo > totalCount ? totalCount : endNo;
      startPage = (currentPage - 1) / 10 * 10 + 1;
      endPage = startPage + 9;
      endPage = endPage > totalPage ? totalPage : endPage;
   }

   public ArrayList<ProductVO> getProductList() {
      return productList;
   }

   public void setProductList(ArrayList<ProductVO> productList) {
      this.productList = productList;
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

   public String getSearchKey() {
      return searchKey;
   }

   public void setSearchKey(String searchKey) {
      this.searchKey = searchKey;
   }

   public String getSearchValue() {
      return searchValue;
   }

   public void setSearchValue(String searchValue) {
      this.searchValue = searchValue;
   }

   public String getStartDate() {
      return startDate;
   }

   public void setStartDate(String startDate) {
      this.startDate = startDate;
   }

   public String getEndDate() {
      return endDate;
   }

   public void setEndDate(String endDate) {
      this.endDate = endDate;
   }

   @Override
   public String toString() {
      return "ProductListVO [productList=" + productList + ", pageSize=" + pageSize + ", totalCount=" + totalCount
            + ", totalPage=" + totalPage + ", currentPage=" + currentPage + ", startNo=" + startNo + ", endNo="
            + endNo + ", startPage=" + startPage + ", endPage=" + endPage + "]";
   }
   
}