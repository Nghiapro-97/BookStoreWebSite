<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Create New Category</title>
<link rel="icon" href="../images/favicon.ico">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/css/bootstrap.min.css" rel="stylesheet">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.12.0-2/css/all.min.css">
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.5.1/jquery.min.js" charset="utf-8"></script>
<link rel="stylesheet" href="../css/admin.css">
</head>
<body>
	<jsp:include page="header.jsp"></jsp:include>
	<div class="container">
		<div class="pt-6">
			<div class="text-center mb-5 border-bottom shadow p-3 mb-5 bg-body rounded">
				<c:if test="${category != null}">
					<div class="d-flex justify-content-between mx-1">
						<i class="fas fa-circle pe-3 align-self-center" style="font-size: 15px; color: #0D6EFD;"></i>
						<h3>Edit Category</h3>
						<i class="fas fa-list fs-4 ps-3 align-self-center" style="color: #0D6EFD;"></i>
					</div>
				</c:if>
				<c:if test="${category == null}">
					<div class="d-flex justify-content-between mx-1">
						<i class="fas fa-circle pe-3 align-self-center" style="font-size: 15px; color: #0D6EFD;"></i>
						<h3>Create New Category</h3>
						<i class="fas fa-list fs-4 ps-3 align-self-center" style="color: #0D6EFD;"></i>
					</div>
				</c:if>
			</div>
			<div class="shadow p-3 mb-5 bg-body rounded">
				<form method="post" name="categoryForm">
					<input type="hidden" name="categoryId" value="${category.categoryId}" /> 
					<div class="form-floating mb-3">
						<input type="text" class="form-control" name="name" id="name" size="20" value="${category.name}" placeholder="Email" required>
						<label for="name">Name</label>
					</div>
					<div class="d-grid gap-2 d-md-flex">
						<button class="btn btn-lg btn-outline-success flex-fill" type="button" id="cancel">Cancel</button>
						<button class="btn btn-lg btn-success flex-fill" type="submit" id="submit" onclick="return fun()">Save</button>
					</div>
				</form>
			</div>
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
	
		$(document).ready(function(){
			$("#cancel").click(function(){
				history.go(-1);
			});
		});
	</script>
</body>
</html>