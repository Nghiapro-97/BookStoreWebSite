<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Books in ${category.name} - Online book store</title>
<meta charset="ISO-8859-1">
<title>Result for ${keyword} - Online Books Store</title>
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
				<div class="badge shadow p-3 text-dark bg-body rounded text-wrap mb-5 d-flex justify-content-between mx-1" style="width: 100%;">
					<i class="fas fa-circle pe-3 align-self-center" style="font-size: 15px; color: #35b653;"></i>
					<h3 class="title-level2">${category.name}</h3>
					<i class="fas fa-circle pe-3 align-self-center" style="font-size: 15px; color: #0D6EFD;"></i>
				</div>
				<div class="row row-cols-1 row-cols-md-2 g-4">
					<c:forEach items="${listBooks}" var="book" varStatus="status">
						<div class="col">
							<div class="card shadow h-100 bg-body rounded card1" style="max-width: 540px;">
								<div class="row g-0">
									<div class="col-md-4">
										<a href="view_book?id=${book.bookId}"> <img style="min-height: 266px;" alt="imageBook" src="data:image/jpg;base64,${book.base64Image}" class="img-fluid" />
										</a>
									</div>
									<div class="col-md-8">
										<div class="card-body">
											<h5 class="card-title d-inline-block text-truncate" style="max-width: 300px;">${book.title}</h5>
											<p class="card-text">
												<small class="text-muted">by ${book.author}</small>
											</p>
											<div class="pt-4">
												<h4 class="card-title pricing-card-title">
													<fmt:formatNumber value="${book.price}" type="currency" maxFractionDigits = "3" currencySymbol="$"/>
												</h4>
											</div>
											<div class="d-flex justify-content-evenly pt-4 pb-4">
												<div>
													<span class="book-ratting"><jsp:directive.include file="book_rating.jsp" /></span>
												</div>
												<div>
													<a href="#review">${fn:length(book.reviews)} ratings</a>
												</div>
											</div>
										</div>
									</div>
								</div>
							</div>
						</div>
					</c:forEach>
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