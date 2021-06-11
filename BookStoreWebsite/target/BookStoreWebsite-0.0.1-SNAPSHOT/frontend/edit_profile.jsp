<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>Edit profile customer</title>
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
					<div class="form-outer d-flex justify-content-center">
						<form action="update_profile" method="post" id="customerProfile_form">
							<div class="center title1">
								<h2>Sign up</h2>
							</div>
							<div class="d-flex justify-content-center">
								<div class="form-floating">
									<input type="text" name="firstName" id="firstName" class="form-control border-top-0 border-end-0 border-start-0" value="${loggedCustomer.firstname}" placeholder="First name" required /> <label
										for="firstName">First name</label>
								</div>
								<div class="form-floating ms-5">
									<input type="text" name="lastName" class="form-control border-top-0 border-end-0 border-start-0" id="lastName" value="${loggedCustomer.lastname}" placeholder="Last name" required /> <label
										for="lastName">Last name</label>
								</div>
							</div>
							<div class="form-floating">
								<input type="text" name="address1" id="address1" class="form-control border-top-0 border-end-0 border-start-0" value="${loggedCustomer.addressLine1}" placeholder="Address line 1" required>
								<label for="address1">Address 1</label>
							</div>
							<div class="form-floating">
								<input type="text" name="address2" id="address2" class="form-control border-top-0 border-end-0 border-start-0" value="${loggedCustomer.addressLine2}" placeholder="Address line 2" required>
								<label for="address2">Address 2</label>
							</div>
							<div class="d-flex justify-content-center">
								<div class="form-floating">
									<input type="number" name="phone" id="phone" min="0" class="form-control border-top-0 border-end-0 border-start-0" value="${loggedCustomer.phone}" placeholder="phone number" required>
									<label for="phone">Phone number</label>
								</div>
								<div class="form-floating ms-5">
									<input type="number" name="zipcode" class="form-control border-top-0 border-end-0 border-start-0" id="zipcode" min="0" value="${loggedCustomer.zipcode}" placeholder="Zip code" required>
									<label for="zipcode">ZipCode</label>
								</div>
							</div>
							<div class="d-flex justify-content-center">
								<div class="form-floating">
									<input type="text" name="city" class="form-control border-top-0 border-end-0 border-start-0" id="city" value="${loggedCustomer.city}" placeholder="City" required> <label for="city">City</label>
								</div>
								<div class="form-floating ms-5">
									<input type="text" name="state" id="state" class="form-control border-top-0 border-end-0 border-start-0" value="${loggedCustomer.state}" placeholder="State" required> <label
										for="state">State</label>
								</div>
							</div>
							<div class="form-floating">
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
							<div class="form-floating">
								<input type="email" name="email" id="email" class="form-control border-top-0 border-end-0 border-start-0" value="${loggedCustomer.email}" placeholder="Email" required> 
								<label for="email">Email</label>
							</div>
							<div class="d-flex justify-content-center">
								<div class="form-floating">
									<input type="password" name="password" class="form-control border-top-0 border-end-0 border-start-0" id="password" placeholder="Password"> 
									<label for="password">Password</label>
								</div>
								<div class="form-floating ms-3">
									<input type="password" name="confirmPassword" class="form-control border-top-0 border-end-0 border-start-0" id="confirmPassword" placeholder="Confirm Password"> 
									<label for="confirmPassword">Confirm password</label>
								</div>
							</div>
							<div class="d-grid gap-2 mt-5">
								<button class="btn btn-lg btn-primary" type="submit">Submit</button>
							</div>
						</form>
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