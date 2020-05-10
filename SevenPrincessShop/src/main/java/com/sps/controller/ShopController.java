package com.sps.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

// 쇼핑몰 페이지 처리관련 기능을 담을 컨트롤러에요

@Controller
public class ShopController {

	@RequestMapping(value="showCategory")
	public String showCategory(HttpServletRequest request, Model model) {
		
		String cNum = request.getParameter("cNum");
		model.addAttribute("cNum", cNum);
		
		return "shop/showCategory";
	}
	
}
