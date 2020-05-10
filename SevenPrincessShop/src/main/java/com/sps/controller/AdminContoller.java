package com.sps.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

// 관리자 기능을 담을 컨트롤러에요
@Controller
public class AdminContoller {
	@RequestMapping(value="/customerService")
	public String login(HttpServletRequest request, Model model) {
		
	return "admin/customerService";
	}
}
