<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Order Detail - EverGreenBook Admin</title>
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
		<div class="d-grid gap-2 d-md-block my-5" align="center">
			<button id="btn-edit" class="btn btn-lg btn-light shadow p-3 me-2 bg-body rounded rounded-pill">
				<div class="d-flex justify-content-between mx-1">
					<i class="fas fa-circle pe-3 align-self-center" style="font-size: 10px; color: #6610f2;"></i> 
					<small class="fw-bolder">Edit Order</small> 
					<i class="fas fa-edit fs-5 ps-3 align-self-center"
						style="color: #6610f2;"></i>
				</div>
			</button>
			<button id="btn-delete" class="btn btn-lg btn-light shadow p-3 me-2 bg-body rounded rounded-pill">
				<div class="d-flex justify-content-between mx-1">
					<i class="fas fa-circle pe-3 align-self-center" style="font-size: 10px; color: #dc3545;"></i> 
					<small class="fw-bolder">Delete Order</small> 
					<i class="fas fa-trash-alt fs-5 ps-3 align-self-center"
						style="color: #dc3545;"></i>
				</div>
			</button>
			<button id="cancel" class="btn btn-lg btn-light shadow p-3 me-2 bg-body rounded rounded-pill">
				<div class="d-flex justify-content-between mx-1">
					<i class="fas fa-circle pe-3 align-self-center" style="font-size: 10px; color: #0D6EFD;"></i> 
					<small class="fw-bolder">Cancel</small> 
					<i class="fas fa-backward fs-5 ps-3 align-self-center"
						style="color: #0D6EFD;"></i>
				</div>
			</button>
		</div>
		<div class="center">
			<c:if test="${message != null}">
				<h5 class="message">${message}</h5>
			</c:if>
		</div>
		<c:if test="${order == null}">
			<h2 class="center">Sorry, you are not authorized to view this order!</h2>
		</c:if>
		<c:if test="${order != null}">
			<jsp:directive.include file="../common/common_order_detail.jsp" />
		</c:if>
	</div>
	<script type="text/javascript">
		$("#btn-edit").click(function(){
			window.location.href='edit_order?id=${order.orderId}';
		});
		
		$("#cancel").click(function(){
			window.location.href='list_orders';
		});

		$("#btn-delete").each(function(){
			$(this).on("click", function(){
				if(confirm('Are you sure you want to delete the order with id ' + ${order.orderId} + '?')){
					window.location = 'delete_order?id=${order.orderId}';
				}
			});
		});

	
	</script>
</body>
</html>