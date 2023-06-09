package com.jsfw.controllers;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.jsfw.models.Tbl_User;

@Controller
@RequestMapping(value="/master/")
public class MasterController {

	@RequestMapping(value = {"","index","home"},method = RequestMethod.GET)
	public String getMaster(Model model,HttpServletRequest request) {
		try {
			model.addAttribute("body",IndexController.getBody("body_default"));
			model.addAttribute("path", request.getContextPath());
			model.addAttribute("currentPage","Home Page");
			model.addAttribute("url","Home Page");
			Tbl_User masterTbl_User = (Tbl_User) request.getSession().getAttribute("master");
			if(masterTbl_User == null || request.getSession().getAttribute("master") == "") {
				return "redirect:/master_login";
			}else {
				model.addAttribute("name",masterTbl_User.getName());
				return "master/index";
			}
		}catch(Exception e) {
			return "redirect:/error-page";
		}
	}
	
	@RequestMapping(value = "logout", method = RequestMethod.GET)
	public String getLogOut(HttpServletRequest request) {
		try {
			request.getSession().setAttribute("master",null);
			return "redirect:/master";
		}catch(Exception e) {
			return "redirect:/error-page";
		}
	}
	
}
