package com.jsfw.controllers;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.jsfw.config.ConvertPasswordToMD5;
import com.jsfw.models.Tbl_Order;
import com.jsfw.models.Tbl_Order_Detail;
import com.jsfw.models.Tbl_Product;
import com.jsfw.models.Tbl_User;
import com.jsfw.services.CategoryService;
import com.jsfw.services.ManufacturerService;
import com.jsfw.services.OrderDetailService;
import com.jsfw.services.OrderService;
import com.jsfw.services.ProductService;
import com.jsfw.services.UserService;

@Controller
public class UserController {

	@Autowired
	CategoryService categoryService;
	@Autowired
	ManufacturerService manufacturerService;
	@Autowired
	OrderService orderService;
	@Autowired
	OrderDetailService orderDetailService;
	@Autowired
	UserService userService;
	@Autowired
	ProductService productService;

	@RequestMapping(value = "client-logout", method = RequestMethod.GET)
	public String getLogOut(HttpServletRequest request) {
		try {
			request.getSession().setAttribute("userSession", null);
			return "redirect:/index";
		}catch(Exception e) {
			return "redirect:/error-page";
		}
	}

	@RequestMapping(value = "users-detail", method = RequestMethod.GET)
	public String logOut(HttpServletRequest request, Model model) {
		try {
			// Xử lý header user login
			Tbl_User sessionUser = (Tbl_User) request.getSession().getAttribute("userSession");
			if (sessionUser != null) {
				String str = "<a href='" + request.getContextPath()
						+ "/users-detail' class='login-link'><i class='biolife-icon icon-login'></i>"
						+ sessionUser.getUsername() + "</a>";
				model.addAttribute("changeHeader", str);
			} else {
				String str = "<a href='" + request.getContextPath()
						+ "/login' class='login-link'><i class='biolife-icon icon-login'></i>Login/Register</a>";
				model.addAttribute("changeHeader", str);
			}

			// Set model
			List<Tbl_Order> orders = orderService.findByUser(sessionUser);
			model.addAttribute("user", sessionUser);
			model.addAttribute("orders", orders);
			model.addAttribute("url", "Home Page / User information");
			model.addAttribute("categories", categoryService.findAll());
			model.addAttribute("manufacturers", manufacturerService.findAll());
			model.addAttribute("body", IndexController.getBody("body_user_detail"));
			model.addAttribute("path", request.getContextPath());
			return "index";
		}catch(Exception e) {
			return "redirect:/error-page";
		}
	}

	@RequestMapping(value = "user-change-status-order", method = RequestMethod.GET)
	public String changeStatusOrder(@RequestParam("orderId") int orderId, HttpServletRequest request, Model model) {
		try {
			// Xử lý header user login
			Tbl_User sessionUser = (Tbl_User) request.getSession().getAttribute("userSession");
			if (sessionUser != null) {
				String str = "<a href='" + request.getContextPath()
						+ "/users-detail' class='login-link'><i class='biolife-icon icon-login'></i>"
						+ sessionUser.getUsername() + "</a>";
				model.addAttribute("changeHeader", str);
			} else {
				String str = "<a href='" + request.getContextPath()
						+ "/login' class='login-link'><i class='biolife-icon icon-login'></i>Login/Register</a>";
				model.addAttribute("changeHeader", str);
			}

			Tbl_Order order = orderService.findById(orderId);
			if (order.getStatus() == 0) {
				order.setStatus(3);
				orderService.create(order);
				List<Tbl_Order_Detail> orderDetails = orderDetailService.findByOrder(order);
				for(Tbl_Order_Detail od:orderDetails) {
					Tbl_Product product = od.getTblProduct();
					product.setAmount(product.getAmount()+od.getAmount());
					productService.edit(product);
				}
			}
			// Set model
			List<Tbl_Order> orders = orderService.findByUser(sessionUser);
			model.addAttribute("user", sessionUser);
			model.addAttribute("orders", orders);
			model.addAttribute("url", "Home Page / User information");
			model.addAttribute("categories", categoryService.findAll());
			model.addAttribute("manufacturers", manufacturerService.findAll());
			model.addAttribute("body", IndexController.getBody("body_user_detail"));
			model.addAttribute("path", request.getContextPath());
			return "index";
		}catch(Exception e) {
			return "redirect:/error-page";
		}
	}

	@RequestMapping(value = "user-order-detail", method = RequestMethod.GET)
	public String getUserOrderDetail(@RequestParam("orderId") int orderId, HttpServletRequest request, Model model) {
		try {
			// Xử lý header user login
			Tbl_User sessionUser = (Tbl_User) request.getSession().getAttribute("userSession");
			if (sessionUser != null) {
				String str = "<a href='" + request.getContextPath()
						+ "/users-detail' class='login-link'><i class='biolife-icon icon-login'></i>"
						+ sessionUser.getUsername() + "</a>";
				model.addAttribute("changeHeader", str);
			} else {
				String str = "<a href='" + request.getContextPath()
						+ "/login' class='login-link'><i class='biolife-icon icon-login'></i>Login/Register</a>";
				model.addAttribute("changeHeader", str);
			}

			Tbl_Order order = orderService.findById(orderId);

			// Set model
			List<Tbl_Order_Detail> orderDetails = orderDetailService.findByOrder(order);
			model.addAttribute("user", sessionUser);
			model.addAttribute("orders", orderDetails);
			model.addAttribute("url", "Home Page / User information / Order Details");
			model.addAttribute("categories", categoryService.findAll());
			model.addAttribute("manufacturers", manufacturerService.findAll());
			model.addAttribute("body", IndexController.getBody("body_user_order_detail"));
			model.addAttribute("path", request.getContextPath());
			return "index";
		}catch(Exception e) {
			return "redirect:/error-page";
		}
	}

	@RequestMapping(value = "user-update-info", method = RequestMethod.GET)
	public String getEditUserClient(HttpServletRequest request, Model model) {
		try {
			// Xử lý header user login
			Tbl_User sessionUser = (Tbl_User) request.getSession().getAttribute("userSession");
			if (sessionUser != null) {
				String str = "<a href='" + request.getContextPath()
						+ "/users-detail' class='login-link'><i class='biolife-icon icon-login'></i>"
						+ sessionUser.getUsername() + "</a>";
				model.addAttribute("changeHeader", str);
			} else {
				String str = "<a href='" + request.getContextPath()
						+ "/login' class='login-link'><i class='biolife-icon icon-login'></i>Login/Register</a>";
				model.addAttribute("changeHeader", str);
			}

			// Set model
			model.addAttribute("user", sessionUser);
			model.addAttribute("url", "Home Page / User information / Update / " + sessionUser.getUsername());
			model.addAttribute("categories", categoryService.findAll());
			model.addAttribute("manufacturers", manufacturerService.findAll());
			model.addAttribute("body", IndexController.getBody("body_user_edit"));
			model.addAttribute("path", request.getContextPath());
			return "index";
		}catch(Exception e) {
			return "redirect:/error-page";
		}
	}

	@RequestMapping(value = "save-edit-user-client", method = RequestMethod.POST)
	public String postUpdateUserClient(@ModelAttribute("user") Tbl_User user, HttpServletRequest request, Model model) {
		try {
			userService.edit(user);
			Tbl_User userUpdated = userService.findById(user.getId()).get();
			request.getSession().setAttribute("userSession", userUpdated);
			return "redirect:/users-detail";
		}catch(Exception e) {
			return "redirect:/error-page";
		}
	}

	@RequestMapping(value = "user-change-password", method = RequestMethod.GET)
	public String getChangePasswordClient(HttpServletRequest request, Model model) {
		try {
			// Xử lý header user login
			Tbl_User sessionUser = (Tbl_User) request.getSession().getAttribute("userSession");
			if (sessionUser != null) {
				String str = "<a href='" + request.getContextPath()
						+ "/users-detail' class='login-link'><i class='biolife-icon icon-login'></i>"
						+ sessionUser.getUsername() + "</a>";
				model.addAttribute("changeHeader", str);
			} else {
				String str = "<a href='" + request.getContextPath()
						+ "/login' class='login-link'><i class='biolife-icon icon-login'></i>Login/Register</a>";
				model.addAttribute("changeHeader", str);
			}

			// Set model
			model.addAttribute("mess", null);
			model.addAttribute("url", "Home Page / User information / Change password / " + sessionUser.getUsername());
			model.addAttribute("categories", categoryService.findAll());
			model.addAttribute("manufacturers", manufacturerService.findAll());
			model.addAttribute("body", IndexController.getBody("body_change_password"));
			model.addAttribute("path", request.getContextPath());
			return "index";
		}catch(Exception e) {
			return "redirect:/error-page";
		}
	}

	@RequestMapping(value = "save-change-password-client", method = RequestMethod.POST)
	public String postChangePasswordClient(HttpServletRequest request, Model model) {
		try {
			// Xử lý header user login
			Tbl_User sessionUser = (Tbl_User) request.getSession().getAttribute("userSession");
			if (sessionUser != null) {
				String str = "<a href='" + request.getContextPath()
						+ "/users-detail' class='login-link'><i class='biolife-icon icon-login'></i>"
						+ sessionUser.getUsername() + "</a>";
				model.addAttribute("changeHeader", str);
			} else {
				String str = "<a href='" + request.getContextPath()
						+ "/login' class='login-link'><i class='biolife-icon icon-login'></i>Login/Register</a>";
				model.addAttribute("changeHeader", str);
			}
			
			String oldPassString = request.getParameter("passOld");
			String newPassString = request.getParameter("passNew");
			
			if (sessionUser.getPassword().endsWith(ConvertPasswordToMD5.ConvertToMD5(oldPassString))) {
				sessionUser.setPassword(ConvertPasswordToMD5.ConvertToMD5(newPassString));
				userService.edit(sessionUser);
				Tbl_User userUpdated = userService.findById(sessionUser.getId()).get();
				request.getSession().setAttribute("userSession", userUpdated);
				return "redirect:/users-detail";
			} else {
				model.addAttribute("mess", "Old password is incorrect");
				model.addAttribute("url", "Home Page / User information / Change password / " + sessionUser.getUsername());
				model.addAttribute("categories", categoryService.findAll());
				model.addAttribute("manufacturers", manufacturerService.findAll());
				model.addAttribute("body", IndexController.getBody("body_change_password"));
				model.addAttribute("path", request.getContextPath());
				return "index";
			}
		}catch(Exception e) {
			return "redirect:/error-page";
		}
	}

}
