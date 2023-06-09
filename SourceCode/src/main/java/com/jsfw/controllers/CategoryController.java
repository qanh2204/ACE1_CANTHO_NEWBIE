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
import com.jsfw.models.Tbl_User;
import com.jsfw.services.CategoryService;

@Controller
@RequestMapping(value = "/categories/")
public class CategoryController {

	@Autowired
	CategoryService service;
	

	
	@RequestMapping(value = {"","index","list"},method = RequestMethod.GET)
	public String getCategory(Model model, HttpServletRequest request) {
		try {
			model.addAttribute("body",IndexController.getBody("body_category"));
			model.addAttribute("path", request.getContextPath());
			model.addAttribute("currentPage","Catalog Management ");
			model.addAttribute("url","Home Page / Category");
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
	public String getCategoryAdd(Model model, HttpServletRequest request) {
		try {
			model.addAttribute("body",IndexController.getBody("body_category_add"));
			model.addAttribute("path", request.getContextPath());
			model.addAttribute("currentPage","Add new");
			model.addAttribute("url","Home Page / Category / Add new");
			model.addAttribute("categoryAdd", new Tbl_Category());
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
	public String postCategoryAdd(@ModelAttribute("categoryAdd") Tbl_Category category,Model model, HttpServletRequest request) {
		try {
			model.addAttribute("mess",null);
			if(service.findByName(category.getName()) == null) {
				service.create(category);
				return "redirect:/categories";
			}
			else {
				model.addAttribute("body",IndexController.getBody("body_category_add"));
				model.addAttribute("path", request.getContextPath());
				model.addAttribute("currentPage","Add new Category");
				model.addAttribute("url","Home Page / Category / Add new");
				model.addAttribute("categoryAdd", new Tbl_Category());
				model.addAttribute("mess","This Category already exists");
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
	public String getCategoryEdit(@RequestParam("id") int id, Model model, HttpServletRequest request) {
		try {
			model.addAttribute("body",IndexController.getBody("body_category_update"));
			model.addAttribute("path", request.getContextPath());
			model.addAttribute("currentPage","Update Category");
			model.addAttribute("url","Home Page / Category / Update");
			model.addAttribute("categoryEdit", service.findById(id));
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
	public String postCategoryEdit(@ModelAttribute("categoryEdit") Tbl_Category category,Model model, HttpServletRequest request) {
		try {
			model.addAttribute("mess",null);
			if(service.findByName(category.getName()) == null) {
				service.edit(category);
				return "redirect:/categories";
			}
			else {
				if(service.findByName(category.getName()).getId() == category.getId()) {
					service.edit(category);
					return "redirect:/categories";
				}else {
					model.addAttribute("body",IndexController.getBody("body_category_update"));
					model.addAttribute("path", request.getContextPath());
					model.addAttribute("currentPage","Update Category");
					model.addAttribute("url","Home Page / Category / Update");
					model.addAttribute("categoryEdit", service.findById(category.getId()));
					model.addAttribute("mess","This Category already exists");
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
	public String getCategoryDelete(@RequestParam("id") int id) {
		try {
			service.remove(id);
			return "redirect:/categories";
		}catch(Exception e) {
			return "redirect:/error-page";
		}
	}
}
