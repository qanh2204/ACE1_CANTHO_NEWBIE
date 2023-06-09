package com.jsfw.services.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.stereotype.Service;

import com.jsfw.models.Tbl_Order;
import com.jsfw.models.Tbl_Order_Detail;
import com.jsfw.repositories.OrderDetailRepository;
import com.jsfw.services.OrderDetailService;
@Service
public class OrderDetailServiceImpl implements OrderDetailService{

	@Autowired
	OrderDetailRepository repository;
	
	@Override
	public List<Tbl_Order_Detail> findAll() {
		return repository.findAll();
	}

	@Override
	public void create(Tbl_Order_Detail order_Detail) {
		repository.save(order_Detail);
	}

	@Override
	public List<Tbl_Order_Detail> findByOrder(Tbl_Order order) {
		return repository.findByTblOrder(order);
	}

}
