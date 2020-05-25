package com.sps.vo;

public class StockVO {
	private int stock_idx;
	private int stock_product_idx ;
	private String stock_size;
	private String stock_color;
	private int stock_stock;
	
	public StockVO() {
	}

	public int getStock_idx() {
		return stock_idx;
	}

	public void setStock_idx(int stock_idx) {
		this.stock_idx = stock_idx;
	}

	public int getStock_product_idx() {
		return stock_product_idx;
	}

	public void setStock_product_idx(int stock_product_idx) {
		this.stock_product_idx = stock_product_idx;
	}

	public String getStock_size() {
		return stock_size;
	}

	public void setStock_size(String stock_size) {
		this.stock_size = stock_size;
	}

	public String getStock_color() {
		return stock_color;
	}

	public void setStock_color(String stock_color) {
		this.stock_color = stock_color;
	}

	public int getStock_stock() {
		return stock_stock;
	}

	public void setStock_stock(int stock_stock) {
		this.stock_stock = stock_stock;
	}

	@Override
	public String toString() {
		return "StockVO [stock_idx=" + stock_idx + ", stock_product_idx=" + stock_product_idx + ", stock_size="
				+ stock_size + ", stock_color=" + stock_color + ", stock_stock=" + stock_stock + "]";
	}
	
}
