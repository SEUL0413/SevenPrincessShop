package com.sps.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.Locale;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.ibatis.session.SqlSession;
import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.sps.dao.MybatisSampleDAO;
import com.sps.vo.ClientVO;

import net.nurigo.java_sdk.api.Message;
import net.nurigo.java_sdk.exceptions.CoolsmsException;




@Controller
public class SampleController {

	int a = 1;		// 문자 1회발송용 변수 a
	int code = 0;	// 인증번호 코드 추후 랜덤값 생성
	
	@Autowired
	public SqlSession sqlSession;	// sqlSession 변수 >> Autowired로 자동 주입 servlet-context.xml 에 빈 선언해놓음
	
	
	
	
//	Sample 첫 시작화면 
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(Locale locale, Model model) {
//		자동 root으로 sample 폴더의 sampleView1.jsp로 이동
		return "sample/sampleView1";
	}
	
	
	
//	join폼으로 보내주는 맵핑
	@RequestMapping(value = "/join")
	public String test(Locale locale, Model model) {	
		
//		오늘 날자 구하기
		Date dt = new Date();
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		
//		오늘의 날자정보 입력 - Attribute
		model.addAttribute("today", sdf.format(dt));
		return "sample/joinTestPage";
	}
	
	
	
//	문자 전송 맵핑
	@RequestMapping(value="/sendCode")
	public String sendCode(HttpServletRequest request, Model model,HttpServletResponse respons, ClientVO clientVO) {
			
			
			
//			날자 생성, 오늘의 날자 model에 담기 - Attribute
			Date dt = new Date();
			SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
			model.addAttribute("today", sdf.format(dt));
			
//			주소 api는 아직 관련기관에 인증중.. 추후 사용할일 있으면 사용할 수 있도록 조치해놓겠음 일단 이건 우리집주소로 대처
			clientVO.setClient_address("인천광역시 서구 청마로46 104-401");
			clientVO.setClient_registerDate(sdf.format(dt));
			
//			모델에 vo 날려줌 이거 vo 인자값으로 받은거임 이 방법
//			주의사항은 폼태그 내의 태그들 name이 사용하려는 vo의 변수와 맞아야함 꼭 기억하세요
			model.addAttribute("vo",clientVO);
			
			
//			만약에 처음 문자전송 시도이면 아래 코드 들어감
			if(a==1) {
				System.out.println("sendMessage");
//				 응답 객체에 컨탠츠 타입 html로 선언해줌
				 respons.setContentType("text/html");
//				 PrintWriter 객체 선언해주고
		         PrintWriter out = null;
		          try {
//		        	선언한 out 에 Writer 불러다가 넣어줌 
					out = respons.getWriter();
				} catch (IOException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
		          
//		                 이렇게 자바에서 스크립트 실행하려고 위에꺼 한거임
		          out.println("<script>alert('인증번호가 발송되었습니다.');</script>");
//		                  쓰고나면 flush()로 방출
		          out.flush();
		          
//		              인증코드는 랜덤 생성  
				code = (int)Math.floor(Math.random()*1000000+1);
				
//				모델에 인증코드 변수 넣어주자
				model.addAttribute("code",code);
				
//				문자 또 못보내게 멤버 a 2로 바꿈 이제 if문 못들어옴
				a=2;
				
//			넘어온 vo 객체의 phoneNumber 받기 즉, 입력 양식에서 사용자가 입력한 전화번호	
			String phoneNumber = clientVO.getClient_phoneNumber();	
			
//			내꺼 api 키코드 우리만 알고있자
		  	String api_key = "NCSPDUHGAWCUUPXC";
		    String api_secret = "KLXUWMMFVE0Y1OYGXVFLAPK4BY0KDH75";
		    
//		       디펜던시 추가한 SDK 라이브러리의 Message 객체 만들기 그리고 내 사용자 정보 전달
		    Message coolsms = new Message(api_key, api_secret);

//		       해쉬맵 생성
		    HashMap<String, String> params = new HashMap<String, String>();
		    
//		       맵에다가 전송정보 입력 'to' 키 값에는 사용자가 입력한 전화번호 주기
		    params.put("to", phoneNumber);
		    params.put("from", "01047598517"); // 요고는 무조건 내번호로 해야해
		    params.put("type", "SMS");
		    params.put("text", "SevenPrincessShop 본인인증번호는 ["+code+"] 입니다. (건당20원이다 살살해라)");
		    params.put("app_version", "test app 1.2"); // application name and version

		    try {
		      JSONObject obj = (JSONObject) coolsms.send(params);	//보내는거 성공한지 알아보기
		      System.out.println(obj.toString());
		    } catch (CoolsmsException e) {
		      System.out.println(e.getMessage());	//실패하면 콘솔 알려주삼
		      System.out.println(e.getCode());
		    }
		    
			
			}
			
//			여기는 a!=1 일때 들어오는 공간임
			else {
				System.out.println("noSend");	// 응 안보내
				model.addAttribute("code",code); // 그래도 전에 보냈었던 코드는 그대로 저장
		          respons.setContentType("text/html");	// alert 띄울준비
		          PrintWriter out = null;	// 객체 잡아주고
		          try {
					out = respons.getWriter();
				} catch (IOException e) {
					e.printStackTrace();
				}	
//		                 쓰고, 방출
		          out.println("<script>alert('자금 사정상 인증번호는 1회만 발송됩니다 1건당20원...');</script>");
		          out.flush();
			}
//		문자 보냈으면 이쪽으로가시오 여기서 ajex 사용하면 이렇게 vo불러들여서 저장해서 다시 jsp에 vo 뿌려주는 작업없이
//		입력폼 유지할 수 있는데 아직 ajex 미숙함 그래서 사용자가 입력하던 정보 vo로 받아와서 문자전송(서버단) 작업 끝나고
//		다시 vo 돌려주어서 입력하던거 유지하게끔 하고있음 (서버단 작동하면 입력하던거 날아감) > 추후 ajex로 하자
		return "sample/joinTestPage";
}
	
	
	
	
//	가입이 완료될경우
	@RequestMapping(value="/joinMember")
	public String joinMember(HttpServletRequest request, Model model, ClientVO clientVO) {
		
//		날자생성 주입, 주소는 주소 api 아직 인증못해서 임의로 vo에 넣어줌
		Date dt = new Date();
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		clientVO.setClient_address("인천광역시 서구 청마로46 104-401");
		clientVO.setClient_registerDate(sdf.format(dt));
		
//		인터페이스 로 매퍼생성 자동 주입된 객체 sqlSession으로 매퍼 얻어와서 넣어버려~
		MybatisSampleDAO mapper = sqlSession.getMapper(MybatisSampleDAO.class);
		
//		insertMember 메소드 실행 인자 > vo
		mapper.insertMember(clientVO);
		
		return "sample/sampleView2";
	}
	
	
	
	
	
//	select 쿼리동작 예시
	@RequestMapping(value="/showMember")
	public String showMember(HttpServletRequest request, Model model) {
		
//		메퍼주입
		MybatisSampleDAO mapper = sqlSession.getMapper(MybatisSampleDAO.class);
		
//		마지막 가입자 idx 알아낼 countMember return = 총 레코드 수
		int count = mapper.countMember();
		
//		vo 는 마지막 가입자 idx를 인자 값으로 레코드 하나 vo에 주입
		ClientVO vo = mapper.selectMember(count);
		
//		model에 저장
		model.addAttribute("vo", vo);
		System.out.println(vo);
		
		return "sample/sampleView3";
	}
	
	
}




