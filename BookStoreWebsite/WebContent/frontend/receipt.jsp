<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
    <div class="row">
      <div class="border-bottom">
        <h4 id="dates"></h4>
      </div>
      <div class="border-bottom my-5 d-flex justify-content-between">
        <div class="d-flex flex-column text-start">
          <h3 class="item">Evergeen Book</h3>
          <span>Email: evergreen@gmail.com</span>
          <span>Phone: +1 1234 567 891</span>
        </div>
        <div class="d-flex flex-column text-start">
          <h3 class="item">Buyer</h3>
          <span>Sold To: ${payer.firstName} ${payer.lastName}</span>
          <span>Email: ${payer.email}</span>
        </div>
      </div>
      <div class="my-5">
        <table class="table">
          <tr>
            <th scope="col">No</th>
            <th scope="col">Item</th>
            <th scope="col">Price</th>
            <th scope="col">Quantity</th>
            <th scope="col">Subtotal</th>
          </tr>
          <c:forEach items="${transaction.itemList.items}" var="item" varStatus="status">
	          <tr>
	            <td scope="row">${status.index + 1}</td>
	            <td>
	              <span>${item.name}</span>
	            </td>
	            <td><fmt:formatNumber value="${item.price}" type="currency" maxFractionDigits = "2" currencySymbol="$" /></td>
	            <td>${item.quantity}</td>
	            <td><fmt:formatNumber value="${item.price * item.quantity}" type="currency" maxFractionDigits = "2" currencySymbol="$" /></td>
	          </tr>
          </c:forEach>
        </table>
		<div class="my-5 mx-5">
			<div class="d-grid gap-2 d-md-flex justify-content-evenly border-bottom mb-2 mt-5 mx-5">
				<div class="d-flex align-items-center justify-content-between">
					<div class="me-auto pe-2">Total amount:</div>
					<div class="">
						<fmt:formatNumber value="${transaction.amount.details.subtotal}" type="currency" maxFractionDigits="3" currencySymbol="$" />
					</div>
				</div>
				<div class="d-flex justify-content-between align-items-center">
					<div class="me-auto pe-2">Tax:</div>
					<div class="">
						<fmt:formatNumber value="${transaction.amount.details.tax}" type="currency" maxFractionDigits="3" currencySymbol="$" />
					</div>
				</div>
				<div class="d-flex justify-content-between align-items-center">
					<div class="me-auto pe-2">Shipping:</div>
					<div class="">
						<fmt:formatNumber value="${transaction.amount.details.shipping}" type="currency" maxFractionDigits="3" currencySymbol="$" />
					</div>
				</div>
			</div>
			<div class="d-flex justify-content-center">
				<div class="pe-2">
					<strong>TOTAL:</strong>
				</div>
				<div class="">
					<fmt:formatNumber value="${transaction.amount.total}" type="currency" maxFractionDigits="3" currencySymbol="$" />
				</div>
			</div>
		</div>
      </div>
    </div>
	<script>
		function getDateReceipt() {
	        var d = new Date();
	        var str_date = d.toDateString();
	        document.getElementById("dates").innerHTML = "Receipt - " + str_date;
	    };
	    getDateReceipt();
	</script>