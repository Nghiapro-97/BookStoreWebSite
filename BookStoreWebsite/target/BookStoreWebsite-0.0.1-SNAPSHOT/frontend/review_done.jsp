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
</head>
<body>
	<div class="wrapper">
		<jsp:include page="header.jsp"></jsp:include>
		<!--main container start-->
		<div class="main-container">
			<!--start aside-->
			<div class="aside">
				<h5 class="title-level3">Popular in Books</h5>
				<ul class="title-level4">
					<li><a href="">award winner</a></li>
					<li><a class="link" href="">award winner</a></li>
					<li><a class="link" href="">award winner</a></li>
					<li><a href="">award winner</a></li>
					<li><a href="">award winner</a></li>
				</ul>
				<h5 class="title-level3">More in Books</h5>
				<ul class="title-level4">
					<li><a href="">award winner</a></li>
					<li><a href="">award winner</a></li>
					<li><a href="">award winner</a></li>
					<li><a href="">award winner</a></li>
					<li><a href="">award winner</a></li>
				</ul>
			</div>
			<!--end aside-->
			<!--start page main-->
			<div class="page-wrapper">
				<div class="category-name">
					<h3 class="title-level2">Your already wrote a review for this book!</h3>
				</div>
				<div class="book-detail write-review">
					<div class="img-book">
						<img class="img1" alt="imageBook" src="data:image/jpg;base64,${book.base64Image}" />
					</div>
					<div class="info">
						<table>
							<tr class="cols cols1">
								<td><span class="item_row book-title title-detail">${book.title}</span> <span class="item_row book-author author-detail">by ${book.author}</span></td>
							</tr>
							<tr class="cols cols2">
								<td>
									<h2>Your review has been post. thank you!</h2>
								</td>
							</tr>
						</table>
					</div>
				</div>
			</div>
			<!--end page main-->
		</div>
		<!--main container end-->
		<jsp:include page="footer.jsp"></jsp:include>
	</div>
	<script type="text/javascript">
		$(document).ready(function() {
			function topFunction() {
				document.body.scrollTop = 0; // For Safari
				document.documentElement.scrollTop = 0; // For Chrome, Firefox, IE and Opera
			}
			;
		});
	</script>
</body>
</html>