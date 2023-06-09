package com.jsfw.controllers;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.jsfw.models.Tbl_Product;
import com.jsfw.models.Tbl_User;
import com.jsfw.services.CategoryService;
import com.jsfw.services.ImageService;
import com.jsfw.services.ManufacturerService;
import com.jsfw.services.ProductService;

@Controller
@RequestMapping(value = "/products/")
public class ProductController {

	@Autowired
	ProductService service;
	@Autowired
	CategoryService categoryService;
	@Autowired
	ManufacturerService manufacturerService;
	@Autowired
	ImageService imageService;
	
	@RequestMapping(value = {"","index","list"},method = RequestMethod.GET)
	public String getProduct(Model model, HttpServletRequest request) {
		try {
			model.addAttribute("body",IndexController.getBody("body_product"));
			model.addAttribute("path", request.getContextPath());
			model.addAttribute("currentPage","Product Management");
			model.addAttribute("url","Home Page / Product");
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
	
	@RequestMapping(value = "detail",method = RequestMethod.GET)
	public String getProductDetail(@RequestParam("id") int id,Model model, HttpServletRequest request) {
		try {
			model.addAttribute("body",IndexController.getBody("body_product_detail"));
			model.addAttribute("path", request.getContextPath());
			model.addAttribute("currentPage","Product Information");
			model.addAttribute("url","Home Page / Product / Product details");
			model.addAttribute("product",service.findById(id).get());
			model.addAttribute("images",imageService.findByProduct(service.findById(id)));
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
	public String getProductAdd(Model model, HttpServletRequest request) {
		try {
			model.addAttribute("body",IndexController.getBody("body_product_add"));
			model.addAttribute("path", request.getContextPath());
			model.addAttribute("currentPage","Add Product");
			model.addAttribute("url","Home Page / Product / Add");
			model.addAttribute("categories",categoryService.findAll());
			model.addAttribute("manufacturers",manufacturerService.findAll());
			model.addAttribute("productAdd", new Tbl_Product());
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
	public String postProductAdd(@ModelAttribute("productAdd") Tbl_Product product,Model model, HttpServletRequest request) {
		try {
			model.addAttribute("mess",null);
			if(service.findByName(product.getName()) == null) {
				service.create(product);
				return "redirect:/products";
			}
			else {
				model.addAttribute("body",IndexController.getBody("body_product_add"));
				model.addAttribute("path", request.getContextPath());
				model.addAttribute("currentPage","Add Product");
				model.addAttribute("url","Home Page / Product / Add");
				model.addAttribute("manufacturers",manufacturerService.findAll());
				model.addAttribute("categories",categoryService.findAll());
				model.addAttribute("productAdd", new Tbl_Product());
				model.addAttribute("mess","This product already exists");
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
	public String getProductEdit(@RequestParam("id") int id, Model model, HttpServletRequest request) {
		try {
			model.addAttribute("body",IndexController.getBody("body_product_update"));
			model.addAttribute("path", request.getContextPath());
			model.addAttribute("currentPage","Update Product");
			model.addAttribute("url","Home Page / Product / Update");
			model.addAttribute("productEdit", service.findById(id));
			model.addAttribute("manufacturers",manufacturerService.findAll());
			model.addAttribute("categories",categoryService.findAll());
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
	public String postProductEdit(@ModelAttribute("productEdit") Tbl_Product product,Model model, HttpServletRequest request) {
		try {
			model.addAttribute("mess",null);
			if(service.findByName(product.getName()) == null) {
				service.edit(product);
				return "redirect:/products";
			}
			else {
				if(service.findByName(product.getName()).getId() == product.getId()) {
					service.edit(product);
					return "redirect:/products";
				}else {
					model.addAttribute("body",IndexController.getBody("body_product_update"));
					model.addAttribute("path", request.getContextPath());
					model.addAttribute("currentPage","Update Product");
					model.addAttribute("url","Home Page / Product / Update");
					model.addAttribute("categoryEdit", service.findById(product.getId()));
					model.addAttribute("manufacturers",manufacturerService.findAll());
					model.addAttribute("categories",categoryService.findAll());
					model.addAttribute("mess","This product already exists");
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
	public String getProductDelete(@RequestParam("id") int id) {
		try {
			service.remove(id);
			return "redirect:/products";
		}catch(Exception e) {
			return "redirect:/error-page";
		}
	}
}
