package com.sps.vo;

public class ProductInfoList {
	
	private int stock_idx;				// 재고 인덱스
	private int stock_product_idx;		// 상품 인덱스
	private int stock_product_name;		// 상품 이름
	private String stock_size;			// 상품의 사이즈
	private String stock_color;			// 상품의 색상
	private int stock_stock;			// 해당 사이즈, 색상 상품의 재고

	public ProductInfoList() {	}

	public ProductInfoList(int stock_idx, int stock_product_idx, int stock_product_name, String stock_size,
			String stock_color, int stock_stock) {
		super();
		this.stock_idx = stock_idx;
		this.stock_product_idx = stock_product_idx;
		this.stock_product_name = stock_product_name;
		this.stock_size = stock_size;
		this.stock_color = stock_color;
		this.stock_stock = stock_stock;
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

	public int getStock_product_name() {
		return stock_product_name;
	}

	public void setStock_product_name(int stock_product_name) {
		this.stock_product_name = stock_product_name;
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
		return "ProductInfoList [stock_idx=" + stock_idx + ", stock_product_idx=" + stock_product_idx
				+ ", stock_product_name=" + stock_product_name + ", stock_size=" + stock_size + ", stock_color="
				+ stock_color + ", stock_stock=" + stock_stock + "]";
	}
	
	
	
}


