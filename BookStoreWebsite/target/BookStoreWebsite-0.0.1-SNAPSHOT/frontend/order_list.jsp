<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>My Order History - EverGreenBook</title>
<link rel="icon" href="images/favicon.ico">
<!-- bootstrap -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/css/bootstrap.min.css" rel="stylesheet">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/animate.css/3.7.2/animate.min.css">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/gh/shishirraven/animate-on-scroll@v1.2/animation_utility.css">
<link rel="stylesheet" href="css/styles.css">
<!-- google font -->
<link href="https://fonts.googleapis.com/css2?family=Montserrat:wght@100;300;400;500;900&family=Ubuntu:wght@300;400;700&display=swap" rel="stylesheet">
<!-- font Awesome -->
<script src="https://kit.fontawesome.com/c65095b9a1.js"></script>
<!-- bootstrapcdn -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
<!-- animation -->
<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/3.3.7/js/bootstrap.min.js"></script>
<script src="https://cdn.jsdelivr.net/gh/shishirraven/animate-on-scroll@v1.0/oyethemes_onscroll_animation.js"></script>
</head>
<body>
	<jsp:include page="header.jsp"></jsp:include>
	<section class="section-2" id="features">
		<div class="bg-blue">
			<div class="container2 py-5">
				<div class="container pb-5 mb-5">
					<div class="d-flex flex-column mb-5 pb-5">
						<c:if test="${fn:length(listOrders) == 0}">
							<h3 class="center" style="margin: 150px 0;">You have not any placed orders!</h3>
						</c:if>
						<c:if test="${fn:length(listOrders) != 0}">
							<div class="mb-5">
								<h3>Order history</h3>
							</div>
							<div class="table-responsive-xxl">
								<table class="table table-striped table-hover mb-5 pb-5">
									<thead>
										<tr>
											<th scope="col">Index</th>
											<th scope="col">Order ID</th>
											<th scope="col">Quantity</th>
											<th scope="col">Total Amount</th>
											<th scope="col">Order Date</th>
											<th scope="col">Status</th>
											<th></th>
										</tr>
									</thead>
									<tbody>
										<c:forEach var="order" items="${listOrders}" varStatus="status">
											<tr class="border-bot">
												<th scope="row">${status.index + 1}</th>
												<td>${order.orderId}</td>
												<td>${order.bookCopies}</td>
												<td><span><fmt:formatNumber value="${order.total}" type="currency" /></span></td>
												<td><span>${order.orderDate}</span></td>
												<td><span>${order.status}</span></td>
												<td><a href="show_order_detail?id=${order.orderId}">Detail</a></td>
											</tr>
										</c:forEach>
									</tbody>
								</table>
							</div>
						</c:if>
					</div>
				</div>
			</div>
		</div>
	</section>
	<jsp:include page="footer.jsp"></jsp:include>
	<script type="text/javascript">
		$(document).ready(function() {
			$(window).on("load", function() {
				$(window).scrollTop($('#features').position().top);
			});

		});
	</script>
</body>
</html>