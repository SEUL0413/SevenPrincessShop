package com.sps.controller;

import java.util.Locale;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class HNFController {
	
	@RequestMapping("/headerNavFooter")
	public String header(HttpServletRequest request, Model model) {
		return "headerNavFooter";
	}
	
}
