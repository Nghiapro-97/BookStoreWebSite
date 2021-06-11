<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>EverGreenBook AdminStration</title>
<link rel="icon" href="../images/favicon.ico">
<!-- bootstrap -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/css/bootstrap.min.css" rel="stylesheet">
<link rel="stylesheet" href="../css/admin.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.12.0-2/css/all.min.css">
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.5.1/jquery.min.js" charset="utf-8"></script>
</head>
<body>
	<jsp:include page="header.jsp"></jsp:include>
	<div class="container">
		<div class="d-grid gap-2 d-md-block pt-6" align="center">
			<button id="btn-newBook" class="btn btn-lg btn-light shadow p-3 me-2 bg-body rounded rounded-pill">
				<div class="d-flex justify-content-between mx-1">
					<i class="fas fa-circle pe-3 align-self-center" style="font-size: 10px; color: #6610f2;"></i>
					<small class="fw-bolder">New Book</small> 
					<i class="fas fa-book fs-5 ps-3 align-self-center" style="color: #6610f2;"></i>
				</div>
			</button>
			<button id="btn-newUser" class="btn btn-lg btn-light shadow p-3 me-2 bg-body rounded rounded-pill">
				<div class="d-flex justify-content-between mx-1">
					<i class="fas fa-circle pe-3 align-self-center" style="font-size: 10px; color: #35b653;"></i>
					<small class="fw-bolder">New User</small> 
					<i class="fas fa-user fs-5 ps-3 align-self-center" style="color: #35b653;"></i>
				</div>
			</button>
			<button id="btn-newCategory" class="btn btn-lg btn-light shadow p-3 me-2 bg-body rounded rounded-pill">
				<div class="d-flex justify-content-between mx-1">
					<i class="fas fa-circle pe-3 align-self-center" style="font-size: 10px; color: #0D6EFD;"></i>
					<small class="fw-bolder">New Category</small> 
					<i class="fas fa-list fs-5 ps-3 align-self-center" style="color: #0D6EFD;"></i>
				</div>
			</button>
			<button id="btn-newCustomer" class="btn btn-lg btn-light shadow p-3 bg-body rounded rounded-pill">
				<div class="d-flex justify-content-between mx-1">
					<i class="fas fa-circle pe-3 align-self-center" style="font-size: 10px; color: #dc3545;"></i>
					<small class="fw-bolder">New Customer</small> 
					<i class="fas fa-user-tie fs-5 ps-3 align-self-center" style="color: #dc3545;"></i>
				</div>
			</button>
		</div>
		<div class="table-responsive-lg my-5 shadow p-3 mb-5 bg-body rounded">
			<table class="table table-hover table-striped caption-top">
				<caption class="fs-3 text-center">Recent Sales</caption>
				<thead>
					<tr>
						<th scope="col">Id</th>
						<th scope="col">Customer</th>
						<th scope="col">Quantity</th>
						<th scope="col">Total</th>
						<th scope="col">Payment</th>
						<th scope="col">Status</th>
						<th scope="col">Date</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach var="order" items="${listMostRecentSales}" varStatus="status">
						<tr class="even">
							<th scope="row"><a href="view_order?id=${order.orderId}">${order.orderId}</a></th>
							<td>${order.customer.fullname}</td>
							<td>${order.bookCopies}</td>
							<td><fmt:formatNumber value="${order.total}" type="currency" /></td>
							<td>${order.paymentMethod}</td>
							<td>${order.status}</td>
							<td>${order.orderDate}</td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
		</div>
		<div class="table-responsive-lg shadow p-3 mb-5 bg-body rounded">
			<table class="table table-hover table-striped caption-top">
				<caption class="fs-3 text-center">Recent Reviews</caption>
				<thead>
					<tr>
						<th scope="col">No</th>
						<th scope="col">Book</th>
						<th scope="col">Rating</th>
						<th scope="col">Headline</th>
						<th scope="col">Customer</th>
						<th scope="col">Review On</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach var="review" items="${listMostRecentReviews}" varStatus="status">
						<tr>
							<th scope="row">${status.index +1}</th>
							<td>${review.book.title}</td>
							<td>${review.rating}</td>
							<td><a href="edit_review?id=${review.reviewId}">${review.headline}</a></td>
							<td>${review.customer.fullname}</td>
							<td><fmt:formatDate pattern="MM/dd/yyyy" value='${review.reviewTime}' /></td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
		</div>
		<div class="table-responsive-lg my-5 shadow p-3 mb-5 bg-body rounded">
			<table class="table table-hover table-striped caption-top">
				<caption class="fs-3 text-center">Recent Reviews</caption>
				<thead>
					<tr>
						<th scope="col">Total Users: ${totalUser}</th>
						<th scope="col">Total Books: ${totalBook}</th>
						<th scope="col">Total Customers: ${totalCustomer}</th>
						<th scope="col">Total Reviews: ${totalReview}</th>
						<th scope="col">Total Orders: ${totalOrder}</th>
					</tr>
				</thead>
			</table>
		</div>
	</div>
	<script type="text/javascript">
		function fun() {
			if (${category != null}) {
				document.categoryForm.action = "update_category";
			}else {
				document.categoryForm.action = "create_category";
			}
		};
	
		$(document).ready(function() {
			$("#btn-newBook").click(function() {
				window.location = 'new_book';
			});
			
			$("button")
			  .mouseover(function() {
				  $(this).addClass("shadow-sm");
			  })
			  .mouseout(function() {
				  $(this).removeClass("shadow-sm");
			});
						
			$("#btn-newUser").click(function() {
				window.location = 'user_form.jsp';
			});

			$("#btn-newCategory").click(function() {
				window.location = 'category_form.jsp';
			});

			$("#btn-newCustomer").click(function() {
				window.location = 'new_customer';
			});

		});
	</script>
</body>
</html>