package com.jsfw.controllers;



import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.aspectj.weaver.NewConstructorTypeMunger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.jsfw.models.Rate;
import com.jsfw.models.Tbl_Category;
import com.jsfw.models.Tbl_Comment;
import com.jsfw.models.Tbl_Image_Product;
import com.jsfw.models.Tbl_Product;
import com.jsfw.models.Tbl_User;
import com.jsfw.services.CategoryService;
import com.jsfw.services.CommentService;
import com.jsfw.services.ImageService;
import com.jsfw.services.ManufacturerService;
import com.jsfw.services.PaymentService;
import com.jsfw.services.ProductService;
import com.jsfw.services.UserService;
import com.jsfw.services.VoteService;

@Controller
@RequestMapping(value = "/")
public class IndexController {
	
	@Autowired
	CategoryService categoryService;
	@Autowired
	ManufacturerService manufacturerService;
	@Autowired
	PaymentService paymentService;
	@Autowired
	UserService userService;
	@Autowired
	ProductService productService;
	@Autowired
	ImageService imageService;
	@Autowired
	VoteService voteService;
	@Autowired
	CommentService commentService;
	
	@RequestMapping(value = {"","index"},method = RequestMethod.GET)
	public String getIndex(Model model, HttpServletRequest request) {
		try {
			Tbl_User sessionUser = (Tbl_User) request.getSession().getAttribute("userSession");
			if(sessionUser!=null) {
				String str = "<a href='"+request.getContextPath()+"/users-detail' class='login-link'><i class='biolife-icon icon-login'></i>"+sessionUser.getUsername()+"</a>";
				model.addAttribute("changeHeader",str);
			}else {
				String str = "<a href='"+request.getContextPath()+"/login' class='login-link'><i class='biolife-icon icon-login'></i>Login/Register</a>";
				model.addAttribute("changeHeader",str);
			}

			model.addAttribute("categories",categoryService.findAll());
			model.addAttribute("manufacturers",manufacturerService.findAll());
			model.addAttribute("newProducts",productService.findTop10New());
			model.addAttribute("body",getBody("body_default"));
			model.addAttribute("path",request.getContextPath());
			return "index";
		}catch(Exception e) {
			return "redirect:/error-page";
		}
	}
	
	@RequestMapping(value = {"error-page"},method = RequestMethod.GET)
	public String getError(Model model, HttpServletRequest request) {
		Tbl_User sessionUser = (Tbl_User) request.getSession().getAttribute("userSession");
		if(sessionUser!=null) {
			String str = "<a href='"+request.getContextPath()+"/users-detail' class='login-link'><i class='biolife-icon icon-login'></i>"+sessionUser.getUsername()+"</a>";
			model.addAttribute("changeHeader",str);
		}else {
			String str = "<a href='"+request.getContextPath()+"/login' class='login-link'><i class='biolife-icon icon-login'></i>Login/Register</a>";
			model.addAttribute("changeHeader",str);
		}

		model.addAttribute("categories",categoryService.findAll());
		model.addAttribute("manufacturers",manufacturerService.findAll());
		model.addAttribute("body",getBody("body_error"));
		model.addAttribute("path",request.getContextPath());
		return "index";
	}
	
	@RequestMapping(value = {"contact-us"},method = RequestMethod.GET)
	public String getContact(Model model, HttpServletRequest request) {
		try {
			Tbl_User sessionUser = (Tbl_User) request.getSession().getAttribute("userSession");
			if(sessionUser!=null) {
				String str = "<a href='"+request.getContextPath()+"/users-detail' class='login-link'><i class='biolife-icon icon-login'></i>"+sessionUser.getUsername()+"</a>";
				model.addAttribute("changeHeader",str);
			}else {
				String str = "<a href='"+request.getContextPath()+"/login' class='login-link'><i class='biolife-icon icon-login'></i>Login/Register</a>";
				model.addAttribute("changeHeader",str);
			}

			model.addAttribute("categories",categoryService.findAll());
			model.addAttribute("manufacturers",manufacturerService.findAll());
			model.addAttribute("body",getBody("body_contact"));
			model.addAttribute("path",request.getContextPath());
			return "index";
		}catch(Exception e) {
			return "redirect:/error-page";
		}
	}

	@RequestMapping(value = "register",method = RequestMethod.GET)
	public String getRegister(Model model, HttpServletRequest request) {
		try {
			Tbl_User sessionUser = (Tbl_User) request.getSession().getAttribute("userSession");
			if(sessionUser!=null) {
				String str = "<a href='"+request.getContextPath()+"/users-detail' class='login-link'><i class='biolife-icon icon-login'></i>"+sessionUser.getUsername()+"</a>";
				model.addAttribute("changeHeader",str);
			}else {
				String str = "<a href='"+request.getContextPath()+"/login' class='login-link'><i class='biolife-icon icon-login'></i>Login/Register</a>";
				model.addAttribute("changeHeader",str);
			}
			model.addAttribute("mess",null);
			model.addAttribute("userRegister",new Tbl_User());
			model.addAttribute("url","Home Page / Register");
			model.addAttribute("body",getBody("body_register"));
			model.addAttribute("path",request.getContextPath());
			return "index";
		}catch(Exception e) {
			return "redirect:/error-page";
		}
	}
	@RequestMapping(value = "master_login",method = RequestMethod.GET)
	public String getLoginMaster(Model model,HttpServletRequest request) {
		try {
			model.addAttribute("masterLogin",new Tbl_User());
			model.addAttribute("messUsername",null);
			model.addAttribute("messPass",null);
			model.addAttribute("path", request.getContextPath());
			return "master/login";
		}catch(Exception e) {
			return "redirect:/error-page";
		}
	}

	@RequestMapping(value = "master",method = RequestMethod.GET)
	public String getMaster(Model model,HttpServletRequest request) {
		try {
			model.addAttribute("body",getBody("body_default"));
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
	
	@RequestMapping(value = "categories",method = RequestMethod.GET)
	public String getCategory(Model model, HttpServletRequest request) {
		try {
			model.addAttribute("body",getBody("body_category"));
			model.addAttribute("path", request.getContextPath());
			model.addAttribute("currentPage","Manage Category");
			model.addAttribute("url","Home Page / Category");
			model.addAttribute("list",categoryService.findAll());
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
	
	@RequestMapping(value = "manufacturers",method = RequestMethod.GET)
	public String getManufacturer(Model model, HttpServletRequest request) {
		try {
			model.addAttribute("body",getBody("body_manufacturer"));
			model.addAttribute("path", request.getContextPath());
			model.addAttribute("currentPage","Manage Manufacturer");
			model.addAttribute("url","Home Page / Manufacturer");
			model.addAttribute("list",manufacturerService.findAll());
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
	
	@RequestMapping(value = "payments",method = RequestMethod.GET)
	public String getPayment(Model model, HttpServletRequest request) {
		try {
			model.addAttribute("body",getBody("body_payment"));
			model.addAttribute("path", request.getContextPath());
			model.addAttribute("currentPage","Manage Payments");
			model.addAttribute("url","Home Page / Payments");
			model.addAttribute("list",paymentService.findAll());
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
	
	@RequestMapping(value = "products",method = RequestMethod.GET)
	public String getProduct(Model model, HttpServletRequest request) {
		try {
			model.addAttribute("body",getBody("body_product"));
			model.addAttribute("path", request.getContextPath());
			model.addAttribute("currentPage","Manage Product");
			model.addAttribute("url","Home Page / Product");
			model.addAttribute("list",productService.findAll());
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
	
	@RequestMapping(value = "images-product",method = RequestMethod.GET)
	public String getImage(@RequestParam("id") int id,Model model, HttpServletRequest request) {
		try {
			model.addAttribute("body",getBody("body_image"));
			model.addAttribute("path", request.getContextPath());
			model.addAttribute("currentPage","Manage Product image");
			model.addAttribute("url","Home Page / Product image");
			model.addAttribute("productId",id);
			model.addAttribute("productName",productService.findById(id).get().getName());
			model.addAttribute("list",imageService.findByProduct(productService.findById(id)));
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
	
	@RequestMapping(value = "product-detail",method = RequestMethod.GET)
	public String getShop(@RequestParam("id") int id,Model model, HttpServletRequest request) {
		try {
			if(productService.findById(id) == null) {
				return "redirect:/index";
			}else {
				Tbl_User sessionUser = (Tbl_User) request.getSession().getAttribute("userSession");
				if(sessionUser!=null) {
					String str = "<a href='"+request.getContextPath()+"/users-detail' class='login-link'><i class='biolife-icon icon-login'></i>"+sessionUser.getUsername()+"</a>";
					model.addAttribute("changeHeader",str);
				}else {
					String str = "<a href='"+request.getContextPath()+"/login' class='login-link'><i class='biolife-icon icon-login'></i>Login/Register</a>";
					model.addAttribute("changeHeader",str);
				}
				Tbl_Product product = productService.findById(id).get();
				model.addAttribute("product",product);
				List<Rate> rates =  new ArrayList<Rate>();
				List<Tbl_Comment> comments = commentService.findByProduct(product);
				for(Tbl_Comment c: comments) {
					Rate rate = new Rate();
					rate.setCmt(c.getContent());
					if(voteService.findByProductAndUser(product,c.getTblUser()).isEmpty()) {
						rate.setRating(0);
					}else {
						rate.setRating(voteService.findByProductAndUser(product,c.getTblUser()).get(0).getStar());
					}
					rate.setUser(c.getTblUser().getUsername());
					rate.setTime(c.getCreateTime());
					rates.add(rate);
				}
				
				model.addAttribute("categories",categoryService.findAll());
				model.addAttribute("manufacturers",manufacturerService.findAll());

				if(voteService.findByProduct(product).size() < 1) {
					model.addAttribute("avgRating", 0);
					model.addAttribute("avgStar", 0);
					model.addAttribute("starRating1",0);
					model.addAttribute("starRating2",0);
					model.addAttribute("starRating3",0);
					model.addAttribute("starRating4",0);
					model.addAttribute("starRating5",0);
				}else {
					model.addAttribute("avgRating", voteService.findTotalRating(product));
					model.addAttribute("avgStar", (int)voteService.findTotalRating(product));
					model.addAttribute("starRating1",(int)(voteService.findBy1Star(product).size()*100/voteService.findByProduct(product).size()));
					model.addAttribute("starRating2",(int)(voteService.findBy2Star(product).size()*100/voteService.findByProduct(product).size()));
					model.addAttribute("starRating3",(int)(voteService.findBy3Star(product).size()*100/voteService.findByProduct(product).size()));
					model.addAttribute("starRating4",(int)(voteService.findBy4Star(product).size()*100/voteService.findByProduct(product).size()));
					model.addAttribute("starRating5",(int)(voteService.findBy5Star(product).size()*100/voteService.findByProduct(product).size()));
				}
				
				model.addAttribute("comments", rates);
				model.addAttribute("url","Home Page / Product information / "+productService.findById(id).get().getName());
				model.addAttribute("relatedProducts", productService.findByCategoryAndManufacturer(product.getTblCategory(), product.getTblManufacturer()));
				model.addAttribute("body",IndexController.getBody("body_product_detail"));
				model.addAttribute("path",request.getContextPath());
				return "index";
			}
		}catch(Exception e) {
			return "redirect:/error-page";
		}
		
	}

	
	public static String getBody(String body) {
		return body+".jsp";
	}
}
