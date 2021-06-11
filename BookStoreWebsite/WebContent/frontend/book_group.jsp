<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<div class="col">
	<div class="card shadow h-100 bg-body rounded card1" style="max-width: 540px;">
		<div class="row g-0">
			<div class="col-md-4">
				<a href="view_book?id=${book.bookId}"> 
					<img style="min-height: 266px;" alt="imageBook" src="data:image/jpg;base64,${book.base64Image}" class="img-fluid" />
				</a>
			</div>
			<div class="col-md-8">
				<div class="card-body">
					<h4 class="card-title d-inline-block text-truncate" style="max-width: 200px;">
						<a class="text-decoration-none text-reset" href="view_book?id=${book.bookId}">${book.title}</a> 
					</h4>
					<p class="card-text">
						<small class="text-muted">by ${book.author}</small>
					</p>
					<div class="pt-4">
						<h4 class="card-title pricing-card-title">
							<fmt:setLocale value="es-AR"/>
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