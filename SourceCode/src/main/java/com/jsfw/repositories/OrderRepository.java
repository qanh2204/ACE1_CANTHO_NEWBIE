package com.jsfw.repositories;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.jsfw.models.Tbl_Order;
import com.jsfw.models.Tbl_User;
@Repository
public interface OrderRepository extends JpaRepository<Tbl_Order, Integer>{
	public List<Tbl_Order> findByTblUserOrderByIdDesc(Tbl_User user);
}
