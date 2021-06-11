<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Customer Write Review</title>
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
<!-- library rich text -->
<link rel="stylesheet" href="https://netdna.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel="stylesheet" href="css/richtext.min.css">
<script src="js/jquery.richtext.min.js"></script>
<!-- rateyo lib -->
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/rateYo/2.3.2/jquery.rateyo.min.css">
<script src="https://cdnjs.cloudflare.com/ajax/libs/rateYo/2.3.2/jquery.rateyo.min.js"></script>
</head>
<body>
	<jsp:include page="header.jsp"></jsp:include>
	<section class="section-2" id="features">
		<div class="bg-blue">
			<div class="container2 py-5">
				<div class="container">
					<div class="row mb-5 border-bottom">
						<h3 class="">How would you rate and review this book?</h3>
					</div>
					<div class="row">
						<div class="col-md-4">
							<img class="img-fluid" alt="imageBook" src="data:image/jpg;base64,${book.base64Image}" />
						</div>
						<div class="card-body col-md-8 d-flex flex-column">
							<form action="submit_review" id="reviewForm" method="post">
								<div>
									<h3 class="card-title">${book.title}</h3> 
								</div>
								<div class="mb-3">
									<span class="card-text"><small class="text-muted">by ${book.author} (author)</small></span>
								</div>
								<h4>--Select rating--</h4>
								<div class="d-flex justify-content-center my-3">
									<div id="rateYo"></div>
									<input type="hidden" name="rating" id="rating" /> 
									<input type="hidden" name="bookId" value="${book.bookId}" />
								</div>
								<div class="form-floating my-3">
									<input type="text" maxlength="128" class="form-control" id="headline" name="headline" placeholder="Title or summary" required />
									<label for="headline">Headline or summary for your review(required)</label>
								</div>
								<div class="">
									<input name="comment" id="review" maxlength="500" placeholder="write your review detail ..." required></input>
								</div>
								<div class="my-4 d-flex justify-content-around">
									<button class="btn btn-lg btn-primary" type="submit" id="submit">Publish</button>
									<button class="btn btn-lg btn-secondary" type="button" id="cancel">Cancel</button>
								</div>
							</form>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>
	<jsp:include page="footer.jsp"></jsp:include>
	<script type="text/javascript">
		$(document).ready(function() {
			$('#review').richText({
				maxlength : 500,
				id : "richtext",
				required : true,
			});

			$("#cancel").click(function() {
				history.go(-1);
			});

			$("#rateYo").rateYo({
				starWidth : "30px",
				fullStar : true,
				onSet : function(rating, rateYoInstance) {
					$("#rating").val(rating);
				}
			});
			
			$(window).on("load", function() {
				$(window).scrollTop($('#features').position().top);
			});

		});
	</script>
</body>
</html>