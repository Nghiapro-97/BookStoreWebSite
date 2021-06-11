<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>create new user</title>
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
			<div class="text-center mb-5 border-bottom shadow p-3 mb-5 bg-body rounded">
				<c:if test="${user != null}">
					<div class="d-flex justify-content-between mx-1">
						<i class="fas fa-circle pe-3 align-self-center" style="font-size: 15px; color: #35b653;"></i>
						<h3>Edit User</h3>
						<i class="fas fa-user fs-4 ps-3 align-self-center" style="color: #35b653;"></i>
					</div>
				</c:if>
				<c:if test="${user == null}">
					<div class="d-flex justify-content-between mx-1">
						<i class="fas fa-circle pe-3 align-self-center" style="font-size: 15px; color: #35b653;"></i>
						<h3>Create New User</h3>
						<i class="fas fa-user fs-4 ps-3 align-self-center" style="color: #35b653;"></i>
					</div>
				</c:if>
			</div>
			<div class="shadow p-3 mb-5 bg-body rounded">
				<form method="post" id="userForm" name="userForm">
					<input type="hidden" name="userId" value="${user.userId}" /> 
					<div class="form-floating mb-3">
						<input type="email" class="form-control" name="email" placeholder="Email" id="email" value="${user.email}" required> 
						<label for="email">Email</label>
					</div>					
					<div class="form-floating mb-3">
						<input type="text" class="form-control" name="fullName" id="fullName" value="${user.fullName}" placeholder="Full Name" required> 
						<label for="fullName">Full name</label>
					</div>					
					<div class="form-floating mb-3">
						<input type="password" class="form-control" name="password" id="password" value="${user.password}" placeholder="Password">
						<label for="password">Password</label>
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
			if (${user != null}) {
				document.userForm.action = "update_user";
			}else {
				document.userForm.action = "create_user";
			}
		};
	
        $(document).ready(function () {
			$("#cancel").click(function(){
				history.go(-1);
			});
        });
    </script>
</body>
</html>