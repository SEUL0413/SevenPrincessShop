package com.sps.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.sps.dao.spsDAO;
import com.sps.vo.ClientVO;

@Controller
public class MemberController {
	
@Autowired
SqlSession memberSqlSession;
	
	
	
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
	public String myPage(HttpServletRequest request, Model model) {
		
		return "member/myPage";
	}
	
	
	
	
	@RequestMapping(value="/myBasket")
	public String myBasket(HttpServletRequest request, Model model) {
		
		return "member/myBasket";
	}
	
}
