package com.sps.vo;

import java.sql.Date;

public class OrderListVO {

	private int orderList_idx;
	private int orderList_client_idx;
	private int orderList_product_idx;
	private String orderList_orderStatus;		// ì£¼ë¬¸?ƒ?ƒœ	// boolean => String ?œ¼ë¡? ë³?ê²?(ì£¼ë¬¸ ?™•?¸, ë°°ì†¡ ì¤?ë¹?, ë°°ì†¡ ì¤?, ë°°ì†¡ ?™„ë£?, ì£¼ë¬¸ ì·¨ì†Œ ?“±)
	private Date orderList_orderDate;			// ì£¼ë¬¸ ?‚ ì§?
	
}
