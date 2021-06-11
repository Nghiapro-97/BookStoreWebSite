<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Customer login</title>
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
				<div class="container d-flex justify-content-center align-items-center py-5">
					<ul class="list-group list-group-flush py-5">
						<li class="list-group-item">
						<c:if test="${message != null}">
								<svg xmlns="http://www.w3.org/2000/svg" style="display: none;">
								    <symbol id="check-circle-fill" fill="currentColor" viewBox="0 0 16 16">
								      <path
										d="M16 8A8 8 0 1 1 0 8a8 8 0 0 1 16 0zm-3.97-3.03a.75.75 0 0 0-1.08.022L7.477 9.417 5.384 7.323a.75.75 0 0 0-1.06 1.06L6.97 11.03a.75.75 0 0 0 1.079-.02l3.992-4.99a.75.75 0 0 0-.01-1.05z" />
								    </symbol>
								    <symbol id="info-fill" fill="currentColor" viewBox="0 0 16 16">
								      <path
										d="M8 16A8 8 0 1 0 8 0a8 8 0 0 0 0 16zm.93-9.412-1 4.705c-.07.34.029.533.304.533.194 0 .487-.07.686-.246l-.088.416c-.287.346-.92.598-1.465.598-.703 0-1.002-.422-.808-1.319l.738-3.468c.064-.293.006-.399-.287-.47l-.451-.081.082-.381 2.29-.287zM8 5.5a1 1 0 1 1 0-2 1 1 0 0 1 0 2z" />
								    </symbol>
								    <symbol id="exclamation-triangle-fill" fill="currentColor" viewBox="0 0 16 16">
								      <path
										d="M8.982 1.566a1.13 1.13 0 0 0-1.96 0L.165 13.233c-.457.778.091 1.767.98 1.767h13.713c.889 0 1.438-.99.98-1.767L8.982 1.566zM8 5c.535 0 .954.462.9.995l-.35 3.507a.552.552 0 0 1-1.1 0L7.1 5.995A.905.905 0 0 1 8 5zm.002 6a1 1 0 1 1 0 2 1 1 0 0 1 0-2z" />
								    </symbol>
								</svg>
								<div class="alert alert-warning d-flex align-items-center" role="alert">
									<svg class="bi flex-shrink-0 me-2" width="24" height="24" role="img" aria-label="Warning:">
										<use xlink:href="#exclamation-triangle-fill" /></svg>
									<div>${message}</div>
								</div>
							</c:if> 
						<c:if test="${message == null}">
							<span class="fst-italic text-success fs-5">Log in to your Evergreen Account!</span>
						</c:if></li>
						<li class="list-group-item">
							<form action="login" id="loginForm" method="post" class="pt-3">
								<div class="form-floating mb-3">
									<input type="email" class="form-control" id="email" name="email" placeholder="name@example.com" value="${user.email}" required> <label for="email">Email</label>
								</div>
								<div class="form-floating mb-3">
									<input type="password" class="form-control" id="password" name="password" value="${user.password}" placeholder="Password" required> <label for="password">Password</label>
								</div>
								<div class="text-end pb-3">
									<a href="" class="">Forgot password?</a>
								</div>
								<div class="d-grid gap-2">
									<button type="submit" class="btn btn-lg btn-primary" id="submit">Sign in</button>
								</div>
							</form>
						</li>
						<li class="list-group-item"><span class="text-center">Don't have an account? <a href="register">Sign up</a>
						</span></li>
					</ul>
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