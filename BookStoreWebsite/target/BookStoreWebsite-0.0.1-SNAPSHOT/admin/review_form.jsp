<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Edit Review</title>
<link rel="icon" href="../images/favicon.ico">
<!-- bootstrap -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/css/bootstrap.min.css" rel="stylesheet">
<link rel="stylesheet" href="../css/admin.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.12.0-2/css/all.min.css">
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.5.1/jquery.min.js" charset="utf-8"></script>
<!-- library rich text -->
<link rel="stylesheet" href="https://netdna.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel="stylesheet" href="../css/richtext.min.css">
<script src="../js/jquery.richtext.min.js"></script>
<!-- rateyo lib -->
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/rateYo/2.3.2/jquery.rateyo.min.css">
<script src="https://cdnjs.cloudflare.com/ajax/libs/rateYo/2.3.2/jquery.rateyo.min.js"></script>
</head>
<body>
	<jsp:include page="header.jsp"></jsp:include>
	<div class="container">
		<div class="mt-5">
			<div class="text-center mb-5 border-bottom shadow p-3 mb-5 bg-body rounded">
				<div class="d-flex justify-content-between mx-1">
					<i class="fas fa-circle pe-3 align-self-center" style="font-size: 15px; color: #dc3545;"></i>
					<h3>Edit review</h3>
					<i class="fas fa-comments fs-3 ps-3 align-self-center" style="color: #dc3545;"></i>
				</div>
			</div>
			<div class="shadow p-3 mb-5 bg-body rounded">
				<form action="update_review" method="post" id="reviewForm">
					<input type="hidden" name="reviewId" value="${review.reviewId}" />
					<div class="card mb-3">
						<div class="row g-0">
							<div class="col-md-4">
								<img id="thumbnai" alt="image preview" class="img-fluid p-3" src="data:image/jpg;base64,${review.book.base64Image}">
							</div>
							<div class="col-md-8">
								<div class="card-body">
									<div>
										<h3 class="card-title">${review.book.title}</h3>
									</div>
									<div class="mb-3">
										<span class="card-text"> <small class="text-muted">by ${review.book.author} (author)</small>
										</span>
									</div>
									<div class="d-flex justify-content-left my-3">
										<div id="rateYo"></div>
										<input type="hidden" name="rating" id="rating" /> <input type="hidden" name="bookId" value="${review.reviewId}" />
									</div>
									<div class="form-floating my-3">
										<input type="text" class="form-control" id="customer" name="customer" type="text" readonly="readonly" value="${review.customer.fullname}" placeholder="customer" /> <label for="customer">by
											customer</label>
									</div>
									<div class="form-floating my-3">
										<input type="text" class="form-control" id="headline" name="headline" type="text" value="${review.headline}" placeholder="Title or summary" /> <label for="headline">Headline
											or summary for your review(required)</label>
									</div>
									<div class="input-group">
										<span class="input-group-text">Comment</span>
										<textarea class="form-control" name="comment" maxlength="500" id="comment" cols="70" rows="3" required="required">${review.comment}</textarea>
									</div>
								</div>
							</div>
						</div>
					</div>
					<div class="d-grid gap-2 d-md-flex">
						<button class="btn btn-lg btn-outline-success flex-fill" type="button" id="cancel">Cancel</button>
						<button class="btn btn-lg btn-success flex-fill" type="submit" id="submit">Save</button>
					</div>
				</form>
			</div>
		</div>
	</div>
	<script type="text/javascript">
		$(document).ready(function(){
	        $("#comment").richText();
	        
			$("#cancel").click(function(){
				history.go(-1);
			});
			
			$("#rateYo").rateYo({
				starWidth: "30px",
			    fullStar: true,
			    rating: ${review.rating},
			    readOnly: true
			});

		});
	</script>
</body>
</html>