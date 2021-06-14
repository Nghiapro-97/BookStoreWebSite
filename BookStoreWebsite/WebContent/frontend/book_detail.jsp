<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>${book.title}</title>
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
				<div class="card mt-5 pt-3">
					<div class="row row-cols-1 row-cols-md-2 g-0 mb-5 pb-5">
						<div class="col-12 col-lg-4">
							<img class="img1" alt="imageBook" src="data:image/jpg;base64,${book.base64Image}" class="img-fluid" style="max-width: 323px;" />
						</div>
						<div class="col-lg-8">
							<div class="card-body text-start">
								<h3 class="card-title">${book.title}</h3>
								<span class="card-text">
									<small class="text-muted">by ${book.author} (author)</small>
								</span>

								<div class="py-3">
										<span class="book-ratting me-3"> 
											<jsp:directive.include file="book_rating.jsp" />
										</span>
										<span><a href="#review">${fn:length(book.reviews)} ratings</a></span>
								</div>

								<div class="d-flex justify-content-between pb-3">
									<h1 class="card-title pricing-card-title">
										<fmt:formatNumber value="${book.price}" type="currency" maxFractionDigits = "2" currencySymbol="$" />
									</h1>

									<button
										class="btn btn-warning fas fa-shopping-cart mt-2 mb-2 fs-5"
										id="btn_addToCart">
										&emsp;<span>Add to Cart</span>
									</button>
								</div>
								<div class="book-description">
									<div class="descript">
										<p>${book.description}</p>
									</div>
									<i class="fas fa-chevron-left pe-2"></i> 
									<a href="javascript:void();" class="item_col readMore-btn">read more</a>
								</div>
							</div>
						</div>
					</div>

					<div class="" id="review">
						<div class="">
							<h2 class="">Customer Reviews</h2>
							<div>
								<span class="fs-4 pe-3"> 
									<jsp:directive.include file="book_rating.jsp" />
								</span> 
								<span class="">
									<a href="">${fn:length(book.reviews)} customer ratings</a>
								</span>
							</div>
							
							<div class="py-5">
								<div class="row">
									<div class="col">
										<a href="">5 star</a>
									</div>
									<div class="col-6">
										<div class="progress">
											<div class="progress-bar bg-primary" role="progressbar"
												aria-valuenow="${rating5}" aria-valuemin="0"
												aria-valuemax="100">
											</div>
										</div>
									</div>
									<div class="col">
										<a href=""> ${rating5}%</a> 
									</div>
								</div>
								
								<div class="row">
									<div class="col">
										<a href="">4 star</a>
									</div>
									<div class="col-6">
										<div class="progress">
											<div class="progress-bar bg-primary" role="progressbar"
												aria-valuenow="${rating4}" aria-valuemin="0"
												aria-valuemax="100">
											</div>
										</div>
									</div>
									<div class="col">
										<a href=""> ${rating4}%</a>  
									</div>
								</div>
								
								<div class="row">
									<div class="col">
										<a href="">3 star</a>
									</div>
									<div class="col-6">
										<div class="progress">
											<div class="progress-bar bg-primary" role="progressbar"
												aria-valuenow="${rating3}" aria-valuemin="0"
												aria-valuemax="100">
											</div>
										</div>
									</div>
									<div class="col">
										<a href=""> ${rating3}%</a>  
									</div>
								</div>
								
								<div class="row">
									<div class="col">
										<a href="">2 star</a>
									</div>
									<div class="col-6">
										<div class="progress">
											<div class="progress-bar bg-primary" role="progressbar"
												aria-valuenow="${rating2}" aria-valuemin="0"
												aria-valuemax="100">
											</div>
										</div>
									</div>
									<div class="col">
										<a href=""> ${rating2}%</a>   
									</div>
								</div>
								
								<div class="row">
									<div class="col">
										<a href="">1 star</a>
									</div>
									<div class="col-6">
										<div class="progress">
											<div class="progress-bar bg-primary" role="progressbar"
												aria-valuenow="${rating1}" aria-valuemin="0"
												aria-valuemax="100">
											</div>
										</div>
									</div>
									<div class="col">
										<a href=""> ${rating1}%</a>   
									</div>
								</div>
							</div>

							<div class="py-5">
								<h4>Review this product</h4>
								<p>Share your thoughts with other customers</p>
								<button type="button" class="btn btn-secondary" id="btn_writeRevie">Write a customer review</button>
							</div>
						</div>
						<div class="my-3 p-3 bg-body rounded shadow-sm">
							<c:forEach items="${book.reviews}" var="review">
							    <div class="d-flex text-muted pt-3 text-start">
							    	<img width="50" height="50" class="img" src="images/iconuser.png" alt="">
							 
								    <div class="pb-3 mb-0 small lh-sm border-bottom ps-3">
								       <strong class="d-block text-gray-dark py-2">${review.customer.fullname}</strong>
								       <div class="">
									       <div class="rating py-2">
												<c:forTokens items="${review.stars}" delims="," var="star">
													<c:if test="${star eq 'on'}">
														<img alt="stars" src="images/rating_on.png">
													</c:if>
													<c:if test="${star eq 'off'}">
														<img alt="stars" src="images/rating_off.png">
													</c:if>
												</c:forTokens>
											</div>
											<span class="py-2">Review on ${review.reviewTime}</span>
								        </div>
										<div class="py-2">
											<span>${review.headline}</span>
										</div>
										<div class="py-2">
									        <span class="item_row review-content">${review.comment}</span>
										</div>
								      </div>
							    </div>
							</c:forEach>
						</div>
					</div>
				</div>
				<!--end page main-->
			</div>
		</div>
	</section>

	<jsp:include page="footer.jsp"></jsp:include>

	<script type="text/javascript">
		/*---start read more and less---*/
		$(".readMore-btn").on('click',function() {
			$(this).parent().toggleClass("showContent");
			var replaceText;
			if ($(this).parent().hasClass("showContent")) {
				replaceText = "read less";
				$('.book-description .fa-chevron-left')
						.removeClass('fa-chevron-left')
						.addClass('fa-chevron-right');
			} else {
				replaceText = "read more";
				$('.book-description .fa-chevron-right').removeClass('fa-chevron-right').addClass('fa-chevron-left');
			}
							//var replaceText = $(this).parent().hasClass("showContent") ? "read less" : "read more";
			$(this).text(replaceText);

		});

		$(".calculated-btn").on('click',function() {
			$(this).parent().toggleClass("showContent");
			if ($(this).parent().hasClass("showContent")) {
				$('.ratting-detail .fa-chevron-down').removeClass('fa-chevron-down').addClass('fa-chevron-up');
			} else {
				$('.ratting-detail .fa-chevron-up').removeClass('fa-chevron-up').addClass('fa-chevron-down');
			}
					//var replaceText = $(this).parent().hasClass("showContent") ? "read less" : "read more";
		});
		/*---end read more and less---*/

		$(document).ready(function() {
			$("#btn_addToCart").click(function() {
				window.location = 'add_to_cart?book_id=' + ${book.bookId};
			});

			$("#btn_writeRevie").click(function() {
				window.location = 'write_review?book_id=' + ${book.bookId};
			});

			$(window).on("load", function(){
				$(window).scrollTop($('#features').position().top);
	        });
		});
	</script>
	<script src="js/rating.js"></script>
</body>
</html>