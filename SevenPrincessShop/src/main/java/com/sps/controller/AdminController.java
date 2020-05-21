package com.sps.controller;

import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Locale;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.sps.dao.spsDAO;
import com.sps.vo.AboardVO;
import com.sps.vo.ClientListVO;
import com.sps.vo.JoinListVO;
import com.sps.vo.JoinVO;
import com.sps.vo.ProductVO;
import com.sps.vo.Qboard;
import com.sps.vo.QboardList;


// 관리자 기능을 담을 컨트롤러에요
@Controller
public class AdminController {
	
	@Autowired
	public SqlSession adminSqlSession;
	
	
	
	//관리자 메인 테스트
	@RequestMapping(value = "/admin")
	public String memberMain(Locale locale, Model model) {	
		return "admin/adminMain";
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
	
	
	
	
	//	CHECK! 05-18 
	//	전송버튼 좀만 우측으로(폼이랑 겹침)
	//	조회 조건 변경시(select)돌아오면 기존 select 값 유지 x > 수정 가능하시면 해주시면 감사하겠습니당
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
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
//	CHECK! 05-18
//	탐색기능 다 잘 작동 > orderList 테이블 접근자들이랑 status 상의해서 확실히 맞추기 



	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
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
if(orderby == null) {
orderby = "orderList_idx";
}
System.out.println(orderby);

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
			if(i < 10) {	//날짜 월의 1-9까지 앞에 0을 붙여주기 위한 조건문
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
	
	

	
	
	///////////////////////////////////////////////////////작업중..
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
		System.out.println("searchKey : " +   searchKey);
		System.out.println("searchValue : " + searchValue);
		
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
		
		
		String orderby = request.getParameter("orderby"); 
		if(orderby == null) {
			orderby = "orderList_idx";
		}
		System.out.println(orderby);
		
		map.put("orderby", orderby);
		
		
		//전체 판매기록을 가져온다
		joinList.setJoinList(mapper.payOKTable(map));
		System.out.println(joinList);
		
		//salesTable에 판매건수와 가져온 판매기록을 넘겨준다.
		model.addAttribute("count",count);
		model.addAttribute("joinList",joinList);
		
		
		return "admin/payOKTable";
	}








	
	
//	CHECK! 05-18
//	기능은 다 정상!    기간 검색 기가 막힘

//	판매상태 업데이트 버튼 해주실 수 있으십니까.
//		> status가 payOK 면 확인 버튼을 눌러 상품 준비중이라는 status 로 업데이트
//		   상품준비중인 상품에 대해 send 버튼을 눌러 status 상태를 발송완료 로 업데이트

	
//	매출조회 기능 추가하면 진짜 멋질텐데 다른거로도 바쁘니 무리해선 하지말고 짬짬히 추후에라도 해주실 수 있으시면..부탁 드립니당
//	ex) 당일, 월별, 년별, 총매출 
//		회원별 검색시 회원별 총 구매금액 
//		제품명 조건 검색시 당 제품의 총 판매액 등등
	
	
	
	
	
	

	


	
	
	
	
	
	
	
//	@RequestMapping(value = "/ajax")
//	public String ajax(HttpServletRequest request, HttpServletResponse response, Model model) {
//		response.setContentType("text/html; charset=UTF-8");
//		spsDAO mapper = adminSqlSession.getMapper(spsDAO.class);
//
//		String name = request.getParameter("name");
////		요청한 곳으로 처리한 데이터를 리턴한다. => ajax로 서블릿을 호출한 쪽에서 responseText를 사용해서 받는다.
//		try {
//			response.getWriter().write(getJSON(name));
//		} catch (IOException e) {
//			System.out.println("IOException");
//			e.printStackTrace();
//		}
//		
//		
//		return "admin/ajax";
//	}
//	
//	
//	public String getJSON(String name) {
//		spsDAO mapper = adminSqlSession.getMapper(spsDAO.class);
//		if(name == null) {
//			name = "";
//		}
//		
//		//테이블에서 입력한 문자열이 이름에 포함된 레코드를 얻어온다.
//		ArrayList<ClientVO> clientList = mapper.search(name);
//		System.out.println(name);
//		System.out.println(clientList);
//		
//		//입력된 문자열이 포함된 레코드를 얻어와서 하나의 문자열로 연결한다.
//		StringBuffer result = new StringBuffer();
//		result.append("{\"result\":[");
//		for (int i = 0; i < clientList.size(); i++) {
//			result.append("[{\"value\":\"" + clientList.get(i).getClient_idx() + "\"},");
//			result.append("{\"value\":\"" + clientList.get(i).getClient_id() + "\"},");
//			result.append("{\"value\":\"" + clientList.get(i).getClient_name() + "\"},");
//			result.append("{\"value\":\"" + clientList.get(i).getClient_birthday() + "\"},");
//			result.append("{\"value\":\"" + clientList.get(i).getClient_email() + "\"}],");
//		}
//		result.append("]}");
//		//System.out.println(result);
//		
//		//StringBuffer 타입의 객체를 String 타입으로 리턴시키기 위해 toString() 메소드를 실행해서 리턴시킨다.
//		return result.toString();
//		
//	}
	
	
	
	
	//=================================05/20 혜인===============================


	
	//관리자 모드 게시판 관리 목록 view(+리스트 받아와서 뿌리기)
		@RequestMapping(value="/allBoard")
		public String allBoard(HttpServletRequest request, Model model) {
			
			System.out.println("*************allBoard() 메서드 실행**************");
			
			// 매퍼생성
			spsDAO mapper = adminSqlSession.getMapper(spsDAO.class);
			
			int pageSize = 10;									// 보여줄 글의 개수
			int totalCount = mapper.allCountQ(); 				// 글의 총 수량
			int currentPage = 1;								// view 에서 넘어오는 현재페이지 정보
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
	
	
	
}
