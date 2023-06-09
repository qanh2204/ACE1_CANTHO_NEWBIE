<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<div class="container-fluid py-4">
	<div class="row">
		<div class="col-12">
			<div class="card mb-4">
				<div class="card-header pb-0">
					<h6>Product's name: ${product.name}</h6>
					<a href="${path}/products"
						class="text-success font-weight-bold text-xs"
						data-toggle="tooltip" data-original-title="Back"> <img
						alt="Trở lại" src="../images/icon/icon-back.png" width="25px"
						height="25px">
					</a>
				</div>
				<div class="card-body px-0 pt-0 pb-2">
					<div class="p-0 align-items-center mx-4 mt-2">
						<label>Product's name</label>
						<div class="mb-3 mx-1">${product.name}</div>
						<label>Price</label>
						<div class="mb-3 mx-1">${product.price}$</div>
						<label>Amount</label>
						<div class="mb-3 mx-1">${product.amount}</div>
						<label>Product introduction</label>
						<div class="mb-3 mx-1">${product.description}</div>
						<label>Category</label>
						<div class="mb-3 mx-1">${product.tblCategory.name}</div>
						<label>Manufacturer</label>
						<div class="mb-3 mx-1">${product.tblManufacturer.name}</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>
