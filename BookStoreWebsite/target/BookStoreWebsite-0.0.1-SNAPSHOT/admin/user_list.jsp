<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Manage User - EverGreenBook Admin</title>
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
		<div class="pt-6">
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
						<button id="btn-newUser" class="btn btn-lg btn-light shadow p-3 me-2 bg-body rounded rounded-pill">
							<div class="d-flex justify-content-between mx-1">
								<i class="fas fa-circle pe-3 align-self-center" style="font-size: 10px; color: #35b653;"></i> 
								<small class="fw-bolder">New User</small> 
								<i class="fas fa-user fs-5 ps-3 align-self-center" style="color: #35b653;"></i>
							</div>
						</button>
					</div>
				</div>
			</div>
			<div class="table-responsive-lg shadow p-3 mb-5 bg-body rounded">
				<table class="table table-hover table-striped caption-top">
					<caption class="fs-3 text-left">
						<span>List users</span>
					</caption>
					<thead>
						<tr>
							<th scope="col">Index</th>
							<th scope="col">Id</th>
							<th scope="col">Email</th>
							<th scope="col">FullName</th>
							<th scope="col">Action</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach var="user" items="${listUsers}" varStatus="status">
							<tr>
								<th scope="row">${status.index +1}</th>
								<td>${user.userId}</td>
								<td>${user.email}</td>
								<td>${user.fullName}</td>
								<td><a href="edit_user?id=${user.userId}" class="edit-btn me-5">Edit</a> <a href="javascript:void(0);" class="deleteLink" id="${user.userId}">Delete</a></td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
			</div>
		</div>
	</div>
	<script>
		$(document).ready(function() {
			$("#btn-newUser").click(function() {
				window.location = 'user_form.jsp';
			});

			$(".deleteLink").each(function() {
				$(this).on("click",function() {
					userId = $(this).attr("id");
					if (confirm('Are you sure you want to delete the user with id ' + userId + '?')) {
						window.location = 'delete_user?id='+ userId;
					}
				});
			});
		});
	</script>
</body>
</html>