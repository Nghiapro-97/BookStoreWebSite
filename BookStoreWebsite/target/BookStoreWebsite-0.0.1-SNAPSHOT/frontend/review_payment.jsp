<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Review payment - Online Book Store</title>
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
					<div class="">
						<div class="row border-bottom mb-5">
							<div class="col-12 alert alert-warning" role="alert">please carefully review the following information before making payment!</div>
						</div>
						<div class="row fs-6">
							<div class="col-lg-8 col-md-7 pt-2">
								<div class="row">
									<div class="d-flex flex-column">
										<div class="">
											<h6 style="color: #0a58ca; font-size: larger;">Payer Info</h6>
										</div>
										<div class="d-flex my-3">
											<div class="form-floating flex-fill">
												<input type="text" name="firstname" id="firstname" class="form-control border-top-0 border-end-0 border-start-0" value="${payer.firstName}" placeholder="First name" readonly="readonly" />
												<label for="firstname">First name</label>
											</div>
											<div class="form-floating flex-fill ms-1">
												<input type="text" name="lastname" class="form-control border-top-0 border-end-0 border-start-0" id="lastname" value="${payer.lastName}" placeholder="Last name" readonly="readonly" /> <label
													for="lastname">Last name</label>
											</div>
										</div>
										<div class="form-floating">
											<input type="email" name="email" id="email" class="form-control border-top-0 border-end-0 border-start-0" value="${payer.email}" placeholder="Email" readonly="readonly" readonly="readonly">
											<label for="email">Email</label>
										</div>
									</div>
								</div>
								<div class="row">
									<div class="d-flex flex-column my-5">
										<div class="">
											<h6 style="color: #0a58ca; font-size: larger;">Receipt Info</h6>
										</div>
										<div class="d-flex my-3">
											<div class="form-floating flex-fill">
												<input type="text" name="receiptname" id="receiptname" class="form-control border-top-0 border-end-0 border-start-0" value="${recipient.recipientName}" placeholder="receipt name"
													readonly="readonly" /> 
												<label for="receiptname">Receipt Name</label>
											</div>
											<div class="form-floating flex-fill ms-1">
												<input type="number" name="phone" id="phone" class="form-control border-top-0 border-end-0 border-start-0" value="${recipient.phone}" placeholder="phone number" readonly="readonly" /> <label
													for="phone">Phone number</label>
											</div>
										</div>
										<div class="d-flex my-3">
											<div class="form-floating flex-fill">
												<input type="text" name="addressLine1" id="addressLine1" class="form-control border-top-0 border-end-0 border-start-0" value="${recipient.line1}" placeholder="Address line 1"
													readonly="readonly"> <label for="addressLine1">Address 1</label>
											</div>
											<div class="form-floating flex-fill ms-1">
												<input type="text" name="addressLine2" id="addressLine2" class="form-control border-top-0 border-end-0 border-start-0" value="${recipient.line2}" placeholder="Address line 2"
													readonly="readonly"> <label for="addressLine2">Address 2</label>
											</div>
										</div>
										<div class="d-flex my-3">
											<div class="form-floating flex-fill">
												<input type="number" name="zipcode" class="form-control border-top-0 border-end-0 border-start-0" id="zipcode" min="0" value="${recipient.postalCode}" placeholder="Zip code"
													readonly="readonly"> <label for="zipcode">Postal Code</label>
											</div>
											<div class="form-floating flex-fill ms-1">
												<input type="text" name="countrycode" id="countrycode" class="form-control border-top-0 border-end-0 border-start-0" value="${recipient.countryCode}" placeholder="Email"
													readonly="readonly"> <label for="countrycode">Country Code</label>
											</div>
										</div>
										<div class="d-flex my-3">
											<div class="form-floating flex-fill">
												<input type="text" name="city" class="form-control border-top-0 border-end-0 border-start-0" id="city" value="${recipient.city}" placeholder="City" readonly="readonly"> <label
													for="city">City</label>
											</div>
											<div class="form-floating flex-fill ms-1">
												<input type="text" name="state" id="state" class="form-control border-top-0 border-end-0 border-start-0" value="${recipient.state}" placeholder="State" readonly="readonly"> <label
													for="state">State</label>
											</div>
										</div>
									</div>
								</div>
							</div>
							<div class="col-lg-4 col-md-5 px-3 py-2">
								<h6 style="color: #0a58ca; font-size: larger;">Your order</h6>
								<ul class="list-group list-group-flush my-3">
									<c:forEach items="${transaction.itemList.items}" var="item" varStatus="status">
										<li class="list-group-item">
											<div class="d-block d-flex align-items-center text-start">
												<h6>${status.index + 1},</h6>
												<div class="pt-2 px-3">
													<h6 class="mb-1 text-truncate" style="max-width: 200px; font-size: .875rem; font-weight: 500; color: #373f50; line-height: 1.2;">${item.name}</h6>
													<div>
														<h6 class="pt-1" style="font-size: smaller; color: #3d8bfd;">
															<fmt:formatNumber value="${item.price}" type="currency" />
															x ${item.quantity}
														</h6>
													</div>
												</div>
											</div>
										</li>
									</c:forEach>
									<li class="list-group-item d-flex justify-content-between align-items-center p-3"><span>SubTotal:</span> <span class=""> <fmt:formatNumber
												value="${transaction.amount.details.subtotal}" type="currency" /></span></li>
									<li class="list-group-item d-flex justify-content-between align-items-center p-3"><span>Tax:</span> <span class=""> <fmt:formatNumber value="${transaction.amount.details.tax}"
												type="currency" /></span></li>
									<li class="list-group-item d-flex justify-content-between align-items-center p-3"><span>Delivery:</span> <span class=""><fmt:formatNumber
												value="${transaction.amount.details.shipping}" type="currency" /></span></li>
									<li class="list-group-item d-flex justify-content-between align-items-center p-3"><span class="fw-bolder">Total</span> <span class="fw-bolder"><fmt:formatNumber
												value="${transaction.amount.total}" type="currency" /></span></li>
								</ul>
								<form action="execute_payment" method="post">
									<div class="d-grid gap-2 my-3 px-3">
										<input type="hidden" name="paymentId" value="${param.paymentId}" /> <input type="hidden" name="PayerID" value="${param.PayerID}" />
										<button class="btn btn-lg btn-primary" type="submit">Pay Now</button>
									</div>
								</form>
								<div class="">
									<a href="${pageContext.request.contextPath}/#features" class="link-primary"><i class="fas fa-chevron-left pe-2"></i>Continue shopping</a>
								</div>
							</div>
						</div>
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