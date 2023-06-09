package com.jsfw.services;

import java.util.List;

import org.springframework.stereotype.Service;

import com.jsfw.models.Tbl_Order;
import com.jsfw.models.Tbl_User;


public interface OrderService {
	
	public List<Tbl_Order> findAll();
	public void create(Tbl_Order order);
	public Tbl_Order findById(Integer id);
	public List<Tbl_Order> findByUser(Tbl_User user);
}
