package com.jsfw.controllers;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.jsfw.config.ConvertPasswordToMD5;
import com.jsfw.models.Tbl_User;
import com.jsfw.services.CategoryService;
import com.jsfw.services.ManufacturerService;
import com.jsfw.services.UserService;

@Controller
public class RegisterController {
	@Autowired
	UserService service;
	@Autowired
	CategoryService categoryService;
	@Autowired
	ManufacturerService manufacturerService;

	
	@RequestMapping(value = "register-save",method = RequestMethod.POST)
	public String postRegister(@ModelAttribute("userRegister") Tbl_User user,Model model, HttpServletRequest request) {
		try {
			//Xử lý header user login
			Tbl_User sessionUser = (Tbl_User) request.getSession().getAttribute("userSession");
			if(sessionUser!=null) {
				String str = "<a href='"+request.getContextPath()+"/users-detail' class='login-link'><i class='biolife-icon icon-login'></i>"+sessionUser.getUsername()+"</a>";
				model.addAttribute("changeHeader",str);
			}else {
				String str = "<a href='"+request.getContextPath()+"/login' class='login-link'><i class='biolife-icon icon-login'></i>Login/Register</a>";
				model.addAttribute("changeHeader",str);
			}
			
			if(service.findByUserName(user.getUsername()) == null) {
				
				if(service.findByEmail(user.getEmail()) != null) {
					model.addAttribute("categories",categoryService.findAll());
					model.addAttribute("manufacturers",manufacturerService.findAll());
					model.addAttribute("messUsername",null);
					model.addAttribute("messEmail","Email already exist");
					model.addAttribute("messPhone",null);
					model.addAttribute("body",IndexController.getBody("body_register"));
					model.addAttribute("path",request.getContextPath());
					return "index";
				}
				else if(service.findByPhone(user.getPhone()) != null) {
					model.addAttribute("categories",categoryService.findAll());
					model.addAttribute("manufacturers",manufacturerService.findAll());
					model.addAttribute("messUsername",null);
					model.addAttribute("messEmail",null);
					model.addAttribute("messPhone","Phone already exist");
					model.addAttribute("body",IndexController.getBody("body_register"));
					model.addAttribute("path",request.getContextPath());
					return "index";
				}else {
					Tbl_User newUser = new Tbl_User();
					newUser.setName(user.getName());
					newUser.setUsername(user.getUsername());
					newUser.setPassword(ConvertPasswordToMD5.ConvertToMD5(user.getPassword()));
					newUser.setPhone(user.getPhone());
					newUser.setAddress(user.getAddress());
					newUser.setEmail(user.getEmail());
					newUser.setStatus(0);
					newUser.setType(0);
					service.create(newUser);
					return "redirect:/login";
				}
			}else {
				model.addAttribute("categories",categoryService.findAll());
				model.addAttribute("manufacturers",manufacturerService.findAll());
				model.addAttribute("messUsername","Account already exist");
				model.addAttribute("messEmail",null);
				model.addAttribute("messPhone",null);
				model.addAttribute("messUsername","Account already exist");
				model.addAttribute("body",IndexController.getBody("body_register"));
				model.addAttribute("path",request.getContextPath());
				return "index";
			}
		}catch(Exception e) {
			return "redirect:/error-page";
		}
	}
	
}
