package com.sps.controller;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.io.FilenameUtils;
import org.apache.ibatis.session.SqlSession;
import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.sps.dao.spsDAO;
import com.sps.mail.FindUtil;
import com.sps.mail.MailUtil;
import com.sps.vo.AboardVO;
import com.sps.vo.ClientVO;
import com.sps.vo.OrderListVO;
import com.sps.vo.ProductVO;
import com.sps.vo.Qboard;
import com.sps.vo.QboardList;
import com.sps.vo.ReviewVO;

import net.nurigo.java_sdk.api.Message;
import net.nurigo.java_sdk.exceptions.CoolsmsException;

@Controller
public class MemberController {
	int a = 1;		// 문자 1회발송용 변수 a
	int code = 0;	// 인증번호 코드 추후 랜덤값 생성
	@Autowired
	SqlSession memberSqlSession;
	
	//리쀼 이미지 파일 업로드용 count : 전역 변수 선언
	int imgCount =0;
	
	@RequestMapping(value="/login")
	public String login(HttpServletRequest request, Model model) {
		
		return "member/login";
	}
	
	
	@RequestMapping(value="/searchId")
	@ResponseBody
public String searchId(HttpServletRequest request, Model model, String target) {
		
		spsDAO mapper = memberSqlSession.getMapper(spsDAO.class);
		
		String result = "";
		
		int isMember = mapper.isMember(target);
		
		if(isMember==0) {
			result = "pass";
		}
		else {
			result = "overlap";
		}
		
		return result;
	}
	
	
	
//	로그인 시작
	@RequestMapping(value="/goLogin")
	@ResponseBody
	public Object loginCheck(HttpSession session,HttpServletRequest request,HttpServletResponse res ,Model model,String id,String password) {

		try {
			res.setCharacterEncoding("UTF-8");
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		spsDAO mapper = memberSqlSession.getMapper(spsDAO.class);
		System.out.println("loginCheck Method SqlSession open");
		
		int isMember = mapper.isMember(id);
		System.out.println("isMember? : " + isMember);
		
		
		
		String result="";
		ClientVO member;
		if(isMember == 0) {
			 result = "notMember";
			 System.out.println("server - not found Member");
		}
		
		
		else if(isMember!=0) {
			member = mapper.selectById(id);
			System.out.println("server - create member");
			
			if(!password.equals(member.getClient_password())) {
				result = "discord";
				System.out.println("server - not Inconsistency password");
			}
			else {
				member = mapper.selectById(id);
				result = "success/"+member.getClient_name();
				System.out.println("success Login User name : "+member.getClient_name());
				session.setAttribute("nowUser", member);
				System.out.println("setSession : " + member);
			}
		}
		
		
		  System.out.println("loginCheck Method Finish");
	      return result;
	      
	}// 로그인 끝
	
	@RequestMapping(value="/goJoinMember")
	public String joinMember(HttpSession session, HttpServletRequest request, Model model) {
//		오늘 날자 구하기
		Date dt = new Date();
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		
//		오늘의 날자정보 입력 - Attribute
		model.addAttribute("today", sdf.format(dt));
		
			return "member/register";
		
	}
	
	
	@RequestMapping(value="/logout")
	public String logout(HttpSession session, HttpServletRequest request, Model model) {
		
				session.removeAttribute("nowUser");
		
			return "redirect:/";
			
	} 
	
	
	
	//joinSendCode
	@RequestMapping(value="/joinSendCode")
	@ResponseBody
	public String joinSendCode(HttpSession session, HttpServletRequest request,HttpServletResponse res, Model model, String phoneNumber) {
		
		if(a==1) {
			
			spsDAO mapper = memberSqlSession.getMapper(spsDAO.class);
			
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
		
//		여기는 a!=1 일때 들어오는 공간임
		else {
			System.out.println("noSend");	// 응 안보내
	         return "noSend/"+code;
		}
//	문자 보냈으면 이쪽으로가시오 여기서 ajex 사용하면 이렇게 vo불러들여서 저장해서 다시 jsp에 vo 뿌려주는 작업없이
//	입력폼 유지할 수 있는데 아직 ajex 미숙함 그래서 사용자가 입력하던 정보 vo로 받아와서 문자전송(서버단) 작업 끝나고
//	다시 vo 돌려주어서 입력하던거 유지하게끔 하고있음 (서버단 작동하면 입력하던거 날아감) > 추후 ajex로 하자
	}
	
	
	
	
	
	@RequestMapping(value="/insertMember")
	public String insertMember(HttpSession session, HttpServletRequest request, Model model, ClientVO memberInfo) {
//		오늘 날자 구하기
		Date dt = new Date();
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm");
		
		ClientVO member = memberInfo;
		
		member.setClient_phoneNumber(member.getClient_phoneNumber()+request.getParameter("phone2")+request.getParameter("phone3"));
		
		member.setClient_email(member.getClient_email()+"@"+request.getParameter("email2"));
		
		member.setClient_registerDate(sdf.format(dt));
		System.out.println(member);
		
		
		
		spsDAO mapper = memberSqlSession.getMapper(spsDAO.class);
		
		mapper.insertMember(member);
			
		return "shop/index";
		
	}
	
	
	
	
	


		
//		findId폼으로 보내주는 맵핑 => 아이디 찾기 폼
		@RequestMapping(value = "/findIdPw")
		public String findId(HttpServletRequest request, Model model) throws Exception {
			return "member/findIdPw";
		}
		
//		findIdResult폼으로 보내주는 맵핑 => 찾은 아이디 확인 폼
		@RequestMapping(value = "/findIdResult")
		public String findIdResult(HttpServletRequest request, HttpServletResponse response, Model model, ClientVO vo) throws Exception {
			response.setContentType("text/html; charset=UTF-8");
			//응답으로 내보낼 출력 스트림 얻어오기
			PrintWriter out = response.getWriter();
			spsDAO mapper = memberSqlSession.getMapper(spsDAO.class);
			String name = vo.getClient_name();
			System.out.println(vo.getClient_name());
			String phoneNumber = vo.getClient_phoneNumber();
			System.out.println(vo.getClient_email());
			
			String id = mapper.findId(name, phoneNumber);
			System.out.println(id);
			
			//아이디 검색 sql 실행 후 검색된 아이디가 없다면 alert창으로 문구 띄워주기
			if(id == null) {
				out.println("<script>");
				out.println("alert('가입된 아이디가 없습니다.');");
				out.println("history.go(-1);");
				out.println("</script>");
				out.close();
			}else {
				model.addAttribute("id",id);
			}
			
			return "member/findIdResult";
		}
	//@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@ 아이디찾기 끝 @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@

		
		
	//@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@ 비밀번호 찾기  @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
		
//		이메일 보내기 메소드	
//		findPw 폼에서 입력한 아이디와 이메일을 가지고 와서 비밀번호가 맞다면 임시비밀번호를 생성해서 가져온 이메일 주소로 임시비밀번호를 보내주고
//		아이디와 이메일이 하나라도 일치하는게 없다면 alert창을 띄우는 메소드
		@RequestMapping(value = "/findPwResult")
		public String findPwResult(HttpServletRequest request, HttpServletResponse response, Model model, ClientVO vo) throws Exception {
			spsDAO mapper = memberSqlSession.getMapper(spsDAO.class);
			response.setContentType("text/html; charset=UTF-8");
			PrintWriter out = response.getWriter();
			
			  String id = vo.getClient_id();
			  String email = vo.getClient_email();
			  int count = mapper.findPwCount(id,email);
			  
			  if(count != 1) {
				out.println("<script>");
				out.println("alert('가입된 정보가 없습니다.');");
				out.println("history.go(-1);");
				out.println("</script>");
				out.close();
				
				return "member/findIdPw";
				
			  }else {
		
				//FindUtil클래스의 createKey() 메소드를 실행하여 임시비밀번호로 쓸 난수를 만들어 newPw 변수에 저장한다.
				String newPw = FindUtil.createKey();
				System.out.println("임시 비밀번호 : " + newPw);
				
				//기존 비밀번호에서 위에서 만든 임시 비밀번호로 바꾸어 DB에 저장하는 메소드를 실행한다. 
				mapper.changePwd(newPw, id);
				System.out.println("찾는 아이디" + id);
				System.out.println("찾는 이메일" + email);
				
				
				//이메일에 쓸 내용
				String subject = "[SevenPrincessShop] 임시 비밀번호 발급 안내"; //이메일 제목
				String msg = ""; //본문내용
				msg += "<div align='center' style='border:1px solid black; font-family:verdana'>";
				msg += "<h3 style='color: blue;'><strong>" + vo.getClient_id();
				msg += "님</strong>의 임시 비밀번호 입니다. 로그인 후 비밀번호를 변경하세요.</h3>";
				msg += "<p>임시 비밀번호 : <strong>" + newPw + "</strong></p></div>";
		
				//MailUtil클래스의 sendMail(보낼 이메일, 제목, 본문) 메소드를 실행한다.
				MailUtil.sendMail(email, subject, msg);
				
			
				model.addAttribute("email",email);
			
				return "member/findPwResult"; //로그인 화면 구현되면 로그인창으로 포워드 하기!!
			  }
		}	
	//@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@ 비밀번호 찾기 끝 @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	@RequestMapping(value="/myPage")
	public String myPage(HttpSession session, HttpServletRequest request, Model model) {
		
		if(session.getAttribute("nowUser")==null) {
			System.out.println("로그인 xx 일때 못오게 작업하셈");
			return "shop/index";
		}
		else {
			return "redirect:myOrderView";
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
			//기본주소
			vo.setClient_address(request.getParameter("client_address"));
			//상세주소
			vo.setClient_detailAddress(request.getParameter("client_detailAddress"));
			//우편번호
			vo.setClient_addressNumber(request.getParameter("client_addressNumber"));
			
			spsDAO mapper = memberSqlSession.getMapper(spsDAO.class);
			mapper.updateMember(vo);
			
			//업데이트 되는 vo의 정보를 session에 재저장
			session.setAttribute("nowUser", vo);
			
			System.out.println("******************updateMember 메서드 끝!!*****************");
			return "redirect:myPage";
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
			
			//세션에 저장된 nowUser 삭제!
			session.removeAttribute("nowUser");
		
			System.out.println("******************deleteMember 메서드 끝!!*****************");
			
			return "shop/index"; 
		}
		
	
		//장바구니 보기 화면
		@RequestMapping(value = "/cartView")
		public String cartView(HttpSession session,HttpServletRequest request, Model model) {
			
			ArrayList<OrderListVO> cartListO;
			ArrayList<ProductVO> cartListP;
			//상품 -> 옵션별 현재 잔여 재고수량
			ArrayList<Integer> stocks = new ArrayList<Integer>();
			
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
				System.out.println(product_idx+" , "+cartListO.get(i).getOrderList_size()+ " , "+cartListO.get(i).getOrderList_color());
				stocks.add(mapper.getTableStock(product_idx+"",cartListO.get(i).getOrderList_size(),cartListO.get(i).getOrderList_color()));
				System.out.println(stocks.get(i));
			}
			
			
			
			model.addAttribute("listO",cartListO); //사이즈,색상,개수
			model.addAttribute("listP",cartListP); //상품이름,상품 이미지, 상품 가격
			model.addAttribute("stocks",stocks);
			
			
			
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
	            
	         String[] indexs = idxs.split("_");
	         
	         for(int i=0;i<indexs.length;i++) {
	            if(indexs[i]!="" && indexs[i]!=null) {
	               System.out.println(indexs[i]);
	               //장바구니 idx 인자로 넘겨 실행
	               mapper.selectStatus(Integer.parseInt(indexs[i])); 
	            }
	         }
	         System.out.println("******************updateStatus 메서드 끝*****************");
	         
	         return "redirect:pay"; 
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
				//System.out.println(listO.get(i).getOrderList_orderDate().split(" ")[0]);
				
				listO.get(i).setOrderList_orderDate(listO.get(i).getOrderList_orderDate().split(" ")[0]);
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
			 
			//상세 view 출력할 orderList_idx
			int idx = Integer.parseInt(request.getParameter("idx"));
			
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
			System.out.println("client_idx : "+ client_idx);
			int pageSize = 10;									// 보여줄 글의 개수
			int totalCount = mapper.countQboard(client_idx); 	// totalCount는 보여줄 글의 총 수량을 알려주자!!
			
			int currentPage = 1;								// 얘는 view 에서 넘어오는 현재페이지 정보를 주지스님!!!
			try {
				currentPage = Integer.parseInt(request.getParameter("currentPage")); //그게 이거야!!!
				System.out.println("qnaBoard method currentPage : " + currentPage);
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
			String root_path = request.getSession().getServletContext().getRealPath("/");
			String attach_path = "resources/images/reviewImages/";
			System.out.println(root_path);
			
			//저장 이름 지정
			String extension = FilenameUtils.getExtension(mf.getOriginalFilename());
			String fileName ="";
			if(extension!="" && extension!=null) {
				fileName = "review_"+orderIdx+"."+extension;
			} 
	        
			//파일 이미지 경로
			String safeFile = root_path+attach_path+fileName; 
	        
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
			
			return "redirect:allReview";
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
