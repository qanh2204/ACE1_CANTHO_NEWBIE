package com.jsfw.services.impl;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.jsfw.models.Tbl_Order;
import com.jsfw.models.Tbl_User;
import com.jsfw.repositories.OrderRepository;
import com.jsfw.services.OrderService;
@Service
public class OrderServiceImpl implements OrderService{

	@Autowired
	OrderRepository repository;
	
	@Override
	public List<Tbl_Order> findAll() {
		return repository.findAll();
	}

	@Override
	public void create(Tbl_Order order) {
		repository.save(order);
	}

	@Override
	public Tbl_Order findById(Integer id) {
		return repository.findById(id).get();
	}

	@Override
	public List<Tbl_Order> findByUser(Tbl_User user) {
		return repository.findByTblUserOrderByIdDesc(user);
	}
	
}
