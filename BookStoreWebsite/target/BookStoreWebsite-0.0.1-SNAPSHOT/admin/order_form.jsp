<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Edit Order - EverGreenBook Administration</title>
<link rel="icon" href="../images/favicon.ico">
<!-- bootstrap -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/css/bootstrap.min.css" rel="stylesheet">
<link rel="stylesheet" href="../css/admin.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.12.0-2/css/all.min.css">
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.5.1/jquery.min.js" charset="utf-8"></script>
</head>
<body>
	<jsp:include page="header.jsp"></jsp:include>
	<div class="container">
		<div class="mt-6">
			<div class="text-center mb-5 shadow p-3 mb-5 bg-body rounded">
				<div class="d-flex justify-content-between mx-1">
					<i class="fas fa-circle pe-3 align-self-center" style="font-size: 15px; color: #0D6EFD;"></i>
					<h3>Edit Order ID: ${order.orderId}</h3>
					<c:if test="${message != null}">
						<h3 class="message">${message}</h3>
					</c:if>
					<i class="fas fa-list fs-4 ps-3 align-self-center" style="color: #0D6EFD;"></i>
				</div>
			</div>
			<form action="update_order" method="post" id="orderForm">
				<div class="shadow p-3 mb-5 bg-body rounded">
					<div class="row">
						<div class="col-lg-4 col-md-5 px-3 py-2">
							<div class="d-flex flex-column">
								<h6 style="color: #0a58ca; font-size: larger;">Payer Info</h6>
								<div class="form-floating flex-fill my-2">
									<input type="text" name="orderby" id="orderby" class="form-control border-top-0 border-end-0 border-start-0" value="${order.customer.fullname}" placeholder="receipt name" readonly="readonly" />
									<label for="orderby">Order by</label>
								</div>
								<div class="form-floating flex-fill my-2">
									<input type="text" name="orderdate" id="orderdate" class="form-control border-top-0 border-end-0 border-start-0" value="<fmt:formatDate pattern=" MM/dd/yyyy" value='${order.orderDate}' />"
										placeholder="order date" readonly="readonly" /> <label for="orderdate">Order Date</label>
								</div>
								<div class="form-floating flex-fill my-2">
									<select name="paymentMethod" id="paymethod" class="form-select border-top-0 border-end-0 border-start-0">
										<option value="Cash On Delivery" <c:if test="${order.paymentMethod eq 'Cash On Delivery'}"> selected='selected'</c:if>>Cash on delivery</option>
										<option value="paypal" <c:if test="${order.paymentMethod eq 'paypal'}">selected='selected' </c:if>>PayPalor Credit cart</option>
									</select> <label for="paymethod">Payment Method</label>
								</div>
								<div class="form-floating flex-fill my-2">
									<select name="orderStatus" id="status" class="form-select border-top-0 border-end-0 border-start-0">
										<option value="Processing" <c:if test="${order.status eq 'Processing'}">selected='selected'</c:if>>Processing</option>
										<option value="Shipping" <c:if test="${order.status eq 'Shipping'}">selected='selected'</c:if>>Shipping</option>
										<option value="Delivered" <c:if test="${order.status eq 'Delivered'}">selected='selected'</c:if>>Delivered</option>
										<option value="Completed" <c:if test="${order.status eq 'Completed'}">selected='selected'</c:if>>Completed</option>
										<option value="Cancel" <c:if test="${order.status eq 'Cancel'}">selected='selected'</c:if>>Cancel</option>
									</select> <label for="status">Status</label>
								</div>
							</div>
						</div>
						<div class="col-lg-8 col-md-7 py-2">
							<div class="d-flex flex-column">
								<h6 style="color: #0a58ca; font-size: larger;">Receipt Info</h6>
								<div class="d-flex my-2">
									<div class="form-floating flex-fill">
										<input type="text" name="firstname" id="firstname" class="form-control border-top-0 border-end-0 border-start-0" value="${order.firstname}" placeholder="receipt name" /> <label
											for="firstname">First name</label>
									</div>
									<div class="form-floating flex-fill ms-1">
										<input type="text" name="lastname" id="lastname" class="form-control border-top-0 border-end-0 border-start-0" value="${order.lastname}" placeholder="receipt name" /> <label for="lastname">Last
											name</label>
									</div>
								</div>
								<div class="d-flex my-2">
									<div class="form-floating flex-fill">
										<input type="text" name="addressLine1" id="addressLine1" class="form-control border-top-0 border-end-0 border-start-0" value="${order.addressLine1}" placeholder="address 1" /> <label
											for="addressLine1">Address 1</label>
									</div>
									<div class="form-floating flex-fill ms-1">
										<input type="text" name="addressLine2" id="addressLine2" class="form-control border-top-0 border-end-0 border-start-0" value="${order.addressLine2}" placeholder="address 2" /> <label
											for="addressLine2">Address 2</label>
									</div>
								</div>
								<div class="d-flex my-2">
									<div class="form-floating flex-fill">
										<div class="d-flex">
											<div class="form-floating flex-fill me-1">
												<input type="text" name="state" id="state" class="form-control border-top-0 border-end-0 border-start-0" value="${order.state}" placeholder="state" /> <label for="state">State</label>
											</div>
											<div class="form-floating flex-fill">
												<input type="text" name="city" id="city" class="form-control border-top-0 border-end-0 border-start-0" value="${order.city}" placeholder="city" /> <label for="city">City</label>
											</div>
										</div>
									</div>
									<div class="form-floating flex-fill ms-1">
										<select name="country" id="country" class="form-select border-top-0 border-end-0 border-start-0">
											<c:forEach items="${mapCountries}" var="country">
												<option value="${country.value}" <c:if test='${order.country eq country.value}'>selected='selected'</c:if>>${country.key}</option>
											</c:forEach>
										</select> <label for="country">Country</label>
									</div>
								</div>
								<div class="d-flex my-2">
									<div class="form-floating flex-fill">
										<input type="number" min="0" name="phone" id="phone" class="form-control border-top-0 border-end-0 border-start-0" value="${order.phone}" placeholder="phone" /> <label for="phone">Phone</label>
									</div>
									<div class="form-floating flex-fill ms-1">
										<input type="number" min="0" name="zipcode" id="zipcode" class="form-control border-top-0 border-end-0 border-start-0" value="${order.zipcode}" placeholder="zipcode" /> <label for="zipcode">ZipCode</label>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
				<div class="d-grid gap-2 d-md-flex justify-content-md-end mb-3">
					<button type="button" id="btn-add" data-id="${listBooks}" class="addbook btn btn-lg btn-light shadow p-3 me-2 bg-body rounded rounded-pill" data-bs-toggle="modal" data-bs-target="#exampleModal">
						<div class="d-flex justify-content-between mx-1">
							<i class="fas fa-circle pe-3 align-self-center" style="font-size: 10px; color: #35b653;"></i> 
							<small class="fw-bolder">Add Book</small> 
							<i class="fas fa-book fs-5 ps-3 align-self-center" style="color: #35b653;"></i>
						</div>
					</button>
				</div>
				<div class="shadow p-3 mb-5 bg-body rounded">
					<div class="table-responsive-lg">
						<table class="table table-hover table-striped caption-top">
							<caption class="fs-3 text-left">
								<span>List produce</span>
							</caption>
							<thead>
								<tr>
									<th>Index</th>
									<th>Book Title</th>
									<th>Author</th>
									<th>Price</th>
									<th>Quantity</th>
									<th>SubTotal</th>
									<th></th>
								</tr>
							</thead>
							<tbody>
								<c:forEach var="orderDetail" items="${order.orderDetails}" varStatus="status">
									<tr class="border-bot">
										<th class="col">${status.index + 1}</th>
										<td class="col">${orderDetail.book.title}</td>
										<td class="col">${orderDetail.book.author}</td>
										<td class="col"><input type="hidden" placeholder="price" name="price" value="${orderDetail.book.price}" /> <fmt:formatNumber value="${orderDetail.book.price}" type="currency" maxFractionDigits = "2" currencySymbol="$" /></td>
										<td class="col"><input type="hidden" placeholder="quantity" name="bookId" value="${orderDetail.book.bookId}" /> 
										<input type="number" class="form-control" name="quantity${status.index + 1}" value="${orderDetail.quantity}" /></td>
										<td class="col"><fmt:formatNumber value="${orderDetail.subtotal}" type="currency" maxFractionDigits = "2" currencySymbol="$" /></td>
										<td><a href="javascript:void(0);" class="deleteLink" id="${orderDetail.book.bookId}">Remove</a></td>
									</tr>
								</c:forEach>
							</tbody>
						</table>
					</div>
					<div class="my-5 mx-5">
						<div class="d-grid gap-2 d-md-flex justify-content-evenly border-bottom mb-2 mt-5 mx-5">
							<div class="d-flex align-items-center justify-content-between">
								<div class="me-auto pe-2">Total amount:</div>
								<div class="">
									<fmt:formatNumber value="${order.subtotal}" type="currency" maxFractionDigits = "2" currencySymbol="$" />
								</div>
							</div>
							<div class="d-flex justify-content-between align-items-center">
								<div class="me-auto pe-2">Tax:</div>
								<div class="input-group align-self-center">
									 <span class="input-group-text">$</span>
									 <input type="text" size="7" class="form-control" value="${order.tax}" name="tax" id="tax"/>
									 <span class="input-group-text">.00</span>
								</div>
							</div>
							<div class="d-flex justify-content-between align-items-center">
								<div class="me-auto pe-2">Shipping:</div>
								<div class="input-group align-self-center">
									 <span class="input-group-text">$</span>
									 <input type="text" class="form-control" size="7" value="${order.shippingFee}" name="shippingFee" id="shippingFee"/>
									 <span class="input-group-text">.00</span>
								</div>
							</div>
						</div>
						<div class="d-flex justify-content-center">
							<div class="pe-2">
								<strong>TOTAL:</strong>
							</div>
							<div class="">
								<fmt:formatNumber value="${order.total}" type="currency" maxFractionDigits = "2" currencySymbol="$" />
							</div>
						</div>
					</div>
					<div class="d-grid gap-2 d-md-flex">
						<button class="btn btn-lg btn-outline-success flex-fill" type="button" id="cancel">Cancel</button>
						<button class="btn btn-lg btn-success flex-fill" type="submit" id="submit">Save</button>
					</div>
				</div>
			</form>
		</div>
	</div>
	<script type="text/javascript">	
		$(document).ready(function() {
			$(".deleteLink").each(function() {
				$(this).on("click",function() {
					bookId = $(this).attr("id");
					if (confirm('Are you sure you want to delete the item book with id ' + bookId + '?')) {
						window.location = 'remove_book_from_order?id=' + bookId;
					}
				});
			});

			$("#cancel").click(function() {
				window.location.href = 'list_orders';
			});
			
			$("#btn-add").click(function(e){
				e.preventDefault();
				showAddBookTopUp();
			});
			
		});
		
		function showAddBookTopUp() {
			window.open('add_book_form', '_blank', 'fullscreen=yes, scrollbars=auto');
		};
	</script>
</body>
</html>