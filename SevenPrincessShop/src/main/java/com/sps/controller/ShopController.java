package com.sps.controller;

import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.sps.dao.spsDAO;
import com.sps.vo.ClientVO;
import com.sps.vo.OrderListVO;
import com.sps.vo.ProductVO;
import com.sps.vo.ReviewList;
import com.sps.vo.StockVO;

import net.nurigo.java_sdk.api.Message;
import net.nurigo.java_sdk.exceptions.CoolsmsException;

// 쇼핑몰 페이지 처리관련 기능을 담을 컨트롤러에요


@Controller
public class ShopController {

   @Autowired
   SqlSession shopSqlSession;
   
// 명훈이 추가 05.25/////////////////////////  
   @RequestMapping(value="/")
	public String index(HttpServletRequest request, Model model) {
		System.out.println("@@@@@@@@@@ index() 메소드 실행 @@@@@@@@@@");
		
		spsDAO mapper = shopSqlSession.getMapper(spsDAO.class);
		
//		bestItem은 stock_status가 payOK된 데이터들 중 hit를 내림차순으로 정렬한 후 페이지에 띄워준다.
		ArrayList<ProductVO> bestList = mapper.bestListDescByIdx();
		ArrayList<ProductVO> topList = mapper.topListDescByIdx();
		ArrayList<ProductVO> bottomList = mapper.bottomListDescByIdx();
		ArrayList<ProductVO> onePieceList = mapper.onePieceListDescByIdx();
		ArrayList<ProductVO> outerList = mapper.outerListDescByIdx();
		ArrayList<ProductVO> acsList = mapper.acsListDescByIdx();
		
		/*
			topList는 8, 7, 6, 5, 4, 3, 2, 1로 가는데 product 테이블의 인덱스 10, 9인
			bottomList는 10, 9로 된다.
		*/ 
		
		int bestCount = mapper.selectBestCount(); 				// 메인 페이지에 보여줄 베스트 상품 이미지 개수(8개)
		int topCount = mapper.selectTopCount(); 				// 메인 페이지에 보여줄 상의 카테고리 상품 이미지 개수(8개)
		int bottomCount = mapper.selectBottomCount(); 			// 메인 페이지에 보여줄 상의 카테고리 상품 이미지 개수(8개)
		int onePieceCount = mapper.selectOnePieceCount(); 		// 메인 페이지에 보여줄 원피스 카테고리 상품 이미지 개수(8개)
		int outerCount = mapper.selectOuterCount(); 			// 메인 페이지에 보여줄 아우터 카테고리 상품 이미지 개수(8개)
		int acsCount = mapper.selectAcsCount(); 				// 메인 페이지에 보여줄 악세사리 카테고리 상품 이미지 개수(8개)
		
		model.addAttribute("bestList", bestList);	
		model.addAttribute("topList", topList);
		model.addAttribute("bottomList", bottomList);
		model.addAttribute("onePieceList", onePieceList);
		model.addAttribute("outerList", outerList);
		model.addAttribute("acsList", acsList);
		
		model.addAttribute("bestCount", bestCount);
		model.addAttribute("topCount", topCount);
		model.addAttribute("bottomCount", bottomCount);
		model.addAttribute("onePieceCount", onePieceCount);
		model.addAttribute("outerCount", outerCount);
		model.addAttribute("acsCount", acsCount);
		
		return "shop/index";
	}
// 명훈이 추가 05.25/////////////////////////   
   
   
// 명훈이 추가 05.25/////////////////////////   
   @RequestMapping(value="showCategory")
	public String showCategory(HttpServletRequest request, Model model) {
		System.out.println("@@@@@@@@@@ showCategory() 메소드 실행 @@@@@@@@@@");
		
		spsDAO mapper = shopSqlSession.getMapper(spsDAO.class);
		
//		categoryNum이라는 카테고리 숫자를 넘겨주기
		String categoryNum = request.getParameter("cNum");
		System.out.println(categoryNum);
		model.addAttribute("categoryNum", categoryNum);
		
//		카테고리 별 제품 데이터들을 pList에 저장한다.
		ArrayList<ProductVO> pList = mapper.getPList(categoryNum);
		System.out.println(pList);
		
//		product_imgPath에서 따온 category number
		int imgCategory = mapper.selectCategory(categoryNum);
		System.out.println(imgCategory);
		
//		for (int i = 0; i < pList.size(); i++) { System.out.println(pList.get(i)); }
//		for (int i = 0; i < pList.size(); i++) { System.out.println(pList.get(i).getProduct_category()); }
//		System.out.println(imgCategory);
		
		model.addAttribute("pList", pList);
		model.addAttribute("imgCategory", imgCategory);
		
		return "shop/showCategory";
	}
// 명훈이 추가 05.25/////////////////////////  
   
   
   
   
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
      			if(Integer.parseInt(getStock) <= 0 ) {
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
@RequestMapping(value = "/productInfo")
public String productInfo(HttpSession session,HttpServletRequest request, Model model) {
   System.out.println("컨트롤러의 productInfo() 메소드 실행");
   spsDAO mapper = shopSqlSession.getMapper(spsDAO.class);
   String product_idx = request.getParameter("product_idx");
//   System.out.println(product_idx);
   
//   상품 정보 가져오기
   ProductVO productVO = new ProductVO();
   productVO = mapper.getProductInfo(product_idx);
   
//   명훈이 삽입 부분 //////////////////////////////////////////////////////

   //	카테고리 번호를 임시로 담아둘 변수
	int hit = mapper.increment(Integer.parseInt(product_idx)); 
	model.addAttribute("productVO", productVO);
	model.addAttribute("product_hit", hit);
	model.addAttribute("product_imgPath", productVO.getProduct_imgPath());
	model.addAttribute("product_imgPathStock", productVO.getProduct_imgPathStock());
	model.addAttribute("product_category", productVO.getProduct_category());
	model.addAttribute("product_idx", productVO.getProduct_idx());
//  명훈이 삽입 부분 ////////////////////////////////////////////////////////
   
   
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
//	System.out.println(reviewList.getReviewList().get(0).getReview_imgPath());

	model.addAttribute("reviewList", reviewList);
	model.addAttribute("currentPage", currentPage);
	session.setAttribute("productVO", productVO);
	session.setAttribute("size", size);         
	session.setAttribute("color", color);      
   
   
   return "shop/productInfo";
}
// 명훈이 추가 05.25/////////////////////////
@RequestMapping("/increment")
public String increment(HttpServletRequest request, Model model) {
	System.out.println("@@@@@@@@@@ increment() 메소드 실행 @@@@@@@@@@");
	spsDAO mapper = shopSqlSession.getMapper(spsDAO.class);
	int idx = Integer.parseInt(request.getParameter("product_idx"));
	mapper.increment(idx);
	model.addAttribute("product_idx", idx);
	return "redirect:shop/index";
}
//명훈이 추가 05.25/////////////////////////

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

//동호 컨트롤러 옵션

int a = 1;		// 문자 1회발송용 변수 a
int code = 0;	// 인증번호 코드 추후 랜덤값 생성

//주문서에 작성된 주문자 정보를 담는 vo	
OrderListVO ovo = new OrderListVO();

//동호 장바구니 -> 주문 페이지   
@RequestMapping(value = "/pay")
public String pay(HttpSession session, HttpServletRequest request, Model model) {      
   ArrayList<OrderListVO> cartListO;
     ArrayList<ProductVO> cartListP;
     
//     //현재 유저 VO
     ClientVO vo = (ClientVO) session.getAttribute("nowUser");
//     //현재 유저 idx
     String orderlist_client_idx = String.valueOf(vo.getClient_idx());
   spsDAO mapper = shopSqlSession.getMapper(spsDAO.class);
        
        
     //orderListVO  ready 정보들 리스트에 담아오기
        cartListO = mapper.cartListPayYet(orderlist_client_idx);
        
        //위에 VO에서 product_idx 가져와 ProductVO 정보 리스트에 담아오기
        cartListP = new ArrayList<ProductVO>();
        for(int i=0;i<cartListO.size();i++) {
           int product_idx = cartListO.get(i).getOrderList_product_idx();
           cartListP.add(mapper.cartListP(product_idx));
        }
        
        model.addAttribute("listO",cartListO); //사이즈,색상,개수
        model.addAttribute("listP",cartListP); //상품이름,상품 이미지, 상품 가격
        
        System.out.println("******************allOrder 메서드 끝*****************");
        
  return "shop/pay";
}   
	
//	동호 상품 상세 페이지 -> 주문 페이지	
	@RequestMapping(value = "/dPay")
	public String dPay(HttpSession session, HttpServletRequest request, Model model) {		
		System.out.println("******************allOrder 메서드 끝*****************");
		spsDAO mapper = shopSqlSession.getMapper(spsDAO.class);
//		ArrayList<OrderListVO> cartListO;
//		ArrayList<ProductVO> cartListP;
		
		 
		String orderList_product_idx = request.getParameter("orderList_product_idx");
		ProductVO productVO = mapper.getProductInfo(orderList_product_idx);
		
		//현재 유저 VO
		ClientVO vo = (ClientVO) session.getAttribute("nowUser");
		
		String selectCode = request.getParameter("selectCode");	
		
		
		ArrayList<String> size = new ArrayList<String>();
		ArrayList<String> color = new ArrayList<String>();
		ArrayList<String> stock = new ArrayList<String>();
		
		
		String[] options = selectCode.split("/");
		String[] option = null;

		for (int i = 0; i < options.length; i++) {
			option = options[i].split("_");
			size.add(option[0]);
			color.add(option[1]);
			stock.add(option[2]);
			String orderList_size = option[0];
			String orderList_color = option[1];
			String orderList_stock = option[2];
		System.out.println(orderList_size+orderList_color+orderList_stock);
		}

		System.out.println("******************allOrder 메서드 끝*****************");
		
		model.addAttribute("size", size);
		model.addAttribute("color", color);
		model.addAttribute("stock", stock);
		model.addAttribute("productVO", productVO);
		model.addAttribute("selectCode", selectCode);

		session.setAttribute("orderList_product_idx",orderList_product_idx);
		return "shop/pay2";
	}	
	
//동호 장바구니 -> 주문페이지 버튼 클릭 시-> status 변경
@RequestMapping(value = "/Status")
public String updateStatus(HttpSession session,HttpServletRequest request, Model model) {   
  ovo.setOrderList_address(request.getParameter("address"));
  ovo.setOrderList_detailAddress(request.getParameter("detailAddress"));
  ovo.setOrderList_addressNumber(request.getParameter("addressNumber"));
  System.out.println(ovo.getOrderList_address());
   model.addAttribute("ovo", ovo);
   
   

  Date date = new Date();
    SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm");
    
    String orderlist_orderDate = sdf.format(date); 
    
    
  System.out.println("******************updateStatus 메서드 실행*****************");

   String client_idx = request.getParameter("orderlist_client_idx");
  spsDAO mapper = shopSqlSession.getMapper(spsDAO.class);
  
  
  StockVO stocks = new StockVO();
  ProductVO products = new ProductVO();
  products.getProduct_idx();
  stocks.getStock_stock();

  System.out.println("******************updateStatus 메서드 끝*****************");
  
  System.out.println("@@@@@@@@@@@@pay3@@@@@@@@@@@@@");
 
    ArrayList<OrderListVO> cartListO = mapper.cartListPay(client_idx);
    
    
    
    for(int i=0;i<cartListO.size();i++) {
    
       String stock_stock = cartListO.get(i).getOrderList_stock();
       String product_idx = String.valueOf(cartListO.get(i).getOrderList_product_idx());
       String stock_size = cartListO.get(i).getOrderList_size();
       String stock_color = cartListO.get(i).getOrderList_color();
     
       mapper.stockSell(stock_stock,product_idx, stock_size, stock_color);
       mapper.productUpdate(product_idx, product_idx);
       
    }
    
    mapper.allStatus("payOK",orderlist_orderDate, ovo.getOrderList_address(), ovo.getOrderList_detailAddress(), ovo.getOrderList_addressNumber(), client_idx);
    System.out.println("@@@@@@@@@@@@pay3끝@@@@@@@@@@@@@");
  return "shop/pay3"; 
}

	
//	동호 상세페이지 -> 주문 완료시 status 추가, 정보넣기, stock 내리기	
	@RequestMapping(value="/dPay3")
	public String dPay3(HttpSession session,HttpServletRequest request, Model model) {
		System.out.println("@@@@@@@@@@@@dPay3시작@@@@@@@@@@@@@");
		spsDAO mapper = shopSqlSession.getMapper(spsDAO.class);
		Date date = new Date();
     SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm");
     String orderList_orderDate = sdf.format(date); 
     //현재 유저 VO
     ClientVO vo = (ClientVO) session.getAttribute("nowUser");
     String client_idx = request.getParameter("orderlist_client_idx");
     	String orderOptions = request.getParameter("orderOptions");
			String[] options = orderOptions.split("/");
			String[] option = null;
			String orderlist_client_idx = String.valueOf(vo.getClient_idx());
			String orderList_product_idx = (String) session.getAttribute("orderList_product_idx");    
			ovo.setOrderList_address(request.getParameter("address"));
			ovo.setOrderList_detailAddress(request.getParameter("detailAddress"));
			ovo.setOrderList_addressNumber(request.getParameter("addressNumber"));
			model.addAttribute("ovo", ovo);
			   for (int i = 0; i < options.length; i++) {
			      option = options[i].split("_");
			      String orderList_size = option[0];
			      String orderList_color = option[1];
			      String orderList_stock = option[2];
			  System.out.println(orderList_product_idx);
			  
			  mapper.stockSell(orderList_stock,orderList_product_idx, orderList_size, orderList_color);
			  mapper.productUpdate(orderList_product_idx, orderList_product_idx);
			  mapper.dPayInsertOrderList(orderlist_client_idx, orderList_product_idx,ovo.getOrderList_address(),ovo.getOrderList_detailAddress(), ovo.getOrderList_addressNumber() , orderList_size, orderList_color, orderList_stock, orderList_orderDate);
			   } 
			  			  
			  
			         			          
		
			   
			   System.out.println("@@@@@@@@@@@@dPay3끝@@@@@@@@@@@@@");
		return "redirect:pay3"; 
	}
	
	//joinSendCode
			@RequestMapping(value="/SendCode")
			@ResponseBody
			public String joinSendCode(HttpSession session, HttpServletRequest request,HttpServletResponse res, Model model, String phoneNumber) {
				
				if(a==1) {
					
					spsDAO mapper = shopSqlSession.getMapper(spsDAO.class);
					
					int count = mapper.isMemberByPhoneNumber(phoneNumber);
					
					if(count!=0){
						System.out.println("이미 가입된 번호");
						return "overlap";
					}
					
					System.out.println("sendMessage");
					code = (int)Math.floor(Math.random()*1000000+1);
					
					model.addAttribute("code",code);
					
					a=2;
					
				
			  	String api_key = "NCSPDUHGAWCUUPXC";
			    String api_secret = "KLXUWMMFVE0Y1OYGXVFLAPK4BY0KDH75";
			    
			    Message coolsms = new Message(api_key, api_secret);

			    HashMap<String, String> params = new HashMap<String, String>();
			    
			    params.put("to", phoneNumber);
			    params.put("from", "01047598517");
			    params.put("type", "SMS");
			    params.put("text", "SevenPrincessShop 본인인증번호는 ["+code+"] 입니다.");
			    params.put("app_version", "test app 1.2"); 

			    try {
			      JSONObject obj = (JSONObject) coolsms.send(params);
			      System.out.println(obj.toString());
			    } catch (CoolsmsException e) {
			      System.out.println(e.getMessage());	//실패하면 콘솔 알려주삼
			      System.out.println(e.getCode());
			    }
			    
				return code+"";
				}
				
//				여기는 a!=1 일때 들어오는 공간임
				else {
					System.out.println("noSend");	// 응 안보내
			         return "noSend/"+code;
				}
			}
	
		//   뒤로가기시 ready를 cart로 바꾸는 매핑
	         @RequestMapping(value = "/backtothehead")
	         public String backtothehead(HttpSession session,HttpServletRequest request, Model model) {
	            spsDAO mapper = shopSqlSession.getMapper(spsDAO.class);
	            
	            mapper.backCart();
	            return "redirect:cartView";
	         }   


	

	
//	동호 결제 완료 페이지
	@RequestMapping(value = "/pay3")
	public String pay3(HttpSession session,HttpServletRequest request, Model model) {
		
		
		
		return "shop/pay3";
	}
	
}


