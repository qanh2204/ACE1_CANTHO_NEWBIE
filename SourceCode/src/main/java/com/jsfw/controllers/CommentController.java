package com.jsfw.controllers;

import java.io.IOException;
import java.sql.Date;
import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Sort;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.jsfw.models.Rate;
import com.jsfw.models.Tbl_Comment;
import com.jsfw.models.Tbl_Product;
import com.jsfw.models.Tbl_User;
import com.jsfw.models.Tbl_Vote;
import com.jsfw.services.CommentService;
import com.jsfw.services.ProductService;
import com.jsfw.services.VoteService;

@Controller
@RequestMapping(value = "/comments/")
public class CommentController {

	@Autowired
	CommentService commentService;
	@Autowired
	ProductService productService;
	@Autowired
	VoteService voteService;
	
	@RequestMapping(value = "check-login",method = RequestMethod.POST)
	@ResponseBody
	public String checkLogin(@RequestBody String data,HttpServletRequest request){
		try {
			Tbl_User userSessionTbl_User = (Tbl_User)request.getSession().getAttribute("userSession");
			if(userSessionTbl_User == null) {
				return request.getContextPath()+"/login";
			}else {
				return "true";
			}
		}catch(Exception e) {
			return "redirect:/error-page";
		}
	}
	 
	@RequestMapping(value = "product-detail",method = RequestMethod.POST)
	@ResponseBody
	public List<Rate> postCommentProductDetail(@RequestBody Map<String, String> data,HttpServletRequest request){
		int productId = Integer.valueOf(data.get("productId"));
		int rating = Integer.valueOf(data.get("rating"));
		String cmt = data.get("cmt");
		Tbl_User user = (Tbl_User)request.getSession().getAttribute("userSession");
		List<Tbl_Vote> votes = voteService.findByProductAndUser(productService.findById(productId).get(), user);
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		Timestamp timestamp = new Timestamp(System.currentTimeMillis());
		if(rating > 0) {
			if(votes.isEmpty()) {
				//Thêm rating cho sản phẩm lần đầu được user vote star
				Tbl_Vote ratingTbl_Vote = new Tbl_Vote();
				ratingTbl_Vote.setStar(rating);
				ratingTbl_Vote.setTblProduct(productService.findById(productId).get());
				ratingTbl_Vote.setTblUser(user);
				ratingTbl_Vote.setCreateTime(sdf.format(timestamp));
				voteService.create(ratingTbl_Vote);
				
			}else {
				//Thêm rating cho sản phẩm
				Tbl_Vote vote = votes.get(0);
				vote.setStar(rating);
				vote.setCreateTime(sdf.format(timestamp));
				voteService.edit(vote);
			}
		}
		
		//Thêm comment cho sản phẩm
		Tbl_Comment tbl_Comment = new Tbl_Comment();
		tbl_Comment.setTblProduct(productService.findById(productId).get());
		tbl_Comment.setTblUser(user);
		tbl_Comment.setContent(cmt);
		tbl_Comment.setCreateTime(sdf.format(timestamp));
		commentService.create(tbl_Comment);
		
		List<Rate> rates =  new ArrayList<Rate>();
		List<Tbl_Comment> comments = commentService.findByProduct(productService.findById(productId).get());
		for(Tbl_Comment c: comments) {
			Rate rate = new Rate();
			rate.setCmt(c.getContent());
			rate.setRating(voteService.findByProductAndUser(productService.findById(productId).get(),c.getTblUser()).get(0).getStar());
			rate.setUser(c.getTblUser().getUsername());
			rate.setTime(c.getCreateTime());
			rates.add(rate);
		}

		return rates;
	}
}
