package com.sps.controller;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

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
import com.sps.vo.ClientVO;
import com.sps.vo.OrderListVO;
import com.sps.vo.ProductVO;
import com.sps.vo.Qboard;
import com.sps.vo.QboardList;
import com.sps.vo.ReviewVO;

@Controller
public class MemberController {
	
@Autowired
SqlSession memberSqlSession;
	

  	//파입 업로드 경로 지정
	@Resource(name="uploadPath")
	private String uploadPath;

	
	@RequestMapping(value="/login")
	public String login(HttpServletRequest request, Model model) {
		
		return "member/login";
	}
	
	
	@RequestMapping(value="/loginCheck")
	public String loginCheck(HttpSession session,HttpServletRequest request, Model model) {
		
		System.out.println(request.getParameter("client_id"));
		
		String client_id = request.getParameter("client_id");
		String client_pw = request.getParameter("client_pw");
		
		System.out.println(client_id+client_pw);
		System.out.println(memberSqlSession);
		spsDAO mapper = memberSqlSession.getMapper(spsDAO.class);
		
		ClientVO user = mapper.selectById(client_id);
		
		session.setAttribute("nowUser", user);
		
		
	return "shop/index";
	}
	
	
	
	@RequestMapping(value="/myPage")
	public String myPage(HttpSession session, HttpServletRequest request, Model model) {
		
		if(session.getAttribute("nowUser")==null) {
			System.out.println("로그인 xx 일때 못오게 작업하셈");
			return "shop/index";
		}
		else {
			return "member/myPage";
		}
	}
	
		//회원 수정 비밀번호 확인 화면
		@RequestMapping(value = "/pwCheck")
		public String pwCheck(HttpServletRequest request, Model model) {
			return "member/pwCheck";
		}
		
		//비밀번호 확인 후 일치하는지 확인
		@RequestMapping(value = "/editChk")
		public String editChk(HttpSession session,HttpServletRequest request, Model model) {
			
			System.out.println("******************editChk 메서드 실행*****************");
			
			//현재 유저 비밀번호
			ClientVO vo = (ClientVO) session.getAttribute("nowUser");
			String user_pw = vo.getClient_password();
			//입력한 비밀번호
			String enter_pw = request.getParameter("editPW");

			
			if(user_pw.equals(enter_pw)) {
				System.out.println("******************editChk 메서드 끝!!*****************");
				return "redirect:viewMember";
			}else {
				model.addAttribute("error","비밀번호가 일치하지 않습니다.");
				return "member/pwCheck";
			}
		}
		
		//회원 수정 화면
		@RequestMapping(value = "/viewMember")
		public String viewMember(HttpSession session,HttpServletRequest request, Model model) {
			//infoEdit.jsp 에서 바로 nowUser 적용시 정보 업데이트가 안됨!
			ClientVO vo = (ClientVO) session.getAttribute("nowUser");
			model.addAttribute("vo",vo);
			return "member/infoEdit";
		}
		
		//회원정보 수정 작업
		@RequestMapping(value = "/updateMember")
		public String updateMember(HttpSession session,HttpServletRequest request, Model model) {
			
			System.out.println("******************updateMember 메서드 실행!!*****************");
			//현재 접속해있는 유저 vo => 수정한 데이터를 set해주기
			ClientVO vo = (ClientVO) session.getAttribute("nowUser");
			
			//1.입력받은 새 비밀번호
			String enter_pw = request.getParameter("client_password");
	
			//비밀번호 변경 입력시 해당 비밀번호로 세팅
			if(enter_pw!=null && enter_pw!="") {
				vo.setClient_password(enter_pw);
			}
			
			//연락처와 이메일 vo에 전체 연결해 세팅해주기 
			//2.연락처
			String phone1 = request.getParameter("phone1");
			String phone2 = request.getParameter("phone2");
			String phone3 = request.getParameter("phone3");
			vo.setClient_phoneNumber(phone1+phone2+phone3);
			
			//3.이메일
			String email1 = request.getParameter("email1");
			String email2 = request.getParameter("email2");
			vo.setClient_email(email1+"@"+email2);
			
			//4-5.나머지 정보(이름+주소) 세팅
			vo.setClient_name(request.getParameter("client_name"));
			vo.setClient_address(request.getParameter("client_address"));
		
			spsDAO mapper = memberSqlSession.getMapper(spsDAO.class);
			mapper.updateMember(vo);
			
			System.out.println(vo);
			
			//업데이트 되는 vo의 정보를 session에 재저장
			session.setAttribute("nowUser", vo);
			
			System.out.println("******************updateMember 메서드 끝!!*****************");
			return "member/myPage";
		}
		
		//회원 삭제 화면 
		@RequestMapping(value = "/infoDel")
		public String infoDel(HttpServletRequest request, Model model) {
			
			return "member/infoDel";
		}
		
		
		//회원 삭제 비밀번호 체크
		@RequestMapping(value = "/delChk")
		public String delChk(HttpSession session,HttpServletRequest request, Model model) {
			
			System.out.println("******************delChk 메서드 실행*****************");

			//현재 유저 비밀번호
			ClientVO vo = (ClientVO) session.getAttribute("nowUser");
			String user_pw = vo.getClient_password();
			//입력한 비밀번호
			String enter_pw = request.getParameter("password");	
			
			
			//비밀번호 일치 여부 체크 후 메세지 띄어주기
			if(user_pw.equals(enter_pw)) {
				model.addAttribute("confirm","정말로 탈퇴하시겠습니까?");
			}else {
				model.addAttribute("error","비밀번호가 일치하지 않습니다.");
			}
			
			System.out.println("******************delChk 메서드 끝!!*****************");
			return "member/infoDel";
			
			
		}
		
		//회원정보 삭제
		@RequestMapping(value = "/deleteMember")
		public String deleteMember(HttpSession session,HttpServletRequest request, Model model) {
			
			System.out.println("******************deleteMember 메서드 실행*****************");
			//현재 유저 아이디
			ClientVO vo = (ClientVO) session.getAttribute("nowUser");
			String client_id = vo.getClient_id();
			
			spsDAO mapper = memberSqlSession.getMapper(spsDAO.class);
			mapper.deleteMember(client_id);
			System.out.println("******************deleteMember 메서드 끝!!*****************");
			
			return "member/myPage"; //로그아웃 상태로 전환하기!!!
		}
		
	
		//장바구니 보기 화면
		@RequestMapping(value = "/cartView")
		public String cartView(HttpSession session,HttpServletRequest request, Model model) {
			
			ArrayList<OrderListVO> cartListO;
			ArrayList<ProductVO> cartListP;
			
			System.out.println("******************cartView 메서드 실행*****************");
			//현재 유저 VO
			ClientVO vo = (ClientVO) session.getAttribute("nowUser");
			//현재 유저 idx
			int orderlist_client_idx = vo.getClient_idx();
		
			spsDAO mapper = memberSqlSession.getMapper(spsDAO.class);
			
			//orderListVO 정보들 리스트에 담아오기
			cartListO = mapper.cartListO(orderlist_client_idx);
			
			
			//위에 VO에서 product_idx 가져와 ProductVO 정보 리스트에 담아오기
			cartListP = new ArrayList<ProductVO>();
			for(int i=0;i<cartListO.size();i++) {
				int product_idx = cartListO.get(i).getOrderList_product_idx();
				cartListP.add(mapper.cartListP(product_idx));
			}
			
			model.addAttribute("listO",cartListO); //사이즈,색상,개수
			model.addAttribute("listP",cartListP); //상품이름,상품 이미지, 상품 가격
			
			System.out.println("******************cartView 메서드 끝*****************");
			return "member/cartView";
		}
		
		
		
		//장바구니 삭제
		@RequestMapping(value = "/deleteCart")
		public String deleteCart(HttpServletRequest request, Model model) {
			System.out.println("******************deleteCart 메서드 실행*****************");
			spsDAO mapper = memberSqlSession.getMapper(spsDAO.class);

			String cartNums = request.getParameter("cartNums");

			String[] carts = cartNums.split("_");
			
			for(int i=0;i<carts.length;i++) {
				if(carts[i]!="" && carts[i]!=null) {
					//장바구니 idx 인자로 넘겨 실행
					mapper.deleteCart(Integer.parseInt(carts[i])); 
				}
			}
			System.out.println("******************deleteCart 메서드 끝*****************");
			
			return "redirect:cartView";
		}
		
		//장바구니 주문 수량 변경
		@RequestMapping(value = "/updateStock")
		public String updateStock(HttpServletRequest request, Model model) {
			System.out.println("******************stockChange 메서드 실행*****************");
			spsDAO mapper = memberSqlSession.getMapper(spsDAO.class);

			//변경할 주문리스트 idx
			int idx = Integer.parseInt(request.getParameter("idx"));
			//변경할 주문 개수
			int re_stock = Integer.parseInt(request.getParameter("re_stock"));
			
			mapper.updateStock(re_stock,idx);
			System.out.println("******************stockChange 메서드 끝*****************");
			
			return "redirect:cartView";
		}
		
		
		//장바구니 주문 status 변경
		@RequestMapping(value = "/updateStatus")
		public String updateStatus(HttpSession session,HttpServletRequest request, Model model) {
			
			System.out.println("******************updateStatus 메서드 실행*****************");
			//현재 유저 VO
			ClientVO vo = (ClientVO) session.getAttribute("nowUser");
			//현재 유저 idx
			int client_idx = vo.getClient_idx();
			
			spsDAO mapper = memberSqlSession.getMapper(spsDAO.class);
			
			String idxs = request.getParameter("idxs");
			if(idxs.equals("all")) {  						//전체 주문일때
				System.out.println(client_idx);
				mapper.allStatus(client_idx);
			}else {                                         //선택 주문일때
				String[] indexs = idxs.split("_");
				
				for(int i=0;i<indexs.length;i++) {
					if(indexs[i]!="" && indexs[i]!=null) {
						//장바구니 idx 인자로 넘겨 실행
						mapper.selectStatus(Integer.parseInt(indexs[i])); 
					}
				}
			}
			System.out.println("******************updateStatus 메서드 끝*****************");
			
			return "redirect:cartView"; 
		}
		
		
		//주문 목록 view(orderList_status 가 cart,ready가 아닌 데이터만 추출) 
		@RequestMapping(value = "/myOrderView")
		public String myOrderView(HttpSession session,HttpServletRequest request, Model model) {
			
			System.out.println("******************myOrderView 메서드 실행*****************");
			spsDAO mapper = memberSqlSession.getMapper(spsDAO.class);
			
			
			ArrayList<OrderListVO> listO; //주문목록 (orderList)
			ArrayList<ProductVO> listP;   //주문목록 (product)
			ArrayList<Integer> counts;     //리뷰가 작성된 글인지 판단할 변수
			
			//현재 유저 idx
			ClientVO vo = (ClientVO) session.getAttribute("nowUser");
			int client_idx = vo.getClient_idx();
			
			//초기화
			listO = mapper.myOrderO(client_idx);
			listP = new ArrayList<ProductVO>();
			counts = new ArrayList<Integer>();
			
			for(int i=0;i<listO.size();i++) {
				int product_idx = listO.get(i).getOrderList_product_idx();
				listP.add(mapper.cartListP(product_idx));
				//리뷰 체크 : 리턴값이 0이면 미작성 / 리턴값이 1이면 작성완료
				counts.add(mapper.reviewCheck(listO.get(i).getOrderList_idx()));
				System.out.println(listO.get(i).getOrderList_idx() + " , "+mapper.reviewCheck(listO.get(i).getOrderList_idx()));
			}
			
			model.addAttribute("listO",listO);
			model.addAttribute("listP",listP);
			model.addAttribute("counts",counts);
			
			System.out.println("******************myOrderView 메서드 끝*****************");
			return "member/myOrderView";
		}
		
		//주문 상세목록 view 
		@RequestMapping(value = "/orderContentView")
		public String orderContentView(HttpSession session,HttpServletRequest request, Model model) {
			
			System.out.println("******************orderContentView 메서드 실행*****************");
			spsDAO mapper = memberSqlSession.getMapper(spsDAO.class);
			
			int idx = Integer.parseInt(request.getParameter("idx")); //상세 view 출력할 orderList_idx
			//상세 출력할 정보를 담은 OrderListVO 받아오기
			OrderListVO orderVO = mapper.selectOrderVO(idx); 
			ProductVO productVO = mapper.cartListP(orderVO.getOrderList_product_idx());
			int count = mapper.reviewCheck(idx);
					
			model.addAttribute("orderVO",orderVO);
			model.addAttribute("productVO",productVO);
			model.addAttribute("count",count);
			
			System.out.println("******************orderContentView 메서드 끝*****************");
			return "member/orderContentView";
		}
		
		//주문 취소 : status 수정(payOK => cxl)
		@RequestMapping(value = "/updateCxl")
		public String updateCxl(HttpSession session,HttpServletRequest request, Model model) {
			
			System.out.println("******************updateCxl 메서드 실행*****************");
			spsDAO mapper = memberSqlSession.getMapper(spsDAO.class);
			
			int orderList_idx = Integer.parseInt(request.getParameter("idx"));
			mapper.updateCxl(orderList_idx);
			
			System.out.println("******************updateCxl 메서드 끝*****************");
			return "redirect:myOrderView";
		}
		
		
		//request : currentPage
		//1대1문의 창 (+리스트 출력)
		@RequestMapping(value = "/qnaBoard")
		public String qnaBoard(HttpSession session,HttpServletRequest request, Model model) {
			
			System.out.println("******************qnaBoard 메서드 실행*****************");
			
			// 매퍼생성
			spsDAO mapper = memberSqlSession.getMapper(spsDAO.class);
			
			//현재 유저 VO
			ClientVO vo = (ClientVO) session.getAttribute("nowUser");
			//현재 유저 idx
			int client_idx = vo.getClient_idx();
			
			int pageSize = 10;									// 보여줄 글의 개수
			int totalCount = mapper.countQboard(client_idx); 	// totalCount는 보여줄 글의 총 수량을 알려주자!!
			int currentPage = 1;								// 얘는 view 에서 넘어오는 현재페이지 정보를 주지스님!!!
			try {
				currentPage = Integer.parseInt(request.getParameter("currentPage")); //그게 이거야!!!
			} 
			catch (NumberFormatException e) { }
			
			
			// 리스트를 만들고 저~~~위에 있는 3 놈을 인자로 하여 생성하고 카큘레이터 메소드로 나머지 멤버를 초기화 시켜줌
			QboardList qboardList = new QboardList();					
			qboardList.initQboardList(pageSize, totalCount, currentPage);
					
			//현재 유저 idx 와 게시판에 뿌려줄 startNo, endNo 넘겨주기
			qboardList.setQBoardList(mapper.selectQboard(client_idx,qboardList.getStartNo(),pageSize));
			
			System.out.println(totalCount);
			//qBoardVO들이 담겨질 arrayList
			ArrayList<Qboard> lists = qboardList.getQBoardList();
			
			//답변 상태 뿌려주기 위한 qboard_idx 값 받아오기
			//aboard 테이블에 있는 qboard_idx는 답변완료 / 없는 idx는 답변 대기
			ArrayList<String> answer = new ArrayList<String>();
			for(Qboard list : lists) {
				if(mapper.boardChk(list.getQboard_idx())==0) {
					answer.add("답변대기");
				}else {
					answer.add("답변완료");
				}
			}
			
			//현재 접속 유저가 올린 질문글에 해당하는 답변들 추출
			ArrayList<AboardVO> aboardList =  mapper.selectAboard(client_idx);
			
			model.addAttribute("aboardList", aboardList); 
			model.addAttribute("qboardList", lists); 
			model.addAttribute("info", qboardList); 
			model.addAttribute("answer", answer); 
			
			System.out.println("******************qnaBoard 메서드 끝*****************");
			
			return "member/qnaBoard";
		}
		
		//1:1 문의 게시판 글쓰기 view
		@RequestMapping(value = "/qnaInsert")
		public String qnaInsert(HttpServletRequest request, Model model) {
			
			return "member/qnaInsert";
		}
		
		//1:1 문의 Qboard 글쓰기 내용 DB에 insert하기 
		@RequestMapping(value = "/insertQ")
		public String insertQ(HttpSession session,HttpServletRequest request, Model model) {
			
			System.out.println("******************insertQ 메서드 실행*****************");
			
			//매퍼 생성
			spsDAO mapper = memberSqlSession.getMapper(spsDAO.class);
			
			ClientVO vo = (ClientVO)session.getAttribute("nowUser"); //1.고객 idx(=유저 idx)
			int idx = vo.getClient_idx();
			
			String content = request.getParameter("content"); //2.내용
	
			String title = request.getParameter("title"); //3.제목
			String type = request.getParameter("type"); //4.질문 유형
			Date date = new Date();
			SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm"); //5.질문 날짜
			
			Qboard board = new Qboard();
			board.setQboard_client_idx(idx);
			board.setQboard_content(content);
			board.setQboard_title(title);
			board.setQboard_type(type);
			board.setQboard_date(sdf.format(date)); 
		
			mapper.insertQ(board);
			System.out.println("******************insertQ 메서드 끝*****************");
			return "redirect:qnaBoard";
		}
		
		//리뷰 관리 : 구매후기 쓰기 (현재 리뷰가 쓰이지 않은 상품 리스트 출력)
		@RequestMapping(value = "/addReview")
		public String addReview(HttpSession session,HttpServletRequest request, Model model) {
			
			System.out.println("******************addReview 메서드 실행*****************");
			
			spsDAO mapper = memberSqlSession.getMapper(spsDAO.class);
			
			//현재 유저 idx
			ClientVO vo = (ClientVO)session.getAttribute("nowUser");
			int idx = vo.getClient_idx();
			
			//리뷰 작성안된 주문건의 주문정보
			ArrayList<OrderListVO> orderList = mapper.reviewOrder(idx);
			
			//리뷰 작성안된 주문건의 상품정보
			ArrayList<ProductVO> productList = new ArrayList<ProductVO>();
			
			for(int i=0;i<orderList.size();i++) {
				//orderList의 상품idx를 하나씩 가져와 ProductVO(제품정보)를 productList에 넣어준다.
				productList.add(mapper.cartListP(orderList.get(i).getOrderList_product_idx()));
			}
			
			model.addAttribute("order",orderList);
			model.addAttribute("product",productList);
			
			System.out.println("******************addReview 메서드 끝*****************");
			
			return "member/addReview";
		}
		
		//리뷰관리 : 리뷰 입력폼 창
		@RequestMapping(value = "/reviewInsert")
		public String reviewInsert(HttpSession session,HttpServletRequest request, Model model) {
		
			System.out.println("******************reviewInsert 메서드 실행*****************");
			spsDAO mapper = memberSqlSession.getMapper(spsDAO.class);

			//리뷰를 쓰고자 하는 아이의 주문 번호
			int orderList_idx = Integer.parseInt(request.getParameter("idx"));
			
			//리뷰를 쓰고자 하는 아이의 주문정보
			OrderListVO vo_o = mapper.selectOrderVO(orderList_idx);
			//리뷰를 쓰고자 하는 아이의 제품 정보
			ProductVO vo_p = mapper.cartListP(vo_o.getOrderList_product_idx());
			
			model.addAttribute("order",vo_o);
			model.addAttribute("product",vo_p);
			System.out.println("******************reviewInsert 메서드 끝*****************");
			
			return "member/reviewInsert";
		}
		
		
		//리뷰관리 : 리뷰 DB에 insert
		@RequestMapping(value = "/insertR")
		public String insertR(MultipartHttpServletRequest mtfRequest, HttpSession session,HttpServletRequest request, Model model) {
		
			System.out.println("******************insertR 메서드 실행*****************");
			
			//매퍼 생성
			spsDAO mapper = memberSqlSession.getMapper(spsDAO.class);
			
			//1.고객 idx => 현재 유저 idx 
			ClientVO vo = (ClientVO)session.getAttribute("nowUser");
			int idx = vo.getClient_idx();
			
			//2.주문 idx
			int orderIdx = Integer.parseInt(request.getParameter("orderIdx"));
			//3.상품 idx
			int productIdx = Integer.parseInt(request.getParameter("productIdx"));
			//4.내용,별점
			String content = mtfRequest.getParameter("content");
			String grade = mtfRequest.getParameter("hidden");
			
			System.out.println(content+" , "+ grade);
			
			//5.작성 날짜
			Date date = new Date();
			SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm");
			
			//6.리뷰 사진
			MultipartFile mf = mtfRequest.getFile("file");
			
			
			//7. 저장 파일 이름 
			/*
			 * 찬호오빠는
			 * servlet-context.xml 에서 <!--파입 업로드 폴더 경로--> 중 value 값을 오빠 경로로 바꿔주기 !
			 => 폴더명 바로 앞 경로까지 넣어주면 되어용~
			 */
			
			String extension = FilenameUtils.getExtension(mf.getOriginalFilename());
			String fileName = "review_"+orderIdx+"."+extension; //저장 이름 지정
			
			System.out.println(fileName);
			//uploadPath : 파일 이름 앞 경로(controller 맨 상단에 선언되어있음)
	        String safeFile = uploadPath + fileName; 
	        System.out.println(safeFile);
	        
	        try {
	        	//transferTO() : 업로드 한 파일 데이터를 지정한 파일에 저장한다
                 mf.transferTo(new File(safeFile));  
             } catch (IllegalStateException e) {
                 e.printStackTrace();
             } catch (IOException e) {
             	e.printStackTrace();
             }
	        
	        //리뷰 테이블에 넣어줄 reviewVO 생성
	        ReviewVO reviewVO = new ReviewVO();
	        reviewVO.setReview_client_idx(idx);
	        reviewVO.setReview_orderList_idx(orderIdx);
	        reviewVO.setReview_product_idx(productIdx);
	        
	        reviewVO.setReview_content(content);
	        reviewVO.setReview_productGrade(Integer.parseInt(grade));
	        reviewVO.setReview_writeDate(sdf.format(date));
	        reviewVO.setReview_imgPath(fileName); //이미지 이름만 db에 넣기 ( 출력할때 경로 붙여서 가져옴)
	        
	        //리뷰글 insert 
	        mapper.insertReview(reviewVO);
	        
			System.out.println("******************insertR 메서드 끝*****************");
			
			return "redirect:review";
		}
		
		//리뷰 관리 : 이미 작성한 리뷰 창
		@RequestMapping(value = "/allReview")
		public String allReview(HttpSession session,HttpServletRequest request, Model model) {
			System.out.println("******************allReview 메서드 실행*****************");
			spsDAO mapper = memberSqlSession.getMapper(spsDAO.class);
			
			//고객 idx => 현재 유저 idx
			ClientVO vo = (ClientVO)session.getAttribute("nowUser");
			int client_idx = vo.getClient_idx();
			
			//리뷰 정보들이 담긴 리스트 
			ArrayList<ReviewVO> reviews = mapper.selectReview(client_idx);
			//리뷰를 쓰고자 하는 아이의 제품 정보
			ArrayList<ProductVO> products = new ArrayList<ProductVO>();
			for(int i=0;i<reviews.size();i++) {
				products.add(mapper.cartListP(reviews.get(i).getReview_product_idx()));
			}
			
			model.addAttribute("reviews",reviews);
			model.addAttribute("products",products);
			
			System.out.println("******************allReview 메서드 끝*****************");
			
			return "member/allReview";
		}
		

		
	
}
