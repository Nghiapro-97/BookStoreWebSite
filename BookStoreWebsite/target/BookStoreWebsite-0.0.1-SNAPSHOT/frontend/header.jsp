<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<section class="section-1" id="title">
	<div class="container-fluid container1">
		<div class="container border-bottoms">
			<nav class="navbar navbar-expand-lg navbar-dark">
				<a href="${pageContext.request.contextPath}/"
					class="d-flex col navbar-brand"> 
					<span class="word">Evergreen Book</span>
				</a>

				<button class="navbar-toggler btn-toggler" type="button"
					data-toggle="collapse" data-target="#navbarSupportedContent"
					aria-controls="navbarSupportedContent" aria-expanded="false"
					aria-label="Toggle navigation">
					<span class="navbar-toggler-icon"></span>
				</button>

				<div class="collapse navbar-collapse" id="navbarSupportedContent">
					<div class="col-lg-6">
						<ul class="navbar-nav ml-auto">
							<c:forEach var="category" items="${listCategory}"
								varStatus="status">
								<li class="nav-item"><a class="nav-link text-white"
									href="view_category?id=${category.categoryId}"><c:out
											value="${category.name}" /></a></li>
							</c:forEach>
						</ul>
					</div>
					<div class="col">
						<div class="d-flex justify-content-end">
							<c:if test="${loggedCustomer == null}">
								<button type="button" class="btn btn-outline-success text-white" id="btn_login">Sign in</button>
							</c:if>
							<c:if test="${loggedCustomer != null}">
								<div class="dropdown">
							      <a href="#" class="d-flex align-items-center text-white text-decoration-none dropdown-toggle" id="navbarDropdown" role="button" data-toggle="dropdown" aria-expanded="false">
							        <img src="images/iconuser.png" alt="" width="32" height="32" class="rounded-circle me-2">
							        <strong >${loggedCustomer.fullname}</strong>
							      </a>
							      <ul class="dropdown-menu text-small shadow" aria-labelledby="dropdownUser1">
							        <li><a class="dropdown-item" href="view_cart">My cart</a></li>
							        <li><a class="dropdown-item" href="view_order">My Orders</a></li>
							        <li><a class="dropdown-item" href="view_profile">My profile</a></li>
							        <li><hr class="dropdown-divider"></li>
							        <li><a class="dropdown-item" href="Logout">Sign out</a></li>
							      </ul>
							    </div>
							</c:if>
							<!--
							<c:set var="cart" value="${sessionScope['cart']}"></c:set>
							<c:if test="${cart.totalItems == 0}">
					        	<a class="" id="card" tabindex="0" style="color: white; margin-left: 15px;" 
					        		role="button" 
					        		title="<img src='https://htmlstream.com/front/assets/svg/illustrations/empty-cart.svg' class='img-responsive py-3'/>"
					        		data-toggle="popover" 
					        		data-trigger="focus" 
					        		data-html="true"
					        		data-container="body"
					        		data-placement="bottom"
					        		data-content=" <span>Your card is empty!</span>">
					        		<i class="fas fa-shopping-cart cart" title="Cart"></i>
					        	</a>
						    </c:if>
						    <c:if test="${cart.totalItems > 0}">
								<a href="view_cart" style="color: white; margin-left: 15px;">
									<i class="fas fa-shopping-cart cart" title="Cart"></i>
								</a>
						    </c:if>
						    -->
							<a href="view_cart" class="text-white ms-3 pt-1">
								<i class="fas fa-shopping-cart cart" title="Cart"></i>
							</a>
						</div>
					</div>
				</div>
			</nav>
		</div>
		<!-- Title -->
		<div class="row">
			<div class="col-lg-6 side-left">
				<h1 class="big-hearder text-white scrollanimation animated bounceInLeft" style="animation-delay: 1s">Enjoy the best books
					<span class="text-primary text-highlight-light">
						<span
						     class="txt-rotate"
						     data-period="2000"
						     data-rotate='[ "for you.","nerdy.", "simple.", "pretty.", "fun!" ]'>
						</span>
					</span>
				</h1>
				<form class="d-flex scrollanimation animated bounceInLeft" style="animation-delay: 1s" action="search" method="get">
					<input type="search" class="form-control me-2 input-search"
						placeholder="Search..." name="keyword">
					<button class="btn btn-outline-success" type="submit">
						<i class="fa fa-search"></i>
					</button>
				</form>
			</div>
			<div class="col-lg-6 side-right">
				<img class="title-image rounded-3 scrollanimation animated bounceInRight" style="animation-delay: 1s" src="images/librarys.jpg" alt="iphone-mockup">
			</div>
		</div>
	</div>
</section>


<script type="text/javascript">
	$(document).ready(function() {
		$("#btn_login").click(function() {
			window.location = 'login';
		});

		$("#btn_signup").click(function() {
			window.location = 'register';
		});

		$(".btn-user").click(function() {
			window.location = 'view_profile';
		});
		
		//$("#card").popover();
		
		var TxtRotate = function(el, toRotate, period) {
			  this.toRotate = toRotate;
			  this.el = el;
			  this.loopNum = 0;
			  this.period = parseInt(period, 10) || 2000;
			  this.txt = '';
			  this.tick();
			  this.isDeleting = false;
			};

			TxtRotate.prototype.tick = function() {
			  var i = this.loopNum % this.toRotate.length;
			  var fullTxt = this.toRotate[i];

			  if (this.isDeleting) {
			    this.txt = fullTxt.substring(0, this.txt.length - 1);
			  } else {
			    this.txt = fullTxt.substring(0, this.txt.length + 1);
			  }

			  this.el.innerHTML = '<span class="wrap">'+this.txt+'</span>';

			  var that = this;
			  var delta = 300 - Math.random() * 100;

			  if (this.isDeleting) { delta /= 2; }

			  if (!this.isDeleting && this.txt === fullTxt) {
			    delta = this.period;
			    this.isDeleting = true;
			  } else if (this.isDeleting && this.txt === '') {
			    this.isDeleting = false;
			    this.loopNum++;
			    delta = 500;
			  }

			  setTimeout(function() {
			    that.tick();
			  }, delta);
			};

			window.onload = function() {
			  var elements = document.getElementsByClassName('txt-rotate');
			  for (var i=0; i<elements.length; i++) {
			    var toRotate = elements[i].getAttribute('data-rotate');
			    var period = elements[i].getAttribute('data-period');
			    if (toRotate) {
			      new TxtRotate(elements[i], JSON.parse(toRotate), period);
			    }
			  }
			  // INJECT CSS
			  var css = document.createElement("style");
			  css.type = "text/css";
			  css.innerHTML = ".txt-rotate > .wrap { border-right: 0.08em solid #0d6efd }";
			  document.body.appendChild(css);
			};
	});
</script>