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
	            <td><fmt:formatNumber value="${item.price}" type="currency" /></td>
	            <td>${item.quantity}</td>
	            <td><fmt:formatNumber value="${item.price * item.quantity}" type="currency" /></td>
	          </tr>
          </c:forEach>
        </table>
        <div class="px-5 my-5 mx-5">
          <div class="d-flex justify-content-evenly border-bottom mb-2 mt-5 mx-5">
            <div class="pb-1">SubTotal: <fmt:formatNumber value="${transaction.amount.details.subtotal}" type="currency" /></div>
            <div>Tax: <fmt:formatNumber value="${transaction.amount.details.tax}" type="currency" /></div>
            <div>Shipping: <fmt:formatNumber value="${transaction.amount.details.shipping}" type="currency" /></div>
          </div>
          <div class="text-center">
            <strong>Total: <fmt:formatNumber value="${transaction.amount.total}" type="currency" /></strong>
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