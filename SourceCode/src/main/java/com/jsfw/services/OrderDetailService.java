package com.jsfw.services;

import java.util.List;

import org.springframework.stereotype.Service;

import com.jsfw.models.Tbl_Order;
import com.jsfw.models.Tbl_Order_Detail;

public interface OrderDetailService {
	public List<Tbl_Order_Detail> findAll();
	public void create(Tbl_Order_Detail order_Detail);
	public List<Tbl_Order_Detail> findByOrder(Tbl_Order order);
}
