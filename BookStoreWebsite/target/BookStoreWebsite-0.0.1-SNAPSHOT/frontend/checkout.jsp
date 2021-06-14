<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Checkout - Online Book Store</title>
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
				<div class="container">
					<c:set var="cart" value="${sessionScope['cart']}"></c:set>
					<c:if test="${cart.totalItems == 0}">
						<jsp:directive.include file="empty_cart.jsp" />
					</c:if>
					<c:if test="${cart.totalItems > 0}">
						<form action="place_order" method="post" id="orderForm">
							<div class="">
								<div class="row border-bottom mb-5">
									<div class="col-12 ">
										<h3 class="mb-10 text-center">Checkout</h3>
									</div>
								</div>
								<div class="row fs-6">
									<div class="col-lg-8 col-md-7 pt-2">
										<div class="d-flex flex-column">
											<div class="">
												<h6 style="color: #0a58ca; font-size: larger;">Receipt Info</h6>
											</div>
											<div class="d-flex my-3">
												<div class="form-floating flex-fill">
													<input type="text" name="firstname" id="firstname" class="form-control border-top-0 border-end-0 border-start-0" value="${loggedCustomer.firstname}" placeholder="First name" required />
													<label for="firstname">First name</label>
												</div>
												<div class="form-floating flex-fill ms-1">
													<input type="text" name="lastname" class="form-control border-top-0 border-end-0 border-start-0" id="lastname" value="${loggedCustomer.lastname}" placeholder="Last name" required /> <label
														for="lastname">Last name</label>
												</div>
											</div>
											<div class="d-flex">
												<div class="form-floating flex-fill">
													<input type="text" name="addressLine1" id="addressLine1" class="form-control border-top-0 border-end-0 border-start-0" value="${loggedCustomer.addressLine1}" placeholder="Address line 1" required>
													<label for="addressLine1">Address 1</label>
												</div>
												<div class="form-floating flex-fill ms-1">
													<input type="text" name="addressLine2" id="addressLine2" class="form-control border-top-0 border-end-0 border-start-0" value="${loggedCustomer.addressLine2}" placeholder="Address line 2" required>
													<label for="addressLine2">Address 2</label>
												</div>
											</div>
											<div class="d-flex my-3">
												<div class="form-floating flex-fill">
													<input type="number" name="phone" id="phone" min="0" class="form-control border-top-0 border-end-0 border-start-0" value="${loggedCustomer.phone}" placeholder="phone number" required>
													<label for="phone">Phone number</label>
												</div>
												<div class="form-floating flex-fill ms-1">
													<input type="number" name="zipcode" class="form-control border-top-0 border-end-0 border-start-0" id="zipcode" min="0" value="${loggedCustomer.zipcode}" placeholder="Zip code" required>
													<label for="zipcode">ZipCode</label>
												</div>
											</div>
											<div class="d-flex">
												<div class="form-floating flex-fill">
													<input type="text" name="city" class="form-control border-top-0 border-end-0 border-start-0" id="city" value="${loggedCustomer.city}" placeholder="City" required> <label
														for="city">City</label>
												</div>
												<div class="form-floating flex-fill ms-1">
													<input type="text" name="state" id="state" class="form-control border-top-0 border-end-0 border-start-0" value="${loggedCustomer.state}" placeholder="State" required> <label
														for="state">State</label>
												</div>
											</div>
											<div class="d-flex my-3">
												<div class="form-floating flex-fill">
													<input type="email" name="email" id="email" class="form-control border-top-0 border-end-0 border-start-0" value="${loggedCustomer.email}" placeholder="Email" required> <label
														for="email">Email</label>
												</div>
												<div class="form-floating flex-fill ms-1">
													<select name="country" class="form-select border-top-0 border-end-0 border-start-0" id="country">
														<c:forEach items="${mapCountries}" var="country">
															<option value="${country.value}"
																<c:if test='${loggedCustomer.country eq country.value}'>
		                                            				selected='selected'
		                                            			</c:if>>${country.key}
															</option>
														</c:forEach>
													</select> <label for="country">Country</label>
												</div>
											</div>
										</div>
									</div>
									<div class="col-lg-4 col-md-5 py-2">
										<h6 style="color: #0a58ca; font-size: larger;">Your order</h6>
										<ul class="list-group list-group-flush my-3">
											<c:forEach items="${cart.items}" var="item" varStatus="status">
												<li class="list-group-item">
													<div class="d-block d-flex align-items-center text-start">
														<a href="view_book?id=${item.key.bookId}"> 
															<img src="data:image/jpg;base64,${item.key.base64Image}" style="max-width: 50px; max-height: 110px;" alt="..." class="img-fluid">
														</a>
														<div class="pt-2 px-3">
															<h6 class="mb-1 text-truncate" style="max-width: 200px; font-size: .875rem; font-weight: 500; color: #373f50;line-height: 1.2;">
																<a class="text-decoration-none text-reset" href="view_book?id=${item.key.bookId}">${item.key.title}</a>
															</h6>
															<h6 class="text-muted text-truncate" style="max-width: 150px; font-size: .875rem; font-weight: 500;line-height: 1.2;">by ${item.key.author}</h6>
															<div>
															<h6 class="pt-1" style="font-size: smaller; color: #3d8bfd;"><fmt:formatNumber value="${item.key.price}" type="currency" maxFractionDigits = "2" currencySymbol="$" />
																x ${item.value}
															</h6>
															</div>
														</div>
													</div>
												</li>
											</c:forEach>
											<li class="list-group-item d-flex justify-content-between align-items-center p-3">
												<span>SubTotal(${cart.totalQuantity} items):</span> 
												<span class=""><fmt:formatNumber value="${cart.totalAmount}" type="currency" maxFractionDigits = "2" currencySymbol="$" /></span>
											</li>
											<li class="list-group-item d-flex justify-content-between align-items-center p-3">
												<span>Tax:</span> 
												<span class=""><fmt:formatNumber value="${cart.tax}" type="currency" maxFractionDigits = "2" currencySymbol="$" /></span>
											</li>
											<li class="list-group-item d-flex justify-content-between align-items-center p-3">
												<span>Delivery:</span> 
												<span class=""><fmt:formatNumber value="${shippingFee}" type="currency" maxFractionDigits = "2" currencySymbol="$" /></span>
											</li>
											<li class="list-group-item d-flex justify-content-between align-items-center p-3">
												<span class="fw-bolder">Total</span> 
												<span class="fw-bolder"><fmt:formatNumber value="${total}" type="currency" maxFractionDigits = "2" currencySymbol="$" /></span>
											</li>
										</ul>
										<div class="d-flex flex-column px-3">
											<div class="form-check text-start">
											  <input class="form-check-input" type="radio" name="paymentMethod" value="Cash On Delivery" id="flexRadioDefault1" checked>
											  <label class="form-check-label" for="flexRadioDefault1">
											    Cash On Delivery
											  </label>
											</div>
											<div class="form-check text-start my-2">
											  <input class="form-check-input" type="radio" name="paymentMethod" value="paypal" id="flexRadioDefault2">
											  <label class="form-check-label" for="flexRadioDefault2">
											    PayPal or Credit cart
											  </label>
											</div>
										</div>
										<div class="d-grid gap-2 my-3">
										  <button class="btn btn-lg btn-primary" type="submit" id="btn_placeorder">Place Order</button>
										</div>
										<div class="">
											<a href="view_cart" class="link-primary"><i class="fas fa-chevron-left pe-2"></i>Return to cart</a>
										</div>
									</div>
								</div>
							</div>
						</form>
					</c:if>
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