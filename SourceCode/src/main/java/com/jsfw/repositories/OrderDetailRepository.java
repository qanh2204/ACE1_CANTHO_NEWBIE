package com.jsfw.repositories;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.jsfw.models.Tbl_Order;
import com.jsfw.models.Tbl_Order_Detail;

@Repository
public interface OrderDetailRepository extends JpaRepository<Tbl_Order_Detail, Integer>{
	List<Tbl_Order_Detail> findByTblOrder(Tbl_Order order);
}
