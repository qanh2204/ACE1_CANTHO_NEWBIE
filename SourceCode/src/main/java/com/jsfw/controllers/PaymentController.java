package com.jsfw.controllers;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.jsfw.models.Tbl_Payment;
import com.jsfw.models.Tbl_User;
import com.jsfw.services.PaymentService;

@Controller
@RequestMapping(value = "/payments/")
public class PaymentController {
	@Autowired
	PaymentService service;
	
	@RequestMapping(value = {"","index","list"},method = RequestMethod.GET)
	public String getPayment(Model model, HttpServletRequest request) {
		try {
			model.addAttribute("body",IndexController.getBody("body_payment"));
			model.addAttribute("path", request.getContextPath());
			model.addAttribute("currentPage","Payments Management");
			model.addAttribute("url","Home Page / Payments");
			model.addAttribute("list",service.findAll());
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
	
	@RequestMapping(value = "add",method = RequestMethod.GET)
	public String getPaymentAdd(Model model, HttpServletRequest request) {
		try {
			model.addAttribute("body",IndexController.getBody("body_payment_add"));
			model.addAttribute("path", request.getContextPath());
			model.addAttribute("currentPage","Add Payments");
			model.addAttribute("url","Home Page / Payments / Add");
			model.addAttribute("paymentAdd", new Tbl_Payment());
			model.addAttribute("mess",null);
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
	
	@RequestMapping(value = "postAdd",method = RequestMethod.POST)
	public String postPaymentAdd(@ModelAttribute("PaymentAdd") Tbl_Payment payment,Model model, HttpServletRequest request) {
		try {
			model.addAttribute("mess",null);
			if(service.findByName(payment.getMethod()) == null) {
				service.create(payment);
				return "redirect:/payments";
			}
			else {
				model.addAttribute("body",IndexController.getBody("body_payment_add"));
				model.addAttribute("path", request.getContextPath());
				model.addAttribute("currentPage","Add Payments");
				model.addAttribute("url","Home Page / Payments / Add");
				model.addAttribute("paymentAdd", new Tbl_Payment());
				model.addAttribute("mess","This form already exists");
				Tbl_User masterTbl_User = (Tbl_User) request.getSession().getAttribute("master");
				if(masterTbl_User == null || request.getSession().getAttribute("master") == "") {
					return "redirect:/master_login";
				}else {
					model.addAttribute("name",masterTbl_User.getName());
					return "master/index";
				}
			}
		}catch(Exception e) {
			return "redirect:/error-page";
		}
	}
	
	@RequestMapping(value = "edit",method = RequestMethod.GET)
	public String getPaymentEdit(@RequestParam("id") int id, Model model, HttpServletRequest request) {
		try {
			model.addAttribute("body",IndexController.getBody("body_payment_update"));
			model.addAttribute("path", request.getContextPath());
			model.addAttribute("currentPage","Update Payments");
			model.addAttribute("url","Home Page / Payments / Update");
			model.addAttribute("paymentEdit", service.findById(id));
			model.addAttribute("mess",null);
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
	
	@RequestMapping(value = "postEdit",method = RequestMethod.POST)
	public String postPaymentEdit(@ModelAttribute("paymentEdit") Tbl_Payment payment,Model model, HttpServletRequest request) {
		try {
			model.addAttribute("mess",null);
			if(service.findByName(payment.getMethod()) == null) {
				service.edit(payment);
				return "redirect:/payments";
			}
			else {
				if(service.findByName(payment.getMethod()).getId() == payment.getId()) {
					service.edit(payment);
					return "redirect:/payments";
				}else {
					model.addAttribute("body",IndexController.getBody("body_payment_update"));
					model.addAttribute("path", request.getContextPath());
					model.addAttribute("currentPage","Update Payments");
					model.addAttribute("url","Home Page / Payments / Update");
					model.addAttribute("paymentEdit", service.findById(payment.getId()));
					model.addAttribute("mess","This form already exists");
					Tbl_User masterTbl_User = (Tbl_User) request.getSession().getAttribute("master");
					if(masterTbl_User == null || request.getSession().getAttribute("master") == "") {
						return "redirect:/master_login";
					}else {
						model.addAttribute("name",masterTbl_User.getName());
						return "master/index";
					}
				}
			}
		}catch(Exception e) {
			return "redirect:/error-page";
		}
	}
	
	@RequestMapping(value = "delete",method = RequestMethod.GET)
	public String getPaymentDelete(@RequestParam("id") int id) {
		try {
			service.remove(id);
			return "redirect:/payments";
		}catch(Exception e) {
			return "redirect:/error-page";
		}
	}
}
