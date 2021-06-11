<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<div class="shadow p-3 mb-5 bg-body rounded">
	<div class="row">
		<div class="col-lg-8 col-md-7 py-2">
			<div class="d-flex flex-column">
				<h6 style="color: #0a58ca; font-size: larger;">Receipt Information</h6>
				<div class="d-flex my-2">
					<div class="form-floating flex-fill ms-1">
						<input type="text" name="firstname" id="firstname" class="form-control border-top-0 border-end-0 border-start-0" value="${order.firstname}" placeholder="first name" readonly="readonly" /> <label
							for="firstname">First Name</label>
					</div>
					<div class="form-floating flex-fill ms-1">
						<input type="text" name="lastname" id="lastname" class="form-control border-top-0 border-end-0 border-start-0" value="${order.lastname}" placeholder="last name" readonly="readonly" /> <label
							for="lastname">Last Name</label>
					</div>
				</div>
				<div class="d-flex my-2">
					<div class="form-floating flex-fill ms-1">
						<input type="text" name="address1" id="address1" class="form-control border-top-0 border-end-0 border-start-0" value="${order.addressLine1}" placeholder="address 1" readonly="readonly" /> <label
							for="address1">Address 1</label>
					</div>
					<div class="form-floating flex-fill ms-1">
						<input type="text" name="address2" id="address2" class="form-control border-top-0 border-end-0 border-start-0" value="${order.addressLine2}" placeholder="address 2" readonly="readonly" /> <label
							for="address2">Address 2</label>
					</div>
				</div>
				<div class="d-flex my-2">
					<div class="form-floating flex-fill ms-1">
						<div class="d-flex">
							<div class="form-floating flex-fill">
								<input type="text" name="state" id="state" class="form-control border-top-0 border-end-0 border-start-0" value="${order.state}" placeholder="state" readonly="readonly" /> <label for="state">State</label>
							</div>
							<div class="form-floating flex-fill ms-1">
								<input type="text" name="city" id="city" class="form-control border-top-0 border-end-0 border-start-0" value="${order.city}" placeholder="city" readonly="readonly" /> <label for="city">City</label>
							</div>
						</div>
					</div>
					<div class="form-floating flex-fill ms-1">
						<input type="text" name="country" id="country" class="form-control border-top-0 border-end-0 border-start-0" value="${order.countryName}" placeholder="country" readonly="readonly" /> 
						<label for="country">Country</label>
					</div>
				</div>
				<div class="d-flex my-2">
					<div class="form-floating flex-fill ms-1">
						<input type="number" name="phone" id="phone" class="form-control border-top-0 border-end-0 border-start-0" value="${order.phone}" placeholder="phone" readonly="readonly" /> <label for="phone">Phone
							Number</label>
					</div>
					<div class="form-floating flex-fill ms-1">
						<input type="number" name="zipcode" id="zipcode" class="form-control border-top-0 border-end-0 border-start-0" value="${order.zipcode}" placeholder="zipcoe" readonly="readonly" /> <label
							for="zipcode">ZipCode</label>
					</div>
				</div>
			</div>
		</div>
		<div class="col-lg-4 col-md-5 px-3 py-2">
			<div class="d-flex flex-column">
				<h6 style="color: #0a58ca; font-size: larger;">Order Overview</h6>
				<div class="d-flex my-2">
					<div class="form-floating flex-fill ms-1">
						<input type="text" name="name" id="name" class="form-control border-top-0 border-end-0 border-start-0" value="${order.customer.fullname}" placeholder="order by" readonly="readonly" /> 
						<label for="name">Order by</label>
					</div>
					<div class="form-floating flex-fill ms-1">
						<input type="text" name="subtotal" id="subtotal" class="form-control border-top-0 border-end-0 border-start-0" value="<fmt:formatNumber value="${order.subtotal}" type="currency" />" placeholder="subtotal" readonly="readonly" /> 
						<label for="subtotal">SubTotal</label>
					</div>
				</div>
				<div class="d-flex my-2">
					<div class="form-floating flex-fill ms-1">
						<input type="text" name="status" id="status" class="form-control border-top-0 border-end-0 border-start-0" value="${order.status}" placeholder="status" readonly="readonly" /> 
						<label for="status">Status</label>
					</div>
					<div class="form-floating flex-fill ms-1">
						<input type="text" name="ship" id="ship" class="form-control border-top-0 border-end-0 border-start-0" value="<fmt:formatNumber value="${order.shippingFee}" type="currency" />" placeholder="ship" readonly="readonly" /> 
						<label for="ship">Shipping</label>
					</div>
				</div>
				<div class="d-flex my-2">
					<div class="form-floating flex-fill ms-1">
						<input type="text" name="date" id="date" class="form-control border-top-0 border-end-0 border-start-0" value="<fmt:formatDate pattern="MM/dd/yyyy" value='${order.orderDate}' />" placeholder="date" readonly="readonly" /> 
						<label for="date">Date</label>
					</div>
					<div class="form-floating flex-fill ms-1">
						<input type="text" name="tax" id="tax" class="form-control border-top-0 border-end-0 border-start-0" value="<fmt:formatNumber value="${order.tax}" type="currency" />" placeholder="tax" readonly="readonly" /> 
						<label for="tax">Tax</label>
					</div>
				</div>
				<div class="d-flex my-2">
					<div class="form-floating flex-fill ms-1">
						<input type="text" name="payment" id="payment" class="form-control border-top-0 border-end-0 border-start-0" value="${order.paymentMethod}" placeholder="payment" readonly="readonly" /> 
						<label for="payment">Payment</label>
					</div>
					<div class="form-floating flex-fill ms-1">
						<input type="text" name="total" id="total" class="form-control border-top-0 border-end-0 border-start-0" value="<fmt:formatNumber value="${order.total}" type="currency" />" placeholder="total" readonly="readonly" /> 
						<label for="total">Total</label>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>
<div class="table-responsive-lg shadow p-3 mb-5 bg-body rounded">
	<table class="table table-hover caption-top">
		<caption class="fs-3 text-left">
			<span>List produce of order ID: ${order.orderId}</span>
		</caption>
		<thead>
			<tr>
				<th scope="col">No</th>
				<th scope="col">Book</th>
				<th scope="col">SubTotal</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach var="orderDetail" items="${order.orderDetails}" varStatus="status">
				<tr class="py-3">
					<th scope="row">${status.index + 1}</th>
					<td>
						<div class="row g-0">
							<div class="col-md-2">
								<img class="img-fluid" width="100px" height="200px" src="data:image/jpg;base64,${orderDetail.book.base64Image}" alt="">
						    </div>
						    <div class="col-md-10">
						    	<div class="card-body">
						        	<h5 class="card-title">${orderDetail.book.title}</h5>
						        	<p class="card-text"><small class="text-muted">${orderDetail.book.author}</small></p>
						        	<div>
										<span class="text-muted"><fmt:formatNumber value="${orderDetail.book.price}" type="currency" /></span>
										<span class="text-muted"> x ${orderDetail.quantity}</span>						        
						        	</div>
						      	</div>
						    </div>
						 </div>
					</td>
					<td><span class="text-muted"><fmt:formatNumber value="${orderDetail.subtotal}" type="currency" /></span></td>
				</tr>
			</c:forEach>
		</tbody>
		<tfoot>
			<tr>
				<td></td>
				<td><span class="fw-bolder fs-5">Total(${order.bookCopies} item):</span></td>
				<td><span class="fw-bolder fs-5"><fmt:formatNumber value="${order.subtotal}" type="currency" /></span></td>
			</tr>
		</tfoot>
	</table>
</div>
