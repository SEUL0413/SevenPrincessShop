package com.sps.controller;

import java.io.File;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Locale;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.io.FilenameUtils;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.sps.dao.spsDAO;
import com.sps.vo.AboardVO;
import com.sps.vo.ClientListVO;
import com.sps.vo.JoinListVO;
import com.sps.vo.JoinVO;
import com.sps.vo.ProductListVO;
import com.sps.vo.ProductVO;
import com.sps.vo.Qboard;
import com.sps.vo.QboardList;
import com.sps.vo.StockVO;


// 관리자 기능을 담을 컨트롤러에요
@Controller
public class AdminController {
   
   @Autowired
   public SqlSession adminSqlSession;
   
   //파입 업로드 경로 지정
   @Resource(name="filePath")
   private String filePath;
   
   
   //관리자 메인 테스트
   @RequestMapping(value = "/admin")
   public String memberMain(Locale locale, Model model) {   
      return "admin/adminMain";
   }
   
   //관리자 css 테스트
      @RequestMapping(value = "/adminMain")
      public String adminMain(Locale locale, Model model) {   
         return "redirect:memberList";
      }
   
   
   
   
   
   
   
   
   
   
   
   
   
   
      //전체회원 목록보기 
      @RequestMapping(value = "/memberList")
      public String memberList(HttpServletRequest request, Model model, ClientListVO clientList) {   
         spsDAO mapper = adminSqlSession.getMapper(spsDAO.class);
         try {request.setCharacterEncoding("utf-8"); } catch (UnsupportedEncodingException e1) {e1.printStackTrace();}
         
         //브라우저 화면에 출력할 글의 개수를 정한다.
         int pageSize = 10;
         //컨트롤러에서 HttpServletRequest 인터페이스 객체에 저장되서 넘어온 화면에 표시할 페이지 번호를 받는다.
         int currentPage = 1;
         try {
            currentPage = Integer.parseInt(request.getParameter("currentPage"));
         } catch (NumberFormatException e) { }
         
         
         //검색값을 가져온다
         String searchKey = request.getParameter("searchKey");
         String searchValue = request.getParameter("searchValue");
         
         //검색한 값을 화면에 유지하기위해 값을 보내놓는다.
         model.addAttribute("key", searchKey);
         model.addAttribute("value",searchValue);


         //검색키가 없을 경우
         if (searchKey ==null) clientList.setSearchKey("client_name");
         else clientList.setSearchKey(searchKey);
         //검색값이 없을 경우
         if (searchValue ==null) clientList.setSearchValue("");
         else clientList.setSearchValue(searchValue);
         
         System.out.println("searchKey : " +   clientList.getSearchKey());
         System.out.println("searchValue : " + clientList.getSearchValue());
         
         //mapper에서 검색값을 불러올 map을 만든다.      
         Map<String, Object> map = new HashMap<String, Object>();
         map.put("searchKey", clientList.getSearchKey());
         map.put("searchValue", clientList.getSearchValue());
         
         //회원목록 전체 개수를 가져온다.
         int totalCount = mapper.countClient(map);
         System.out.println("회원목록 전체 개수 : " + totalCount);
         
         
         //페이징을 위한 메소드 초기화
         //clientList 클래스의 1페이지 분량의 글을 기억하는 ArrayList에 1페이지 분량의 글을 테이블에서 얻어와서 넣어준다.
         clientList.initClientList(pageSize, totalCount, currentPage);
         
         //선언했던 map에 startPage,pageSize를 더 넣어준다.
         map.put("startPage", clientList.getStartNo());
         map.put("pageSize", clientList.getPageSize());
         System.out.println("컨트롤러의 memberList메소드의 map값 : " + map);
         
         clientList.setClientList(mapper.selectClientList(map));
         System.out.println("초기화 한 clientList " + clientList);
         
         //memberList.jsp로 넘겨줄 데이터를 Model 인터페이스 객체에 넣어준다.
         model.addAttribute("clientList", clientList);
               
         return "admin/memberList";
      }
      
      
      
      
      //   CHECK! 05-18 
      //   전송버튼 좀만 우측으로(폼이랑 겹침)
      //   조회 조건 변경시(select)돌아오면 기존 select 값 유지 x > 수정 가능하시면 해주시면 감사하겠습니당
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      //특정 회원 주문 내역 보기
      @RequestMapping(value = "/clientOrderList")
      public String clientOrderList(HttpServletRequest request, Model model) {   
         spsDAO mapper = adminSqlSession.getMapper(spsDAO.class);
         
         //location.href='clientOrderList?client_idx=${client.client_idx}' 로 넘어오는 client_idx값을 받아온다
         int client_idx = Integer.parseInt(request.getParameter("client_idx"));
         
         System.out.println(client_idx);
         
         //넘어온 해당 client_idx값에 해당하는 회원의 주문내역을 불러온다.
         List<JoinVO> list = mapper.selectOrderList(client_idx);
         System.out.println("회원 주문내역 list : " + list);
         System.out.println("list.size : " + list.size());      
         
         //불러온 회원의 주문내역을 보내준다.
         model.addAttribute("list",list);
         
         return "admin/clientOrderList";
      }
//      CHECK! 05-18
//      탐색기능 다 잘 작동 > orderList 테이블 접근자들이랑 status 상의해서 확실히 맞추기 



      
      
      
      
      
      
      
      
   //////////////////////////////판매목록///////////////////////////////////////
   @RequestMapping(value ="/salesTable")
   public String salesTable(HttpServletRequest request, Model model, JoinListVO joinList) {
   spsDAO mapper = adminSqlSession.getMapper(spsDAO.class);   

   //브라우저 화면에 출력할 글의 개수를 정한다.
   int pageSize = 10;
   //컨트롤러에서 HttpServletRequest 인터페이스 객체에 저장되서 넘어온 화면에 표시할 페이지 번호를 받는다.
   int currentPage = 1;
   try {
   currentPage = Integer.parseInt(request.getParameter("currentPage"));
   } catch (NumberFormatException e) { }
   model.addAttribute("cp",currentPage);

   //검색값 받아오기
   String searchKey = request.getParameter("searchKey");
   String searchValue = request.getParameter("searchValue");
   //검색한 값을 화면에 유지하기위해 값을 보내놓는다.
   model.addAttribute("key", searchKey);
   model.addAttribute("value",searchValue);

   //기간 검색 값 받아오기
   String startDate = request.getParameter("startDate");
   model.addAttribute("sDate",startDate);
   String endDate = request.getParameter("endDate");
   model.addAttribute("eDate",endDate);

   //기간 설정을 안했을 경우
   if(startDate == null) joinList.setStartDate("");
   else joinList.setStartDate(startDate);
   if(endDate == null) joinList.setEndDate("");
   else joinList.setEndDate(endDate);

   System.out.println("startDate : " + joinList.getStartDate() + " endDate : " + joinList.getEndDate());
   System.out.println("searchKey : " +   searchKey);
   System.out.println("searchValue : " + searchValue);

   //맵에 검색값과 기간설정값을 저장한다
   Map<String, Object> map = new HashMap<String, Object>();
   map.put("searchKey", searchKey);
   map.put("searchValue", searchValue);
   map.put("startDate", joinList.getStartDate());
   map.put("endDate", joinList.getEndDate());

   //검색한 전체 개수를 가져온다
   int count = mapper.countSales(map);
   //System.out.println(count);

   //페이징을 위한 메소드 초기화
   //clientList 클래스의 1페이지 분량의 글을 기억하는 ArrayList에 1페이지 분량의 글을 테이블에서 얻어와서 넣어준다.
   joinList.initJoinList(pageSize, count, currentPage);

   //선언했던 map에 페이징을 위한 변수 startPage, pageSize를 더 넣어준다.
   map.put("startPage", joinList.getStartNo());
   map.put("pageSize", joinList.getPageSize());
   System.out.println("컨트롤러의 joinList메소드의 map값 : " + map);


   String orderby = request.getParameter("orderby"); 
   System.out.println(orderby);
   if(orderby == null) {
   orderby = "orderList_idx";
   }
   System.out.println(orderby);
   model.addAttribute("ob",orderby);
   map.put("orderby", orderby);


   //전체 판매기록을 가져온다
   joinList.setJoinList(mapper.selectSales(map));
   System.out.println(joinList);

   //salesTable에 판매건수와 가져온 판매기록을 넘겨준다.
   model.addAttribute("count",count);
   model.addAttribute("joinList",joinList);

   return "admin/salesTable";
   }
      



   ///////////////////////////////판매차트//////////////////////////////////////////
      @RequestMapping(value = "/salesGraph")
      public String zing4(Locale locale, Model model) {   
         spsDAO mapper = adminSqlSession.getMapper(spsDAO.class);
         
         //월별 판매 완료 건수를 담을 ArrayList
         ArrayList<Integer> monthSalesCount = new ArrayList<Integer>();
         //월별 판매 취소 건수를 담을 ArrayList
         ArrayList<Integer> monthCancelCount = new ArrayList<Integer>();
         //월별 판매 금액을 담을 ArrayList
         ArrayList<Integer> monthSalesPrice = new ArrayList<Integer>();
         //베스트 아이템을 담을 ArrayList
         ArrayList<ProductVO> monthBestItem = mapper.monthBestItem();      
         
         String date = "";
         Integer salesPrice;  
         for(int i = 1; i <13; i++) {
            if(i < 10) {   //날짜 월의 1-9까지 앞에 0을 붙여주기 위한 조건문
               date = "2020-0"+i;
               int salesCount = mapper.monthSalesCount(date);
               int cancelCount = mapper.monthCancelCount(date);
                  if(mapper.monthSalesPrice(date) == null) {
                     salesPrice = 0;
                  }else {
                     salesPrice = mapper.monthSalesPrice(date);
                  }
               monthSalesCount.add(salesCount);
               monthCancelCount.add(cancelCount);
               monthSalesPrice.add(salesPrice);
            }else {
               date = "2020-"+i;
               int salesCount = mapper.monthSalesCount(date);
               int cancelCount = mapper.monthCancelCount(date);
                  if(mapper.monthSalesPrice(date) == null) {
                     salesPrice = 0;
                  }else {
                     salesPrice = mapper.monthSalesPrice(date);
                  }
               monthSalesCount.add(salesCount);
               monthCancelCount.add(cancelCount);
               monthSalesPrice.add(salesPrice);
            }
         }
            
         System.out.println(monthSalesCount);
         System.out.println(monthCancelCount);
         System.out.println(monthSalesPrice);
      
         model.addAttribute("monthSalesCount", monthSalesCount);
         model.addAttribute("monthCancelCount", monthCancelCount);
         model.addAttribute("monthSalesPrice", monthSalesPrice);
         model.addAttribute("monthBestItem",monthBestItem);
         
         
         return "admin/salesGraph";
      }
      
      

      
      


      
      
//      CHECK! 05-18
//      기능은 다 정상!    기간 검색 기가 막힘

//      판매상태 업데이트 버튼 해주실 수 있으십니까.
//         > status가 payOK 면 확인 버튼을 눌러 상품 준비중이라는 status 로 업데이트
//            상품준비중인 상품에 대해 send 버튼을 눌러 status 상태를 발송완료 로 업데이트

      
//      매출조회 기능 추가하면 진짜 멋질텐데 다른거로도 바쁘니 무리해선 하지말고 짬짬히 추후에라도 해주실 수 있으시면..부탁 드립니당
//      ex) 당일, 월별, 년별, 총매출 
//         회원별 검색시 회원별 총 구매금액 
//         제품명 조건 검색시 당 제품의 총 판매액 등등
   

   
   




   
   
//   CHECK! 05-18
//   기능은 다 정상!    기간 검색 기가 막힘

//   판매상태 업데이트 버튼 해주실 수 있으십니까.
//      > status가 payOK 면 확인 버튼을 눌러 상품 준비중이라는 status 로 업데이트
//         상품준비중인 상품에 대해 send 버튼을 눌러 status 상태를 발송완료 로 업데이트

   
//   매출조회 기능 추가하면 진짜 멋질텐데 다른거로도 바쁘니 무리해선 하지말고 짬짬히 추후에라도 해주실 수 있으시면..부탁 드립니당
//   ex) 당일, 월별, 년별, 총매출 
//      회원별 검색시 회원별 총 구매금액 
//      제품명 조건 검색시 당 제품의 총 판매액 등등
   
   
   
   
   
   

   


   
   
   
   
   

   
   
   //=================================05/20 혜인===============================


   
   //관리자 모드 게시판 관리 목록 view(+리스트 받아와서 뿌리기)
      @RequestMapping(value="/allBoard")
      public String allBoard(HttpServletRequest request, Model model) {
         
         System.out.println("*************allBoard() 메서드 실행**************");
         
         // 매퍼생성
         spsDAO mapper = adminSqlSession.getMapper(spsDAO.class);
         
         int pageSize = 10;                           // 보여줄 글의 개수
         int totalCount = mapper.allCountQ();             // 글의 총 수량
         int currentPage = 1;                        // view 에서 넘어오는 현재페이지 정보
         try {
            currentPage = Integer.parseInt(request.getParameter("currentPage")); 
         } 
         catch (NumberFormatException e) { }
         
         // 1) 게시판에 뿌려줄 Q보드 리스트 뽑아오기
         QboardList qboardList = new QboardList();               
         qboardList.initQboardList(pageSize, totalCount, currentPage); //QboardList 초기화
         
         //현재 유저 idx 와 게시판에 뿌려줄 startNo와 개수 넘겨주기
         qboardList.setQBoardList(mapper.allSelectQ(qboardList.getStartNo(),pageSize));
         //qBoardVO들이 담겨질 arrayList
         ArrayList<Qboard> lists = qboardList.getQBoardList();
         
         // 2) 답변 상태 뿌려주기 위한 qboard_idx 값 받아오기
         //=>aboard 테이블에 있는 qboard_idx는 답변완료 / 없는 idx는 답변 대기
         ArrayList<String> answer = new ArrayList<String>();
         for(Qboard list : lists) {
            
            //db에서 가져온 질문번호가 Aboard(답변 테이블)에 있는지 체크(없으면 0, 있으면 1 반환)
            int check = mapper.boardChk(list.getQboard_idx());
            if(check==0) {
               answer.add("답변대기");
            }else {
               answer.add("답변완료");
            }
         }
         
         // 3) 현재 접속 유저가 올린 질문글에 해당하는 답변들 추출
         ArrayList<AboardVO> aboardList =  mapper.allSelectA();
         
         // 4) 오늘 등록된 질문글 개수 체크
         
         //오늘날짜 생성 
         Date today = new Date();
         SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd"); 
         
         int count = mapper.dateCount(sdf.format(today)+"%");
         
         model.addAttribute("aboardList", aboardList); 
         model.addAttribute("qboardList", lists); 
         model.addAttribute("info", qboardList); 
         model.addAttribute("answer", answer);
         model.addAttribute("count",count);
         model.addAttribute("totalCount",totalCount);

         System.out.println("**************allBoard() 메서드 끝***************");
         return "admin/admin_board";
      }
      
      //관리자 모드 qna보드 답변 쓰기 화면
      @RequestMapping(value="/insertBoardView")
      public String insertBoardView(HttpServletRequest request, Model model) {
         
         System.out.println("**************insertBoardView() 메서드 실행***************");
         
         //질문글 번호 받아서 넘겨주기
         String qboard_idx = request.getParameter("qboard_idx");
         model.addAttribute("q_idx",qboard_idx);
         
         System.out.println("**************insertBoardView() 메서드 끝***************");
         return "admin/admin_insertBoard";
      }
      
      //관리자 모드 답변 aboard에 insert
      @RequestMapping(value="/insertAnswer")
      public String insertAnswer(HttpServletRequest request,Model model,HttpServletResponse response) throws IOException {
         System.out.println("**************insertAnswer() 메서드 실행***************");

         // 매퍼생성
         spsDAO mapper = adminSqlSession.getMapper(spsDAO.class);
         
         //질문글 idx
         int q_idx = Integer.parseInt(request.getParameter("q_idx"));
         //답변글 제목
         String title = request.getParameter("title"); 
         //답변글 내용
         String content = request.getParameter("content");
         //날짜 생성
         Date date = new Date();
         SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm");

         AboardVO vo = new AboardVO();
         vo.setAboard_qboard_idx(q_idx);
         vo.setAboard_title(title);
         vo.setAboard_content(content);
         vo.setAboard_date(sdf.format(date));
         
         //답변글 Aboard 테이블에 insert
         mapper.insertAnswer(vo);
         
         //완료후 alert 띄어주기
         model.addAttribute("insert_msg","답변 등록이 완료됐습니다.");
         
         System.out.println("***************insertAnswer() 메서드 끝****************");
         
         return "admin/admin_board";
      }
      
      //관리자 모드 게시판 글 삭제
      @RequestMapping(value="/deleteQ")
      public String deleteQ(HttpServletRequest request,Model model,HttpServletResponse response) throws IOException {
         System.out.println("**************deleteQ() 메서드 실행***************");

         // 매퍼생성
         spsDAO mapper = adminSqlSession.getMapper(spsDAO.class);
         
         //삭제할 목록들의 qboard_idx 를 배열에 세팅 
         String idxs = request.getParameter("idxs");
         String[] indexs = idxs.split("_");
         
         System.out.println(indexs.length);
         
         for(int i=0;i<indexs.length;i++) {
            if(indexs[i]!="" && indexs[i]!=null) {
               //qboard idx를 인자로 넘겨 실행
               mapper.deleteQ(Integer.parseInt(indexs[i]));  //q보드 레코드 삭제시, 참고 테이블인 a보드 레코드도 연쇄 삭제된다.
            }
         }
         
         //완료후 alert 띄어주기
         model.addAttribute("delete_msg","질문글 삭제가 완료됐습니다.");
         
         System.out.println("***************deleteQ() 메서드 끝****************");
         
         return "admin/admin_board";
      }
      
   
      //=================================05/20 혜인 끝===============================
   
   
      
      ////////////////////////주문상태 send로 변경//////////////////////////
      @RequestMapping(value ="/payOKTable")
      public String payOK(HttpServletRequest request, Model model, JoinListVO joinList) {
         spsDAO mapper = adminSqlSession.getMapper(spsDAO.class);   
         
         //브라우저 화면에 출력할 글의 개수를 정한다.
         int pageSize = 10;
         //컨트롤러에서 HttpServletRequest 인터페이스 객체에 저장되서 넘어온 화면에 표시할 페이지 번호를 받는다.
         int currentPage = 1;
         try {
            currentPage = Integer.parseInt(request.getParameter("currentPage"));
         } catch (NumberFormatException e) { }
                  
         //검색값 받아오기
         String searchKey = request.getParameter("searchKey");
         String searchValue = request.getParameter("searchValue");
         //검색한 값을 화면에 유지하기위해 값을 보내놓는다.
         model.addAttribute("key", searchKey);
         model.addAttribute("value",searchValue);
         
         //기간 검색 값 받아오기
         String startDate = request.getParameter("startDate");
         model.addAttribute("sDate",startDate);
         String endDate = request.getParameter("endDate");
         model.addAttribute("eDate",endDate);
         
         //기간 설정을 안했을 경우
         if(startDate == null) joinList.setStartDate("");
         else joinList.setStartDate(startDate);
         if(endDate == null) joinList.setEndDate("");
         else joinList.setEndDate(endDate);
         
         System.out.println("startDate : " + joinList.getStartDate() + " endDate : " + joinList.getEndDate());
         System.out.println("searchKey : " +   searchKey + "searchValue : " + searchValue);
         
         //맵에 검색값과 기간설정값을 저장한다
         Map<String, Object> map = new HashMap<String, Object>();
         map.put("searchKey", searchKey);
         map.put("searchValue", searchValue);
         map.put("startDate", joinList.getStartDate());
         map.put("endDate", joinList.getEndDate());
         
         //검색한 전체 개수를 가져온다
         int count = mapper.countSalesPayOK(map);
         //System.out.println(count);
         
         //페이징을 위한 메소드 초기화
         //clientList 클래스의 1페이지 분량의 글을 기억하는 ArrayList에 1페이지 분량의 글을 테이블에서 얻어와서 넣어준다.
         joinList.initJoinList(pageSize, count, currentPage);
         
         //선언했던 map에 페이징을 위한 변수 startPage, pageSize를 더 넣어준다.
         map.put("startPage", joinList.getStartNo());
         map.put("pageSize", joinList.getPageSize());
         System.out.println("컨트롤러의 joinList메소드의 map값 : " + map);
         
         //클릭시 정렬하기위해 orderby값을 받아온다.
         String orderby = request.getParameter("orderby"); 
         if(orderby == null) {   orderby = "orderList_idx";   }
         System.out.println("orderby : "+ orderby);         
         map.put("orderby", orderby);
                  
         //전체 판매기록을 가져온다
         joinList.setJoinList(mapper.payOKTable(map));
         System.out.println(joinList);
         
         //salesTable에 판매건수와 가져온 판매기록을 넘겨준다.
         model.addAttribute("count",count);
         model.addAttribute("joinList",joinList);
                  
         return "admin/payOKTable";
      }
      
      
         
      
      //주문상태 변경 후 redirect
      @RequestMapping(value = "/payOKTableResult")
      public String payOKTableResult(HttpServletRequest request, Model model) {
         spsDAO mapper = adminSqlSession.getMapper(spsDAO.class);
         
         String orderList_idx = request.getParameter("orderlist_idx");
         System.out.println(orderList_idx);
         mapper.updateStatus(orderList_idx);

         return "redirect:/payOKTable";
      }
      
      
      
      
      //상품등록 페이지
      @RequestMapping(value = "/productUpload")
      public String file(Locale locale, Model model) {

         String rootPath = System.getProperty("user.dir");
           System.out.println("현재 프로젝트의 경로 : "+rootPath );

         return "admin/productUpload";
      }
      
      
      

      ////////////////////////////////상품 업로드//////////////////////////////
      @RequestMapping(value = "upload")
       public String upload(MultipartHttpServletRequest mtfRequest, HttpServletRequest request, ProductVO productVO, StockVO stockVO) {
         System.out.println("upload method");
         spsDAO mapper = adminSqlSession.getMapper(spsDAO.class);
         
         //오늘 날짜 선언
         Date date = new Date();
         SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm");
         String today = String.valueOf(sdf.format(date));
         
         //상품 등록을 위한 product테이블의 product_name, product_price, product_category, product_regdate, product_imgPath를 insert 하기위해 값을 셋팅한다.
         //동적으로 입력한 카테고리 값을 가져와 productVO에 set 해준다
         System.out.println("Product_category : "+ request.getParameter("subSelect"));
         productVO.setProduct_category(Integer.parseInt(request.getParameter("subSelect")));
         int product_category = productVO.getProduct_category();
         //product_price값에서 ,를 split해서 없애준다.
         String[] test = request.getParameter("p_price").split(",");
         String p = "";
         for (int i = 0; i < test.length; i++) {
            p+=test[i];
         }
         System.out.println("split한 product_price : " + p);
         productVO.setProduct_price(Integer.parseInt(p));
         
         //인덱스 1 증가 시켜주기
         mapper.updateProductIndex(product_category);
         //최근 인덱스 가져오기
         int product_index = mapper.productIndex(product_category);
         //DB에 저장할 product_imgPath값 설정
         String product_imgPath = "./resources/images/productImages/"+product_category+ "_" + product_index;
         productVO.setProduct_imgPath(product_imgPath);
         productVO.setProduct_registerDate(today);   //오늘날짜 db에 넣어주기 위해 set
                  
         System.out.println("insert할 productVO : " + productVO);
         mapper.insertProduct(productVO);   //상품 업로드
                  
         //stock테이블에 insert하기 위해 product_idx, size, color, stock 값 셋팅 
         int product_idx = mapper.getProductIdx();
           
         String stock_color[] = request.getParameterValues("stock_color");
         String stock_size[] = request.getParameterValues("stock_size");
         String[] stock_stock = request.getParameterValues("stock_stock");
         
         for(int i=0; i<stock_color.length; i++){
            stockVO.setStock_color(stock_color[i]);
            stockVO.setStock_size(stock_size[i]);
            stockVO.setStock_stock(Integer.parseInt(stock_stock[i]));
            stockVO.setStock_product_idx(product_idx);
                
            mapper.insertStock(stockVO);
            System.out.println("insert할 stockVO :" + stockVO);
         }
         
         
         //파일 저장
         MultipartFile file = mtfRequest.getFile("file");   //단일파일
           List<MultipartFile> multi = mtfRequest.getFiles("multi");//다중파일
           
           //저장할 파일 경로 ->servlet-context에서 변경(filePath 맨 위에 선언)
           String path = filePath;           
           
           String extension = FilenameUtils.getExtension(file.getOriginalFilename()); //파일 확장자 가져오기
           String safeFile = path + product_category+ "_" + product_index + "_1" + "."+extension; //저장할 파일명 선언
           System.out.println("저장될 파일명 : " + safeFile);
           try {
            file.transferTo(new File(safeFile));
         } catch (IllegalStateException e1) {e1.printStackTrace();} catch (IOException e1) {e1.printStackTrace();}
           
           
           //다중파일 저장
           int i = 1; //다중파일의 파일명 끝번호를 설정해주기 위한 변수
           for (MultipartFile mf : multi) {                      
               extension = FilenameUtils.getExtension(mf.getOriginalFilename()); //파일 확장자 가져오기
               String safeMultiFile = path + product_category+ "_" + product_index + "_" + ++i +"."+ extension;
               System.out.println("저장될 파일명 : " + safeMultiFile);
               try {
                   mf.transferTo(new File(safeMultiFile));
               } catch (IllegalStateException e) {e.printStackTrace();} catch (IOException e) {e.printStackTrace();}
           }

           return "admin/uploadView";
       }
      
      

      
      //상품등록 페이지
      @RequestMapping(value = "/salesCheck")
      public String salesCheck(Locale locale, Model model) {
         return "admin/salesCheck";
      }
      
      
      
      
      
      /////////////매출조회
      @RequestMapping(value = "/salesTerm")
      public String salesCheck(HttpServletRequest request, Model model, JoinListVO joinList, HttpServletResponse response) {
         spsDAO mapper = adminSqlSession.getMapper(spsDAO.class);   

         //브라우저 화면에 출력할 글의 개수를 정한다.
         int pageSize = 10;
         //컨트롤러에서 HttpServletRequest 인터페이스 객체에 저장되서 넘어온 화면에 표시할 페이지 번호를 받는다.
         int currentPage = 1;
         try {
         currentPage = Integer.parseInt(request.getParameter("currentPage"));
         } catch (NumberFormatException e) { }

         String year = request.getParameter("YEAR");
         String month = request.getParameter("MONTH");
         model.addAttribute("year",year);
         model.addAttribute("month",month);
         System.out.println("year : "+ year);
         System.out.println("month : " +month);
         
         //기간 검색 값 받아오기
         String startDate = request.getParameter("startDate");
         model.addAttribute("sDate",startDate);
         String endDate = request.getParameter("endDate");
         model.addAttribute("eDate",endDate);
         
         //검색값 받아오기
         String searchKey = request.getParameter("searchKey");
         String searchValue = request.getParameter("searchValue");
         //검색한 값을 화면에 유지하기위해 값을 보내놓는다.
         model.addAttribute("key", searchKey);
         model.addAttribute("value",searchValue);

         String product_name = request.getParameter("product_name");
         model.addAttribute("product_name",product_name);
         
         try {
            if(year == null) year = "";
            if(month == null || month.equals("")) {   
               month = "";
            }else
               if(10> Integer.parseInt(month)) {   month = "0" + month;   }
            month = year+"-"+month;
         }catch (NumberFormatException e) {System.out.println(month);}
         
         
      
         
         //기간 설정을 안했을 경우
         if(startDate == null) joinList.setStartDate("");
         else joinList.setStartDate(startDate);
         if(endDate == null) joinList.setEndDate("");
         else joinList.setEndDate(endDate);
         

         System.out.println("year : " + year + " month : " + month);
         System.out.println("startDate : " + joinList.getStartDate() + " endDate : " + joinList.getEndDate());
         System.out.println("searchKey : " +   searchKey + " searchValue : " + searchValue);
         System.out.println("productName :" + product_name);
         
         
         //맵에 검색값과 기간설정값을 저장한다
         Map<String, Object> map = new HashMap<String, Object>();
         map.put("year", year);
         map.put("month", month);
         map.put("searchKey", searchKey);
         map.put("searchValue", searchValue);
         map.put("startDate", joinList.getStartDate());
         map.put("endDate", joinList.getEndDate());
         map.put("product_name", product_name);

         //검색한 전체 개수를 가져온다
         int count = mapper.countSearchSales(map);
         System.out.println(count);

         //페이징을 위한 메소드 초기화
         //clientList 클래스의 1페이지 분량의 글을 기억하는 ArrayList에 1페이지 분량의 글을 테이블에서 얻어와서 넣어준다.
         joinList.initJoinList(pageSize, count, currentPage);

         //선언했던 map에 페이징을 위한 변수 startPage, pageSize를 더 넣어준다.
         map.put("startPage", joinList.getStartNo());
         map.put("pageSize", joinList.getPageSize());
         System.out.println("컨트롤러의 joinList메소드의 map값 : " + map);


         String orderby = request.getParameter("orderby"); 
         if(orderby == null) {
         orderby = "orderList_idx";
         }
         System.out.println(orderby);

         map.put("orderby", orderby);


         //전체 판매기록을 가져온다
         joinList.setJoinList(mapper.selectSearchSales(map));
         System.out.println(joinList);
         try {
            int totalSales = mapper.totalSales(map);
            System.out.println(totalSales);
            model.addAttribute("totalSales",totalSales);
         }catch (NullPointerException e) {
            System.out.println("totalSales Null");
         }
         System.out.println("joinList : "+joinList);
         
         model.addAttribute("count",count);
         model.addAttribute("joinList",joinList);
                  
         return "admin/salesCheck";
      }
      
//     재고관리 테이블
      @RequestMapping(value = "/stockTable")
      public String stockTable(HttpServletRequest request, Model model, ProductListVO productList) {
         System.out.println("***************stockTable() 메서드 시작****************");
         
         spsDAO mapper = adminSqlSession.getMapper(spsDAO.class);
         
         int pageSize = 10; // 보여줄 글의 개수
         int currentPage = 1;
         
         // view 에서 넘어오는 현재페이지 정보
         try {
            currentPage = Integer.parseInt(request.getParameter("currentPage")); 
         }
         catch (NumberFormatException e) { }
         
         // 검색값을 가져온다
         String searchKey = request.getParameter("searchKey");
         String searchValue = request.getParameter("searchValue");
         
         // 검색한 값을 화면에 유지하기위해 값을 보내놓는다.
         model.addAttribute("key", searchKey);
         model.addAttribute("value",searchValue);
         
         // 검색키가 없을 경우
         if (searchKey == null) productList.setSearchKey("product_idx");
         else productList.setSearchKey(searchKey);
         
         // 검색값이 없을 경우
         if (searchValue == null) productList.setSearchValue("");
         else productList.setSearchValue(searchValue);
         
         System.out.println("searchKey : " + productList.getSearchKey());
         System.out.println("searchValue : " + productList.getSearchValue());
         
         // mapper에서 검색값을 불러올 map을 만든다.      
         Map<String, Object> map = new HashMap<String, Object>();
         map.put("searchKey", productList.getSearchKey());
         map.put("searchValue", productList.getSearchValue());
         

         int totalCount = mapper.allCountProduct(map); // 글의 총 수량
         
//         페이지 초기화
         productList.initProductList(pageSize, totalCount, currentPage);
         
         //선언했던 map에 startPage,pageSize를 더 넣어준다.
         map.put("startPage", productList.getStartNo());
         map.put("pageSize", productList.getPageSize());
         System.out.println("startPage : " + productList.getStartNo());
         System.out.println("pageSize : " + productList.getPageSize());
         System.out.println("컨트롤러의 memberList메소드의 map값 : " + map);
         
         System.out.println("startPage : " + productList.getStartNo());
         
         productList.setProductList(mapper.selectProductList(map));
         System.out.println("컨트롤러의 memberList메소드의 map값 : " + map);
         System.out.println(currentPage);
         System.out.println("초기화 한 productList " + productList);
         
         System.out.println(totalCount);
         
         model.addAttribute("totalCount", totalCount);
         model.addAttribute("productList", productList); 
         
         System.out.println("***************stockTable() 메서드 끝****************");
         return "admin/stockTable";
      }
         
         // 재고 삭제
         @RequestMapping(value="/deleteOption")
         public String deleteOption(HttpServletRequest request,Model model,HttpServletResponse response) throws IOException {
            
            spsDAO mapper = adminSqlSession.getMapper(spsDAO.class);
            String product_idx = request.getParameter("product_idx"); 
            String stock_idx = request.getParameter("idx");
            mapper.delOption(stock_idx);
            mapper.optionUpdate(product_idx, product_idx);
            
            
            return "redirect:stockUpdate?idx="+product_idx;
         }
         
         // 관리자 모드 게시판 글 삭제
         @RequestMapping(value="/deleteP")
         public String deleteP(HttpServletRequest request,Model model,HttpServletResponse response) throws IOException {
            System.out.println("**************deleteP() 메서드 실행***************");

            // 매퍼생성
            spsDAO mapper = adminSqlSession.getMapper(spsDAO.class);
            
            // 삭제할 목록들의 product_idx를 배열에 세팅 
            String idxs = request.getParameter("idxs");
            String[] indexs = idxs.split("_");
            System.out.println(idxs);
            for (int i = 0; i < indexs.length; i++) {
               System.out.println(indexs[i]);
            }
            
            System.out.println(indexs.length);
            
            for(int i = 0; i < indexs.length; i++) {
               if(indexs[i] != "" && indexs[i] != null) {
                  // product_idx를 인자로 넘겨 실행
                  mapper.deleteP(Integer.parseInt(indexs[i]));
               }
            }
            
            // 완료후 alert 띄어주기
            model.addAttribute("delete_msg","제품 글 삭제가 완료되었습니다.");
            
            System.out.println("***************deleteP() 메서드 끝****************");
            
            return "admin/stockTable";
         }
         

         ArrayList<StockVO> stockArray = new ArrayList<StockVO>();
         @RequestMapping("/stockUpdate")
         public String stockUpdate(HttpServletRequest request, Model model) {
            System.out.println("***************stockUpdate() 메서드 시작****************");
            
            spsDAO mapper = adminSqlSession.getMapper(spsDAO.class);
            
            // 삭제할 목록들의 product_idx를 배열에 세팅 
            String idx = request.getParameter("idx");
            
//            vo 객체 안에 product_idx에 따른 삭제할 목록 하나를 저장한다.
            ProductVO vo = mapper.pickProduct(Integer.parseInt(idx));
            stockArray = mapper.pickProductOption(Integer.parseInt(idx));

//            stockUpdate.jsp에 idx와 vo를 넘겨준다.
            model.addAttribute("idx", idx);
            model.addAttribute("vo", vo);
            model.addAttribute("stockArray", stockArray);
            
            return "admin/stockUpdate";
         }
         
         @RequestMapping("/stockUpdateOK")
         public String stockUpdateOK(HttpServletRequest request, Model model) {
            System.out.println("***************stockUpdateOK() 메서드 시작****************");
            
            spsDAO mapper = adminSqlSession.getMapper(spsDAO.class);
            
//            stockUpdate.jsp에서 수정한 정보들을 받아와 변수에 저장한다.
            int product_idx = Integer.parseInt(request.getParameter("product_idx"));
            String product_name = request.getParameter("product_name");
            int product_price = Integer.parseInt(request.getParameter("product_price"));
            int product_category = Integer.parseInt(request.getParameter("product_category"));
            int product_stock = Integer.parseInt(request.getParameter("product_stock"));
            for (int i = 0; i < stockArray.size(); i++) {
               int stock_idx = stockArray.get(i).getStock_idx();
               String stock_size = request.getParameter(stock_idx+"/stock_size");
               String stock_color = request.getParameter(stock_idx+"/stock_color");
               String stock_stock = request.getParameter(stock_idx+"/stock_stock");
               System.out.println("수정할 내용 : " + stock_size+stock_color+stock_stock);
               mapper.stockTableUpdate(stock_stock, String.valueOf(stock_idx),stock_size, stock_color);
            }
            
//            vo 객체에 수정한 내용들을 저장하기
            ProductVO vo = new ProductVO();
            vo.setProduct_idx(product_idx);
            vo.setProduct_name(product_name);
            vo.setProduct_price(product_price);
            vo.setProduct_category(product_category);
            
//            저장 내용들을 테이블에서 수정시키기
            mapper.stockUpdate(vo);
            
//            수정 완료 시 메시지 띄우기
            model.addAttribute("update_msg", "제품 글 수정이 완료되었습니다.");
            
            System.out.println("***************stockUpdateOK() 메서드 끝****************");
            return "admin/stockTable";
         }
         
        //2020-06-04 혜인 추가
		//관리자 memberList.jsp에서 관리자 지정/해제 설정하는 매퍼 생성
		@RequestMapping("/adminMember")
		public String adminMember(HttpServletRequest request, Model model) {
			System.out.println("***************adminMember() 메서드 시작****************");
			
			spsDAO mapper = adminSqlSession.getMapper(spsDAO.class);
			String value = request.getParameter("value");
			String[] chkNums = request.getParameter("chkNums").split("_");
			
			for(int i=0;i<chkNums.length;i++) {
				if(value.equals("1")) {
					mapper.adminMemberUpdate(chkNums[i]);
				}else {
					mapper.adminMemberDelete(chkNums[i]);
				}
			}

			System.out.println("***************adminMember() 메서드 끝****************");
			return "redirect:memberList";
		}
      
   
}