<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Manage Category - EverGreenBook Admin</title>
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
		<div class="mt-5">
			<div class="mb-5 row">
				<div class="col-sm-8 d-flex align-items-center">
					<div class="d-grid gap-2 d-md-flex justify-content-md-start">
						<c:if test="${message != null}">
							<svg xmlns="http://www.w3.org/2000/svg" style="display: none;">
								  <symbol id="check-circle-fill" fill="currentColor" viewBox="0 0 16 16">
								    <path
									d="M16 8A8 8 0 1 1 0 8a8 8 0 0 1 16 0zm-3.97-3.03a.75.75 0 0 0-1.08.022L7.477 9.417 5.384 7.323a.75.75 0 0 0-1.06 1.06L6.97 11.03a.75.75 0 0 0 1.079-.02l3.992-4.99a.75.75 0 0 0-.01-1.05z" />
								  </symbol>
								</svg>
							<div class="alert alert-success d-flex align-items-center" role="alert">
								<svg class="bi flex-shrink-0 me-2" width="24" height="24" role="img" aria-label="Success:">
									<use xlink:href="#check-circle-fill" /></svg>
								<div class="flex-fill">${message}</div>
							</div>
						</c:if>
					</div>
				</div>
				<div class="col-sm-4">
					<div class="d-grid gap-2 d-md-flex justify-content-md-end">
						<button id="btn-newCategory" class="btn btn-lg btn-light shadow p-3 me-2 bg-body rounded rounded-pill">
							<div class="d-flex justify-content-between mx-1">
								<i class="fas fa-circle pe-3 align-self-center" style="font-size: 10px; color: #0D6EFD;"></i> <small class="fw-bolder">New Category</small> <i class="fas fa-list fs-5 ps-3 align-self-center"
									style="color: #0D6EFD;"></i>
							</div>
						</button>
					</div>
				</div>
			</div>
			<div class="table-responsive-lg shadow p-3 mb-5 bg-body rounded">
				<table class="table table-hover table-striped caption-top">
					<caption class="fs-3 text-left">
						<span>List categories</span> 
					</caption>
					<thead>
						<tr>
							<th scope="col">Index</th>
							<th scope="col">ID</th>
							<th scope="col">Category Name</th>
							<th scope="col">Action</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach var="category" items="${listCategory}" varStatus="status">
							<tr class="even">
								<th scope="row">${status.index + 1}</th>
								<td>${category.categoryId}</td>
								<td>${category.name}</td>
								<td>
									<a href="edit_category?id=${category.categoryId}" class="edit-btn me-5">Edit</a>
									<a href="javascript:confirmDelete(${category.categoryId})" class="delete-btn">Delete</a>
								</td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
			</div>
		</div>
	</div>
	<script type="text/javascript">
		$(document).ready(function() {
			$("#btn-newCategory").click(function() {
				window.location = 'category_form.jsp';
			});
		});

		function confirmDelete(categoryId) {
			if (confirm("Are you sure you want to delete the category with ID " + categoryId + " ?")) {
				window.location = 'delete_category?id=' + categoryId;
			}
		}
	</script>
</body>
</html>