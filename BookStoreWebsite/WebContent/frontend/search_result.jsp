<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
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
				<c:if test="${fn:length(result) == 0}">
					<div class="badge bg-secondary text-wrap mb-5" style="width: 100%;">
						<h2 class="py" align="center">No result for "${keyword}"</h2>
					</div>
				</c:if>
				<c:if test="${fn:length(result) > 0}">
					<div class="container">
						<div class="badge shadow p-3 text-dark bg-body rounded text-wrap mb-5 d-flex justify-content-between mx-1" style="width: 100%;">
							<i class="fas fa-circle pe-3 align-self-center" style="font-size: 15px; color: #35b653;"></i>
							<h3 class="title-level2">Result for "${keyword}"</h3>
							<i class="fas fa-circle pe-3 align-self-center" style="font-size: 15px; color: #0D6EFD;"></i>
						</div>
						<div class="row row-cols-1 row-cols-md-2 g-4">
							<c:forEach items="${result}" var="book">
								<div class="col">
									<div class="card shadow h-100 bg-body rounded card1" style="max-width: 540px;">
										<div class="row g-0">
											<div class="col-md-4">
												<a href="view_book?id=${book.bookId}"> <img style="min-height: 266px;" class="img-fluid" src="data:image/jpg;base64,${book.base64Image}" alt="">
												</a>
											</div>
											<div class="col-md-8">
												<div class="card-body text-start">
													<h4 class="card-title text-truncate" style="max-width: 250px;">
														<a class="text-decoration-none text-reset" href="view_book?id=${book.bookId}">${book.title}</a>
													</h4>
													<p class="card-text">
														<small class="text-muted">by ${book.author}</small>
													</p>
													<div class="py-3">
															<span class="book-ratting me-3"><jsp:directive.include file="book_rating.jsp" /></span>
															<span><a href="#review">${fn:length(book.reviews)} ratings</a></span> 
													</div>
													<div class="pt-3">
														<h4 class="card-title pricing-card-title">
															<fmt:formatNumber value="${book.price}" type="currency" maxFractionDigits = "2" currencySymbol="$" />
														</h4>
													</div>
												</div>
											</div>
										</div>
										<div class="row g-0 mt-2">
											<div class="card-footer d-grid">
												<button class="btn submit btn-lg btn-warning fas fa-shopping-cart fs-5" id="${book.bookId}">
													&emsp;<span>Add to Cart</span>
												</button>
											</div>
										</div>
									</div>
								</div>
							</c:forEach>
						</div>
					</div>
				</c:if>
			</div>
		</div>
	</section>
	<jsp:include page="footer.jsp"></jsp:include>
	<script type="text/javascript">
		$(document).ready(function() {
			$(".submit").each(function() {
				$(this).on("click", function() {
					bookId = $(this).attr("id");
					window.location = 'add_to_cart?book_id=' + bookId;
				});
			});

			$(window).on("load", function() {
				$(window).scrollTop($('#features').position().top);
			});
		});
	</script>
</body>
</html>