<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
  <nav class="navbar navbar-dark bg-dark">
    <div class="container-fluid d-flex">
      <div class="">
        <button class="navbar-toggler" type="button" data-bs-toggle="offcanvas"
          data-bs-target="#offcanvasWithBothOptions" aria-controls="offcanvasWithBothOptions">
          <span class="navbar-toggler-icon"></span>
        </button>
      </div>
      <div class="ps-3">
        <a href="${pageContext.request.contextPath}/admin/" class="home">
          <span class="fs-3 text-start" style="color: dodgerblue;">Ever<span style="color: green;">green</span></span>
        </a>
      </div>
      <div class="ms-auto">
        <a href="logout" class="nav-link text-white">
          <span class="fs-5">Sign Out</span>
          <i class="fas fa-sign-out-alt ps-3"></i>
        </a>
      </div>
    </div>
    <div class="offcanvas offcanvas-start bg-dark text-white" data-bs-scroll="true" tabindex="-1"
      id="offcanvasWithBothOptions" aria-labelledby="offcanvasWithBothOptionsLabel">
      <div class="offcanvas-header">
        <button type="button" class="btn-close btn-close-white" data-bs-dismiss="offcanvas" aria-label="Close"></button>
      </div>
      <hr>
      <div class="offcanvas-body float">
        <ul class="nav nav-pills flex-column mb-auto">
          <li class="nav-item mx-auto d-block">
            <img class="rounded-circle" style="max-width: 100px; max-height: 100px;" src="https://qxz0lg.sn.files.1drv.com/y4mSmTm0Jl-BE4Z6NwJoNrVDr27zMECjV84fEUubymGGAwrJw1Wn7ckANtrheEn2XB1jASppI6RnzS2FCeiCA6LtdCJrFl9agDpAqF9dp2daeP0Ts-oyERoJF8AX6LLFeZcLRRj8A-L5gMm-9ah5TAhr9JcJeMx6yZfKcM6aHvE3zKlj4F461c58_QQloMz4T5X69ALfAWdhEZZPysvi9EmYA?width=168&height=168&cropmode=none" alt="">
            <p class="pt-3 text-center"><c:out value="${sessionScope.useremail}"></c:out></p>
          </li>
          <li class="nav-item">
            <a href="${pageContext.request.contextPath}/admin/" class="nav-link text-white" aria-current="page">
              <i class="fas fa-home pe-3"></i>
              <span class="fs-5">Home</span>
            </a>
          </li>
          <li>
            <a href="#" class="nav-link text-white" id="manage" data-bs-toggle="collapse" data-bs-target="#orders-collapse" aria-expanded="false">
              <i class="fas fa-cog pe-3"></i>
              <span class="fs-5">Manage</span>
              <i class="fas fa-chevron-right drop-down ps-5" id="icon-chevron"></i>
            </a>
            <div class="collapse ms-4 ps-3" id="orders-collapse">
              <ul class="btn-toggle-nav list-unstyled fw-normal fs-6">
                <li><a href="list_user" class="nav-link text-white">Users</a></li>
                <li><a href="list_category" class="nav-link text-white">Categories</a></li>
                <li><a href="list_books" class="nav-link text-white">Books</a></li>
                <li><a href="list_customer" class="nav-link text-white">Customers</a></li>
                <li><a href="list_reviews" class="nav-link text-white">Reviews</a></li>
                <li><a href="list_orders" class="nav-link text-white">Orders</a></li>
              </ul>
            </div>
          </li>
          <li>
            <a href="logout" class="nav-link text-white">
              <i class="fas fa-sign-out-alt pe-3"></i><span class="fs-5">Sign Out</span>
            </a>
          </li>
        </ul>
      </div>
    </div>
  </nav>

  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/js/bootstrap.bundle.min.js"></script>
  	<script type="text/javascript">
		$(document).ready(function() {
			var n=0;
			$("#manage").click(function() {
				  n += 1;
				  if(n%2 != 0){
					  $("#icon-chevron").removeClass("fa-chevron-right").addClass("fa-chevron-down").delay( 900 );
				  }else{
					  $("#icon-chevron").removeClass("fa-chevron-down").addClass("fa-chevron-right").delay( 900 );
				  }
			});
			
			$(".nav-link")
			  .mouseover(function() {
				  $(this).removeClass("text-white").addClass("text-primary");
			  })
			  .mouseout(function() {
				  $(this).removeClass("text-primary").addClass("text-white");
			 });

		});
  </script>