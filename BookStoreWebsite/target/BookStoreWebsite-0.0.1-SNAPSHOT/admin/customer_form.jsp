<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<link rel="icon" href="../images/favicon.ico">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/css/bootstrap.min.css" rel="stylesheet">
<link rel="stylesheet" href="../css/admin.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.12.0-2/css/all.min.css">
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.5.1/jquery.min.js" charset="utf-8"></script>
</head>
<body>
	<jsp:include page="header.jsp"></jsp:include>
	<div class="container">
		<div class="mt-5">
			<div class="text-center mb-5 border-bottom shadow p-3 mb-5 bg-body rounded">
				<c:if test="${customer != null}">
					<div class="d-flex justify-content-between mx-1">
						<i class="fas fa-circle pe-3 align-self-center" style="font-size: 15px; color: #dc3545;"></i>
						<h3>Edit customer</h3>
						<i class="fas fa-user-tie fs-4 ps-3 align-self-center" style="color: #dc3545;"></i>
					</div>
				</c:if>
				<c:if test="${customer == null}">
					<div class="d-flex justify-content-between mx-1">
						<i class="fas fa-circle pe-3 align-self-center" style="font-size: 15px; color: #dc3545;"></i>
						<h3>Create New customer</h3>
						<i class="fas fa-user-tie fs-4 ps-3 align-self-center" style="color: #dc3545;"></i>
					</div>
				</c:if>
			</div>
			<div class="shadow p-3 mb-5 bg-body rounded">
				<div class="form-outer d-flex justify-content-center">
				<form method="post" id="customerForm ">
					<jsp:directive.include file="../common/customer_form.jsp"/>
					<div class="d-grid gap-2 d-md-flex mt-5">
						<button class="btn btn-lg btn-outline-success flex-fill" type="button" id="cancel">Cancel</button>
						<button class="btn btn-lg btn-success flex-fill" type="submit" id="submit" onclick="return fun()">Save</button>
					</div>
				</form>
				</div>
			</div>
		</div>
	</div>
	<script type="text/javascript">
		function fun() {
			if (${customer != null}) { 
				document.bookForm.action = "update_customer";
			}else {
				document.bookForm.action = "create_customer";
			}
		};
		$(document).ready(function(){
			$("#cancel").click(function(){
				history.go(-1);
			});
		});
	</script>
	<script src="../js/customer_form.js"></script>
</body>
</html>