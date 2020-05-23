package com.sps.controller;

import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.json.simple.JSONArray;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.sps.dao.spsDAO;
import com.sps.vo.ProductVO;
import com.sps.vo.ReviewList;

// 쇼핑몰 페이지 처리관련 기능을 담을 컨트롤러에요


@Controller
public class ShopController {

   @Autowired
   SqlSession shopSqlSession;
   
   
   @RequestMapping(value="/showCategory")
   public String showCategory(HttpServletRequest request, Model model) {
      
      String cNum = request.getParameter("cNum");
      model.addAttribute("cNum", cNum);
      
      return "shop/showCategory";
   }
   
//   찬호 옵션 찾기
@RequestMapping("/getOptionValues")
	public void getOptionValues(HttpServletRequest req, HttpServletResponse res, String param, String param2) { 
      	try {
      		String size = param;
      		String product_idx = param2;
      		System.out.println("Size 확인 : " + size);
      		System.out.println("IDX 확인 : " + product_idx);
      		
      		spsDAO mapper = shopSqlSession.getMapper(spsDAO.class);
      		System.out.println("SQL Session Open");
      		
      		ArrayList<String> optionList = mapper.findOption(product_idx, size);
      		System.out.println("SUCCESS GET LIST : " + optionList);
    
      		String getStock;
      		
      			
			
      		JSONArray jsonArray = new JSONArray();
      		for (int i = 0; i < optionList.size(); i++) {
      			getStock = mapper.findOptionStock(product_idx, size, optionList.get(i));
      			System.out.println("Running For roof ("+i+") : " + optionList.get(i));
      			if(getStock.equals("0")) {
      				jsonArray.add(optionList.get(i) + "[품절]");
      			}else if(Integer.parseInt(getStock) < 5) {
      				jsonArray.add(optionList.get(i) + " (재고 : " + getStock + ")");
      			}
      			else {
      				jsonArray.add(optionList.get(i));
      			}
      		}
	    
      		  System.out.println("List pass and fl/cl");
		      PrintWriter pw = res.getWriter();
		      pw.print(jsonArray.toString());
		      pw.flush();
		      pw.close();
		    
		      } catch (Exception e) {
		          System.out.println("com.sps.controller.ShopController java row : 82 ! getOptionValues Exception !");
		      }
      		  System.out.println("getOptionValues Method Running successfully!");
	}
	 

  
//   유정 상품 상세페이지
@RequestMapping(value = "/productInfo", method = RequestMethod.GET)
public String productInfo(HttpSession session,HttpServletRequest request, Model model) {
   System.out.println("컨트롤러의 productInfo() 메소드 실행");
   spsDAO mapper = shopSqlSession.getMapper(spsDAO.class);
   String product_idx = request.getParameter("product_idx");
//   System.out.println(product_idx);
   
//   상품 정보 가져오기
   ProductVO productVO = new ProductVO();
   productVO = mapper.getProductInfo(product_idx);
   
//   사이즈 리스트에 가져오기(ORDER BY stock_idx DESC)
   ArrayList<String> size = mapper.getSize(product_idx);
   
   
//   색 리스트에 가져오기(ORDER BY stock_idx DESCc)
   ArrayList<String> color = mapper.getColor(product_idx);
   
   
  
//   리뷰
   
   ReviewList reviewList = new ReviewList();
	int pageSize = 5;
	int currentPage = 1;
	try {
		currentPage = Integer.parseInt(request.getParameter("currentPage"));
	} catch (NumberFormatException e) { }
	int totalCount = mapper.selectCount(product_idx);

	reviewList.initReviewList2(pageSize, totalCount, currentPage);
	System.out.println(reviewList.getStartNo());
	reviewList.setReviewList(mapper.selectList(Integer.parseInt(product_idx), reviewList.getStartNo()));
	System.out.println(reviewList.getReviewList().get(0).getReview_imgPath());

	model.addAttribute("reviewList", reviewList);
	model.addAttribute("currentPage", currentPage);
	session.setAttribute("productVO", productVO);
	session.setAttribute("size", size);         
	session.setAttribute("color", color);      
   
   
   return "shop/productInfo";
}




//   유정 장바구니에 담기
@RequestMapping(value = "/insertCart", method = RequestMethod.GET)
public String insertCart(HttpServletRequest request, Model model) {
   System.out.println("컨트롤러의 insertCart() 메소드 실행");
   
   spsDAO mapper = shopSqlSession.getMapper(spsDAO.class);
   String orderList_client_idx = request.getParameter("orderList_client_idx");
   String orderList_product_idx = request.getParameter("orderList_product_idx");
   Boolean confirmFlag = Boolean.parseBoolean(request.getParameter("confirmFlag"));
   String selectCode = request.getParameter("selectCode");
   Date date = new Date();
   SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm");
   String orderList_orderDate = sdf.format(date);
   
   
   System.out.println(selectCode);
   
   String[] options = selectCode.split("/");
   String[] option = null;
   
   for (int i = 0; i < options.length; i++) {
      option = options[i].split("_");
      String orderList_size = option[0];
      String orderList_color = option[1];
      String orderList_stock = option[2];
         
      mapper.insertCart(orderList_client_idx, orderList_product_idx, orderList_size, orderList_color, orderList_stock, orderList_orderDate);
            
      }
   
   if (confirmFlag) {
   
      return "redirect:cartView";
   }
   
   return "redirect:productInfo?product_idx="+orderList_product_idx;
}


}