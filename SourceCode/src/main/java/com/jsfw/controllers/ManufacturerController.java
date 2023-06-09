package com.jsfw.controllers;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.jsfw.models.Tbl_Category;
import com.jsfw.models.Tbl_Manufacturer;
import com.jsfw.models.Tbl_User;
import com.jsfw.services.ManufacturerService;

@Controller
@RequestMapping(value = "/manufacturers/")
public class ManufacturerController {

	@Autowired
	ManufacturerService service;
	
	@RequestMapping(value = {"","index","list"},method = RequestMethod.GET)
	public String getManufacturer(Model model, HttpServletRequest request) {
		try {
			model.addAttribute("body",IndexController.getBody("body_manufacturer"));
			model.addAttribute("path", request.getContextPath());
			model.addAttribute("currentPage","Manufacturer Management ");
			model.addAttribute("url","Home Page / Manufacturer");
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
	public String getManufacturerAdd(Model model, HttpServletRequest request) {
		try {
			model.addAttribute("body",IndexController.getBody("body_manufacturer_add"));
			model.addAttribute("path", request.getContextPath());
			model.addAttribute("currentPage","Add Manufacturer");
			model.addAttribute("url","Home Page / Manufacturer / Add");
			model.addAttribute("manufacturerAdd", new Tbl_Category());
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
	public String postManufacturerAdd(@ModelAttribute("manufacturerAdd") Tbl_Manufacturer manufacturer,Model model, HttpServletRequest request) {
		try {
			model.addAttribute("mess",null);
			if(service.findByName(manufacturer.getName()) == null) {
				service.create(manufacturer);
				return "redirect:/manufacturers";
			}
			else {
				model.addAttribute("body",IndexController.getBody("body_manufacturer_add"));
				model.addAttribute("path", request.getContextPath());
				model.addAttribute("currentPage","Add Manufacturer");
				model.addAttribute("url","Home Page / Manufacturer / Add");
				model.addAttribute("categoryAdd", new Tbl_Category());
				model.addAttribute("mess","This Manufacturer already exist");
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
	public String getManufacturerEdit(@RequestParam("id") int id, Model model, HttpServletRequest request) {
		try {
			model.addAttribute("body",IndexController.getBody("body_manufacturer_update"));
			model.addAttribute("path", request.getContextPath());
			model.addAttribute("currentPage","Update Manufacturer");
			model.addAttribute("url","Home Page / Manufacturer / Update");
			model.addAttribute("manufacturerEdit", service.findById(id));
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
	public String postManufacturerEdit(@ModelAttribute("manufacturerEdit") Tbl_Manufacturer manufacturer,Model model, HttpServletRequest request) {
		try {
			model.addAttribute("mess",null);
			if(service.findByName(manufacturer.getName()) == null) {
				service.edit(manufacturer);
				return "redirect:/manufacturers";
			}
			else {
				if(service.findByName(manufacturer.getName()).getId() == manufacturer.getId()) {
					service.edit(manufacturer);
					return "redirect:/manufacturers";
				}else {
					model.addAttribute("body",IndexController.getBody("body_manufacturer_update"));
					model.addAttribute("path", request.getContextPath());
					model.addAttribute("currentPage","Update Manufacturer");
					model.addAttribute("url","Home Page / Manufacturer / Update");
					model.addAttribute("manufacturerEdit", service.findById(manufacturer.getId()));
					model.addAttribute("mess","This Manufacturer already exist");
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
	public String getManufacturerDelete(@RequestParam("id") int id) {
		try {
			service.remove(id);
			return "redirect:/manufacturers";
		}catch(Exception e) {
			return "redirect:/error-page";
		}
	}
}
