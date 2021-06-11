<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Shopping cart</title>
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
	<jsp:directive.include file="header.jsp" />
	<section class="section-2" id="features">
		<div class="bg-blue">
			<div class="container2 py-5">
				<c:set var="cart" value="${sessionScope['cart']}"></c:set>
				<c:if test="${cart.totalItems == 0}">
					<jsp:directive.include file="empty_cart.jsp" />
				</c:if>
				<c:if test="${cart.totalItems > 0}">
					<form action="update_cart" method="post" id="cartForm">
						<div class="">
							<div class="row">
								<div class="col-12 ">
									<!-- Heading -->
									<h3 class="mb-10 text-center">Shopping Cart</h3>
								</div>
							</div>
							<div class="row">
								<div class="col-lg-8 col-md-7 pt-2">
									<!-- List group -->
									<ul class="list-group list-group-flush">
										<c:forEach items="${cart.items}" var="item" varStatus="status">
											<li class="list-group-item border-bottom">
												<div class="d-flex justify-content-between align-items-center mt-3 pb-3">
													<div class="d-block d-flex align-items-center text-start">
														<a href="view_book?id=${item.key.bookId}"> 
															<img src="data:image/jpg;base64,${item.key.base64Image}" style="max-width: 90px; max-height: 150px;" alt="..." class="img-fluid">
														</a>
														<div class="pt-2 px-3">
															<h3 class="fs-6 mb-2">
																<a class="text-decoration-none text-reset" href="view_book?id=${item.key.bookId}">${item.key.title}</a>
															</h3>
															<div class="fs-sm">
																<span class="text-muted me-2">By:</span>${item.key.author}</div>
															<div class="fs-lg text-accent pt-4">
																<fmt:formatNumber value="${item.key.price}" type="currency" maxFractionDigits = "3" currencySymbol="$" />
															</div>
														</div>
													</div>
													<div class="ps-3 text-start" style="max-width: 7rem;">
														<input type="hidden" name="bookId" value="${item.key.bookId}" /> 
														<label class="form-label fs-6" for="quantity1">Quantity</label> 
														<input class="form-control col-sm-3" type="number" id="quantitys" name="quantity${status.index + 1}" value="${item.value}"> 
														<a class="btn btn-link px-0 text-secondary text-decoration-none" href="remove_from_cart?book_id=${item.key.bookId}"> 
															<i class="far fa-trash-alt text-hover-primary pe-2"></i><span class="fs-sm">Remove</span>
														</a>
													</div>
												</div>
											</li>
										</c:forEach>
									</ul>
									<div class="d-grid gap-2">
										<button class="btn btn-lg btn-outline-dark" type="submit" id="btn_update">
											<i class="fas fa-sync-alt pe-2"></i>Update Cart
										</button>
									</div>
								</div>
								<div class="col-lg-4 col-md-5 px-3 py-2">
									<ul class="list-group list-group-flush">
										<li class="list-group-item d-flex justify-content-between align-items-center p-3">
											<h6>SubTotal(${cart.totalQuantity} items):</h6> 
											<h6 class=""><fmt:formatNumber value="${cart.totalAmount}" type="currency" maxFractionDigits = "3" currencySymbol="$" /></h6></li>
										<li class="list-group-item d-flex justify-content-between align-items-center p-3">
											<h6>Tax</h6> 
											<h6 class=""><fmt:formatNumber value="${cart.tax}" type="currency" maxFractionDigits = "3" currencySymbol="$" /></h6></li>
										<li class="list-group-item d-flex justify-content-between align-items-center p-3">
											<h6 class="fw-bolder">Total</h6> 
											<h6 class="fw-bolder"><fmt:formatNumber value="${cart.total}" type="currency" maxFractionDigits = "3" currencySymbol="$" /></h6>
										</li>
										<li class="list-group-item d-flex justify-content-between align-items-center p-3">
											<span>Shipping cost calculated at Checkout</span>
										</li>
									</ul>
									<div class="d-grid gap-2 pt-3">
										<button class="btn btn-block btn-primary mb-2 btn-lg fs-6" type="button" id="btn_checkout">Proceed to Checkout</button>
									</div>
									<div class="pt-2 text-center">
										<a class="link-primary" href="${pageContext.request.contextPath}/#features"><i class="fas fa-chevron-left pe-2"></i> Continue Shopping</a>
									</div>
								</div>
							</div>
						</div>
					</form>
				</c:if>
			</div>
		</div>
	</section>
	<jsp:include page="footer.jsp"></jsp:include>
	<script type="text/javascript">
		$(document).ready(function() {
			$("#btn_clearCart").click(function() {
				window.location = 'clear_cart';
			});

			$("#btn_checkout").click(function() {
				window.location = 'checkout';
			});

			$(window).on("load", function() {
				$(window).scrollTop($('#features').position().top);
			});

		});
	</script>
</body>
</html>