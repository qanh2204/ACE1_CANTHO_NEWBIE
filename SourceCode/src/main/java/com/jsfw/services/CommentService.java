package com.jsfw.services;

import java.util.List;

import org.springframework.stereotype.Service;

import com.jsfw.models.Tbl_Comment;
import com.jsfw.models.Tbl_Product;

public interface CommentService {	
	public void create(Tbl_Comment comment) ;
	public List<Tbl_Comment> findByProduct(Tbl_Product product);
}
