<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html lang="en">

<head>
	<meta charset="UTF-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<title>EvergreenBook - Store Web</title>
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
			<div class="container2">
				<div class="listBook-all pt-5 pb-5">
					<div class="d-flex justify-content-around pb-2 mb-5 tab">
						<ul class="nav nav-fill mb-3" id="myTab" role="tablist">
							<li class="nav-item" role="presentation">
								<button class="nav-link bg-white fs-5"
									onclick="openTab(event, 'Home')" id="defaultOpen">List
									All</button>
							</li>
							<li class="nav-item" role="presentation">
								<button class="nav-link bg-white fs-5"
									onclick="openTab(event, 'New-Book')">New Book</button>
							</li>
							<li class="nav-item" role="presentation">
								<button class="nav-link bg-white fs-5"
									onclick="openTab(event, 'Best-Selling-Book')">Best-Selling
									Book</button>
							</li>
							<li class="nav-item" role="presentation">
								<button class="nav-link bg-white fs-5"
									onclick="openTab(event, 'Most-Favored-Book')">Most-Favored
									Book</button>
							</li>
						</ul>
					</div>
					<div id="Home" class="tabcontent">
						<div class="row row-cols-1 row-cols-md-2 g-4">
							<c:forEach items="${listBook}" var="book">
								<jsp:directive.include file="book_group.jsp" />
							</c:forEach>
						</div>
						<div class="pt-5">
							<ul class="pagination d-flex justify-content-center">
								<li class="page-item">
									<c:if test="${currentPage != 1}">
										<a class="page-link" href="?page=${currentPage - 1}">&laquo;</a>
									</c:if>
								</li>
									<c:forEach begin="1" end="${noOfPages}" var="i">
										<c:choose>
											<c:when test="${currentPage eq i}">
											<li class="page-item">
												<a class="page-link" style="color: black;">${i}</a>
											</li>
											</c:when>
											<c:otherwise>
											<li class="page-item">
												<a class="page-link" href="?page=${i}" style="color: #3d77f3;">${i}</a>
											</li>
											</c:otherwise>
										</c:choose>
									</c:forEach>
								<li class="page-item">
									<c:if test="${currentPage lt noOfPages}">
										<a class="page-link" href="?page=${currentPage + 1}">&raquo;</a>
									</c:if>
								</li>
							</ul>
						</div>
					</div>

					<div id="New-Book" class="tabcontent">
						<div class="row row-cols-1 row-cols-md-2 g-4">
							<c:forEach items="${listNewBooks}" var="book">
								<jsp:directive.include file="book_group.jsp" />
							</c:forEach>
						</div>
					</div>

					<div id="Best-Selling-Book" class="tabcontent">
						<div class="row row-cols-1 row-cols-md-2 g-4">
							<c:forEach items="${listBestSellingBooks}" var="book">
								<jsp:directive.include file="book_group.jsp" />
							</c:forEach>
						</div>
					</div>

					<div id="Most-Favored-Book" class="tabcontent">
						<div class="row row-cols-1 row-cols-md-2 g-4">
							<c:forEach items="${listMostFavoreBooks}" var="book">
								<jsp:directive.include file="book_group.jsp" />
							</c:forEach>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>

	<jsp:include page="footer.jsp"></jsp:include>

	<script type="text/javascript">
		function openTab(evt, tabName) {
			var i, tabcontent, tablinks;
			tabcontent = document.getElementsByClassName("tabcontent");
			for (i = 0; i < tabcontent.length; i++) {
				tabcontent[i].style.display = "none";
			}
			tablinks = document.getElementsByClassName("nav-link");
			for (i = 0; i < tablinks.length; i++) {
				tablinks[i].className = tablinks[i].className.replace(" active", "");
			}
			document.getElementById(tabName).style.display = "block";
			evt.currentTarget.className += " active";
		}
		// Get the element with id="defaultOpen" and click on it
		document.getElementById("defaultOpen").click();
	</script>

</body>

</html>