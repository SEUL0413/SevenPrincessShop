package com.sps.dao;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import com.sps.vo.AboardVO;
import com.sps.vo.ClientVO;
import com.sps.vo.JoinVO;
import com.sps.vo.OrderListVO;
import com.sps.vo.ProductVO;
import com.sps.vo.Qboard;
import com.sps.vo.ReviewVO;
import com.sps.vo.StockVO;

public interface spsDAO {

   
   
   
   
   
   
   
// 찬호 05.25//////////////////////////////////
   ClientVO selectById(String client_id);
   
   void insertMember(ClientVO clientVO);

   int countMember();

   ClientVO selectMember(int count);
   
   int isMember(String id);

   int isMemberByPhoneNumber(String phoneNumber);

   String findId(String name, String phoneNumber);

   void changePwd(String newPw, String client_id);

   int findPwCount(String id, String email);

// 찬호 05.25//////////////////////////////////


   
   
   
   
   
   
   

   //판매건수
   Integer countSales(Map<String, Object> map);
   //판매목록
   List<JoinVO> selectSales(Map<String, Object> map);

   //회원 수
   int countClient(Map<String, Object> map);
   //회원목록
   ArrayList<ClientVO> selectClientList(Map<String, Object> map);
   //해당 회원의 주문 내역 
   List<JoinVO> selectOrderList(int client_idx);
   

   //월별 판매 완료 건수
   int monthSalesCount(String date);
   //월별 판매 취소 건수
   int monthCancelCount(String date);
   //월별 판매 금액
   Integer monthSalesPrice(String date);
   //베스트 아이템(전체 조회수로만 검색)
   ArrayList<ProductVO> monthBestItem();


   //결제완료 건수 
   int countSalesPayOK(Map<String, Object> map);
   //판매관리 테이블
   List<JoinVO> payOKTable(Map<String, Object> map);
   //판매 업데이트 (PayOK=>send로 업데이트)
   void updateStatus(String orderList_idx);
   
   //product_index 1씩 증가 시키기위한 update쿼리
   void updateProductIndex(int product_category);
   //product_index 가져오기
   Integer productIndex(int product_category);
   //product테이블 insert
   void insertProduct(ProductVO productVO);
   //product_idx 최근값 가져오기
   Integer getProductIdx();
   //stock테이블 insert
   void insertStock(StockVO stockVO);
//   stock 테이블 수정
   void stockTableUpdate(String stock_stock, String stock_product_idx, String stock_size, String stock_color);
//   옵션 가지고 오기
   ArrayList<StockVO> pickProductOption(int stock_product_idx);
   
   
   
   
   Integer countSearchSales(Map<String, Object> map);

   List<JoinVO> selectSearchSales(Map<String, Object> map);

   Integer totalSales(Map<String, Object> map);

   List<ClientVO> testclient();

   

   //=========================05/20 혜인==========================================
   
   //회원 수정 => DB에 정보 업데이트
   void updateMember(ClientVO clientVO);
   
   //회원 삭제 => DB에 정보 삭제
   void deleteMember(String client_id);
   
   //장바구니 목록  출력(OrderListVO) => 주문 사이즈+색상+개수
   ArrayList<OrderListVO> cartListO(int orderlist_client_idx);
   
   //장바구니 목록 출력(ProductVO) =>상품명, 이미지 경로, 가격
   ProductVO cartListP(int product_idx);
   
   //장바구니 삭제
   void deleteCart(int orderList_idx);
   
   //장바구니 수량 변경
   void updateStock(int orderList_stock,int orderList_idx);

   //장바구니 전체 주문 status 변경
   void allStatus(int orderList_client_idx);
   
   //장바구니 선택 주문 status 변경 
   void selectStatus(int orderList_idx);
   
   //주문 목록 출력(OrderListVO)
   ArrayList<OrderListVO> myOrderO(int orderlist_client_idx);
   
   //주문 목록 : 리뷰 작성 완료된 글인지 체크
   int reviewCheck(int orderList_idx);
   
   //주문 상세 페이지 : 주문 idx를 이용한 orderListVO출력
   OrderListVO selectOrderVO(int orderList_idx);
   
   //주문 취소 : status 수정(payOK => cxl)
   void updateCxl(int orderList_idx);

   //1대1문의 : q보드의 총 개수 
   int countQboard(int client_idx);
   
   //1대1문의 : 리스트 한페이지 분량 출력 
   ArrayList<Qboard> selectQboard(int qboard_client_idx,int startNo,int endNo);

   //1대1문의 : 답변/미답변 체크
   int boardChk(int qboard_idx);

   //1대1문의 : 답변테이블 추출
   ArrayList<AboardVO> selectAboard(int client_idx);
   
   //1대1문의 : 질문 글쓰기 
   void insertQ(Qboard qboard);

   //리뷰관리 : 아직 리뷰 작성 안된 주문정보 출력
   ArrayList<OrderListVO> reviewOrder(int idx);

   //리뷰관리 : 아직 리뷰 작성 안된 상품정보 출력
   ProductVO reviewProduct(int idx);

   //리뷰관리 : 작성된 리뷰 출력
   ArrayList<ReviewVO> selectReview(int client_idx);

   //리뷰관리 : 작성한 리뷰 insert
   void insertReview(ReviewVO reviewVO);
   
   //관리자 모드 : Q보드의 총 개수 출력
   int allCountQ();
   
   //관리자 모드 : Q(질문)의 한 페이지 분량 출력
   ArrayList<Qboard> allSelectQ(int startNo,int endNo);

   //관리자 모드 : 답변 테이블 추출
   ArrayList<AboardVO> allSelectA();

   //관리자 모드 : 오늘 날짜로 생성된 질문글 개수 체크
   int dateCount(String date);

   //관리자 모드 : 답변글 aboard에 insert
   void insertAnswer(AboardVO vo);

   //관리자 모드 : QnA 게시판 글 삭제
   void deleteQ(int qboard_idx);

   
   
   //=================05/20 혜인 끝======================================
   
   
   //====================유졍==========================
//  유정 상품 사이즈 가져오기
   ArrayList<String> getSize(String product_idx);

//  유정 상품 색상 가져오기
   ArrayList<String> getColor(String product_idx);

//  유정 상품 재고 가져오기
   ArrayList<String> getStock(String product_idx);
   
//  유정 상품정보가져오기
   ProductVO getProductInfo(String product_idx);

//  유정 카트에 정보 담기
   void insertCart(String orderList_client_idx, String orderList_product_idx, String orderList_size,
         String orderList_color, String orderList_stock, String orderList_orderDate);

//   찬호 옵션 찾기
   ArrayList<String> findOption(String product_idx, String size);
   
//   찬호 옵션 재고 찾기
   String findOptionStock(String product_idx, String size, String stock_stock);

//    유정 리뷰 개수 가져오기
   int selectCount(String product_idx);

//  유정 글목록 가져오기
   ArrayList<ReviewVO> selectList(int product_idx, int startNo);
   //====================유졍==========================



// 명훈 추가 05.25////////////////////////////////////////////
   
//   홈페이지 메인 
   ArrayList<ProductVO> getPList(String cNum);         // 카테고리를 클릭하면 나오는 페이지(showCategory.jsp)에 데이터를 넘겨줄 메소드
   ArrayList<String> getSize(int product_idx);
   ArrayList<String> getColor(int product_idx);
   ProductVO getProductInfo(int product_idx);
   int increment(int product_idx);

   ArrayList<ProductVO> bestListDescByIdx();
   ArrayList<ProductVO> topListDescByIdx();
   ArrayList<ProductVO> bottomListDescByIdx();
   ArrayList<ProductVO> onePieceListDescByIdx();
   ArrayList<ProductVO> outerListDescByIdx();
   ArrayList<ProductVO> acsListDescByIdx();
   
   int selectBestCount();
   int selectTopCount();
   int selectBottomCount();
   int selectOnePieceCount();
   int selectOuterCount();
   int selectAcsCount();

   int selectCategory(String categoryNum); // nav에서 얻어온 categoryNum에 따른 product_category 얻어오기
   
   int increment(String product_idx);
   
// 명훈 추가 05.25////////////////////////////////////////////


//   동호 DAO  ////////////////////////////////////////////////
      
// 바로구매 정보 가져오기
   ArrayList<OrderListVO> cartListdPay(int orderlist_client_idx);
   ArrayList<OrderListVO> cartListPay(String orderlist_client_idx);


// stock 개수 내리기
   void stockSell(String stock_stock, String product_idx, String stock_size, String stock_color);

//   전제 stock 수정
   void productUpdate(String product_idx, String product_idx2);

// 주문정보 가져오기
   ArrayList<OrderListVO> cartListPayYet(String orderlist_client_idx);

// status payOK로 변경
   void allStatus(String string, String orderlist_orderDate, String clinet_address, String clinet_detailAddress,
         String clinet_addressNumber, String client_idx);


   // 바로 구매 정보 넘겨주고 stock 구매완료(payOK)로 설정
   void dPayInsertOrderList(String orderlist_client_idx, String orderList_product_idx, String orderList_address,
         String orderList_detailAddress, String orderList_addressNumber, String orderList_size,
         String orderList_color, String orderList_stock, String orderList_orderDate);

   void dPayInsertOrderList(ClientVO vo);


//   옵션별 stock 구하기
   int getTableStock(String product_idx, String stock_size, String stock_color);

   

   

// 동호 /////////////////////////////////////////////////////////////////////////////////////////////////////////////////
   
   int allCountProduct(Map<String, Object> map);   // 글의 총 수량

   ArrayList<ProductVO> selectProduct();         // 재고 관리 글들을 불러오는 메소드

   ArrayList<ProductVO> selectProductList(Map<String, Object> map); // 

   void deleteP(int parseInt); // 재고 게시글을 삭제하는 메소드

   void stockUpdate(ProductVO vo); // 재고 게시글을 수정하는 메소드
   
   ProductVO pickProduct(int product_idx); // 수정하길 원하는 재고 게시글을 불러오는 메소드

   void delOption(String stock_idx);

//   관리자 전체 옵션 수량 수정
   void optionUpdate(String product_idx, String product_idx2);

   
   //memberList 화면 =>  관리자 지정 update문
 	void adminMemberUpdate(String client_idx);

 	//memberList 화면 =>  관리자 해제 delete문
 	void adminMemberDelete(String client_idx);

 	//동호 추가 : ready -> cart 변경
	void backCart();


}