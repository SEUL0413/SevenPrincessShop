package com.sps.vo;

public class ProductVO {

	private int product_idx;				// 상품 인덱스
	private String product_name;			// 상품 이름
	private int product_price;				// 상품 가격
	private int product_category;			// 상품 카테고리(01~18)이미지 참고
	private String product_registerDate;	// 상품 등록 날짜
	private int product_hit;				// 상품 조회수
	private int product_stock;				// 상품의 모든 재고(STOCK 테이블의 상품 인덱스에 해당하는 stock 총합)
	private String product_imgPath;			// 상품 사진 경로 (ex "/images/productImages/01/01_01/01_01" => .jpg나 _상세사진 숫자.jpg 따로 추가)
	private int product_imgPathStock;		// 상세 이미지 개수(반복문에 필요)

	public ProductVO() { }
	
	public ProductVO(int product_idx, String product_name, int product_price, int product_category,
			String product_registerDate, int product_hit, int product_stock, String product_imgPath, int product_imgPathStock) {
		super();
		this.product_idx = product_idx;
		this.product_name = product_name;
		this.product_price = product_price;
		this.product_category = product_category;
		this.product_registerDate = product_registerDate;
		this.product_hit = product_hit;
		this.product_stock = product_stock;
		this.product_imgPath = product_imgPath;
		this.product_imgPathStock = product_imgPathStock;
	}
	
	public ProductVO(int product_idx, String product_name, int
			product_price, int product_category,
				int product_hit, int product_stock) {
				super();
				this.product_idx = product_idx;
				this.product_name = product_name;
				this.product_price = product_price;
				this.product_category = product_category;
				this.product_hit = product_hit;
				this.product_stock = product_stock;
			}
	

	public ProductVO(int product_idx, String product_name, int product_price, int product_stock, String product_imgPath, int product_imgPathStock) {
		super();
		this.product_idx = product_idx;
		this.product_name = product_name;
		this.product_price = product_price;
		this.product_stock = product_stock;
		this.product_imgPath = product_imgPath;
		this.product_imgPathStock = product_imgPathStock;
	}

	public int getProduct_idx() {
		return product_idx;
	}

	public void setProduct_idx(int product_idx) {
		this.product_idx = product_idx;
	}

	public String getProduct_name() {
		return product_name;
	}

	public void setProduct_name(String product_name) {
		this.product_name = product_name;
	}

	public int getProduct_price() {
		return product_price;
	}

	public void setProduct_price(int product_price) {
		this.product_price = product_price;
	}

	public int getProduct_category() {
		return product_category;
	}

	public void setProduct_category(int product_category) {
		this.product_category = product_category;
	}

	public String getProduct_registerDate() {
		return product_registerDate;
	}

	public void setProduct_registerDate(String product_registerDate) {
		this.product_registerDate = product_registerDate;
	}

	public int getProduct_hit() {
		return product_hit;
	}

	public void setProduct_hit(int product_hit) {
		this.product_hit = product_hit;
	}

	public int getProduct_stock() {
		return product_stock;
	}

	public void setProduct_stock(int product_stock) {
		this.product_stock = product_stock;
	}

	public String getProduct_imgPath() {
		return product_imgPath;
	}

	public void setProduct_imgPath(String product_imgPath) {
		this.product_imgPath = product_imgPath;
	}

	public int getProduct_imgPathStock() {
		return product_imgPathStock;
	}

	public void setProduct_imgPathStock(int product_imgPathStock) {
		this.product_imgPathStock = product_imgPathStock;
	}

	@Override
	public String toString() {
		return "ProductVO [product_idx=" + product_idx + ", product_name=" + product_name + ", product_price="
				+ product_price + ", product_category=" + product_category + ", product_subCategory="
				+ ", product_registerDate=" + product_registerDate + ", product_hit="
				+ product_hit + ", product_stock=" + product_stock + ", product_imgPath=" + product_imgPath
				+ ", product_imgPathStock=" + product_imgPathStock + "]";
	}
	
}