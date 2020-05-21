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

public interface spsDAO {

	ClientVO selectById(String client_id);
	
	void insertMember(ClientVO clientVO);

	int countMember();

	ClientVO selectMember();

	ClientVO selectMember(int count);



	
	
	
	
	
	
	
	
	//판매 목록
//	List<JoinVO> selectSales(Map<String, String> map);
//	Integer countSales(Map<String, String> map);
	
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
//  유정 바로결제에 정보 담기
   void insertdPay(String orderList_client_idx, String orderList_product_idx, String orderList_size,
         String orderList_color, String orderList_stock, String orderList_orderDate);

//   찬호 옵션 찾기
   ArrayList<String> findOption(String product_idx, String size);
   
//	찬호 옵션 재고 찾기
   String findOptionStock(String product_idx, String size, String stock_stock);

// 	유정 리뷰 개수 가져오기
   int selectCount(String product_idx);

//  유정 글목록 가져오기
   ArrayList<ReviewVO> selectList(int product_idx, int startNo);
	//====================유졍==========================



}
