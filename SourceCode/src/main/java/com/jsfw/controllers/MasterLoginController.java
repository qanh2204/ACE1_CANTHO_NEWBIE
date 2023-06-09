package com.jsfw.controllers;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.jsfw.config.ConvertPasswordToMD5;
import com.jsfw.models.Tbl_User;
import com.jsfw.services.UserService;

@Controller
@RequestMapping(value = "/master_login/")
public class MasterLoginController {
	
	@Autowired
	UserService service;
	
	@RequestMapping(value = "",method = RequestMethod.GET)
	public String getMasterLogin(Model model, HttpServletRequest request) {
		try {
			model.addAttribute("masterLogin",new Tbl_User());
			model.addAttribute("path", request.getContextPath());
			return "master/login";
		}catch(Exception e) {
			return "redirect:/error-page";
		}
	}
	
	@RequestMapping(value = "save",method = RequestMethod.POST)
	public String postMasterLogin(@ModelAttribute("masterLogin") Tbl_User user, Model model, HttpServletRequest request) {
		try {
			request.getSession().setAttribute("master",null);
			model.addAttribute("masterLogin",new Tbl_User());
			model.addAttribute("path", request.getContextPath());
			if(service.findByUserName(user.getUsername())==null) {
				model.addAttribute("messUsername","Account does not exist");
				return "master/login";
			}
			else {
				Tbl_User rsUser = service.findByUsernameAndPassword(user.getUsername(),ConvertPasswordToMD5.ConvertToMD5(user.getPassword()));
				if(rsUser == null) {
					model.addAttribute("messPass","Incorrect password");
					return "master/login";
				}
				else {
					if(service.findByUserName(user.getUsername()).getType() != 1) {
						model.addAttribute("messUsername","The account does not have Administrator");
						return "master/login";
					}else {
						request.getSession().setAttribute("master",rsUser);
						return "redirect:/master";
					}
					
				}
			}	
		}catch(Exception e) {
			return "redirect:/error-page";
		}
	}
}
