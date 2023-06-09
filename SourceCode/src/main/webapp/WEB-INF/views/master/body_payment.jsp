<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<div class="container-fluid py-4">
	<div class="row">
		<div class="col-12">
			<div class="card mb-4">
				<div class="card-header pb-0">
					<h6>List of payment method</h6>
					<a href="${path}/payments/add" class="text-success font-weight-bold text-xs"
						data-toggle="tooltip" data-original-title="Edit user">Add new</a>
				</div>
				<div class="card-body px-0 pt-0 pb-2">
					<div class="table-responsive p-0">
						<table class="table align-items-center mb-0" id="example">
							<thead>
								<tr>
									<th
										class="text-center text-uppercase text-secondary text-xxs font-weight-bolder opacity-7">Code of payment method</th>
									<th
										class=" text-uppercase text-secondary text-xxs font-weight-bolder opacity-7 ps-2">Name of payment method</th>
									<th class="text-secondary opacity-7"></th>
								</tr>
							</thead>
							<tbody>
								<c:forEach var="item" items="${list}">
									<tr>
										<td class="text-center">
											<p class="text-xs font-weight-bold mb-0">${item.id}</p>
										</td>
										<td>
											<p class="text-xs font-weight-bold mb-0">${item.method}</p>
										</td>
										<td class="align-middle">
										<a href="${path}/payments/edit?id=${item.id}"
											class="text-info font-weight-bold text-xs"
											data-toggle="tooltip" data-original-title="Edit user">
												Edit </a>|<a href="${path}/payments/delete?id=${item.id}"
											class="text-danger font-weight-bold text-xs"
											data-toggle="tooltip" data-original-title="Edit user" onclick="if(!(confirm('Are you sure?'))) return false">
												Delete </a>
												</td>
									</tr>
								</c:forEach>
							</tbody>
						</table>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>
