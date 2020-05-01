package com.sps.vo;

import java.util.Date;

public class ReviewVO {

	private int review_idx; 				// ?šŒ?›?˜ fk?—¬?„œ idxê°? 3ê°œê? ?“¤?–´ê°?
	private int review_client_idx;			// ê³ ê° idx
	private int review_product_idx;			// ?ƒ?’ˆ idx
	private String review_title;			// ë¦¬ë·° ? œëª?
	private String review_content;			// ë¦¬ë·° ?‚´?š©
	private int review_productGrade;		// ë¦¬ë·° ë³„ì 	// String => intë¡? ë³?ê²?
//	private String review_client_id;		// ë¦¬ë·°?•œ ?šŒ?› ?•„?´?”” - ?šŒ?› ?•„?´?””?Š” ?„œë¸Œì¿¼ë¦¬ë¡œ ë¶ˆëŸ¬?˜¬ ?ˆ˜ ?ˆ?–´?„œ ?—†?–´?„ ? ?“¯... 
	private Date review_writeDate;			// ë¦¬ë·° ?‚ ì§?
	private String review_imgPath;			// ?ƒ?’ˆ ?´ë¯¸ì? ê²½ë¡œ
	
}
