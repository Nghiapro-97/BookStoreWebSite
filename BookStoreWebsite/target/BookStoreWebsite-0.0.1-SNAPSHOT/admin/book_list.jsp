<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Manage Book - EverGreenBook Admin</title>
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
						<button id="btn-newBook" class="btn btn-lg btn-light shadow p-3 me-2 bg-body rounded rounded-pill">
							<div class="d-flex justify-content-between mx-1">
								<i class="fas fa-circle pe-3 align-self-center" style="font-size: 10px; color: #6610f2;"></i> <small class="fw-bolder">New Book</small> <i class="fas fa-book fs-5 ps-3 align-self-center"
									style="color: #6610f2;"></i>
							</div>
						</button>
					</div>
				</div>
			</div>
			<div class="table-responsive-lg shadow p-3 mb-5 bg-body rounded">
				<table class="table table-hover table-striped caption-top">
					<caption class="fs-3 text-left">
						<span>List books</span>
					</caption>
					<thead>
						<tr>
							<th scope="col">No</th>
							<th scope="col">Id</th>
							<th scope="col">Images</th>
							<th scope="col">Title</th>
							<th scope="col">Author</th>
							<th scope="col">Category</th>
							<th scope="col">Price</th>
							<th scope="col">Last Update</th>
							<th scope="col">Action</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach var="book" items="${listBooks}" varStatus="status">
							<tr class="even">
								<th scope="row">${status.index +1}</th>
								<td>${book.bookId}</td>
								<td>
									<img class="img-fluid" width="100px" height="200px" src="data:image/jpg;base64,${book.base64Image}" alt="">
								</td>
								<td>
									<div class="title-book">
										<span>${book.title}</span>
									</div>
								</td>
								<td><span>${book.author}</span></td>
								<td><span>${book.category.name}</span></td>
								<td><span><fmt:formatNumber value="${book.price}" type="currency" maxFractionDigits = "2" currencySymbol="$" /></span></td>
								<td><span><fmt:formatDate pattern="MM/dd/yyyy" value='${book.lastUpdateTime}' /></span></td>
								<td>
								<a href="edit_book?id=${book.bookId}" class="edit-btn me-2">Edit</a> 
								<a href="javascript:void(0);" class="deleteLink" id="${book.bookId}">Delete</a>
								</td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
			</div>
		</div>
	</div>
	<script>
		$(document).ready(function(){
			$("#btn-newBook").click(function() {
				window.location = 'new_book';
			});
			
			$(".deleteLink").each(function(){
				$(this).on("click", function(){
					bookId=$(this).attr("id");
					if(confirm('Are you sure you want to delete the book with id ' + bookId + '?')){
						window.location = 'delete_book?id=' + bookId;
					}
				});
			});
		});
	</script>
</body>
</html>