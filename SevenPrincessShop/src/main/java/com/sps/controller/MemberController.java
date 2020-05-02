package com.sps.controller;

import javax.servlet.http.HttpServletRequest;

import org.apache.maven.model.Model;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

// 회원과 관련된 기능을 담을 컨트롤러에요

@Controller
public class MemberController {

	@RequestMapping(value = "/login")
	public String login(HttpServletRequest request, Model model) {
		
		return "member/Login";
	}
	

}
