<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<div class="d-flex justify-content-between">
	<div class="form-floating flex-fill">
		<input type="text" name="firstName" id="firstName" class="form-control border-top-0 border-end-0 border-start-0" value="${customer.firstname}" placeholder="First name" required /> <label
			for="firstName">First name</label>
	</div>
	<div class="form-floating ms-1 flex-fill">
		<input type="text" name="lastName" class="form-control border-top-0 border-end-0 border-start-0" id="lastName" value="${customer.lastname}" placeholder="Last name" required /> <label for="lastName">Last
			name</label>
	</div>
</div>
<div class="d-flex justify-content-between">
	<div class="form-floating flex-fill">
		<input type="text" name="address1" id="address1" class="form-control border-top-0 border-end-0 border-start-0" value="${customer.addressLine1}" placeholder="Address line 1" required> <label
			for="address1">Address 1</label>
	</div>
	<div class="form-floating ms-1 flex-fill">
		<input type="text" name="address2" id="address2" class="form-control border-top-0 border-end-0 border-start-0" value="${customer.addressLine2}" placeholder="Address line 2" required> <label
			for="address2">Address 2</label>
	</div>
</div>
<div class="d-flex justify-content-between">
	<div class="form-floating flex-fill">
		<input type="number" name="phone" id="phone" min="0" class="form-control border-top-0 border-end-0 border-start-0" value="${customer.phone}" placeholder="phone number" required> <label
			for="phone">Phone number</label>
	</div>
	<div class="form-floating ms-1 flex-fill">
		<input type="number" name="zipcode" class="form-control border-top-0 border-end-0 border-start-0" id="zipcode" min="0" value="${customer.zipcode}" placeholder="Zip code" required> <label
			for="zipcode">ZipCode</label>
	</div>
</div>
<div class="d-flex justify-content-between">
	<div class="form-floating flex-fill">
		<input type="text" name="city" class="form-control border-top-0 border-end-0 border-start-0" id="city" value="${customer.city}" placeholder="City" required> <label for="city">City</label>
	</div>
	<div class="form-floating ms-1 flex-fill">
		<input type="text" name="state" id="state" class="form-control border-top-0 border-end-0 border-start-0" value="${customer.state}" placeholder="State" required> <label for="state">State</label>
	</div>
</div>
<div class="d-flex justify-content-between">
	<div class="form-floating">
		<input type="email" name="email" id="email" class="form-control border-top-0 border-end-0 border-start-0" value="${customer.email}" placeholder="Email" required> <label for="email">Email</label>
	</div>
	<div class="form-floating ms-1">
		<select name="country" class="form-select border-top-0 border-end-0 border-start-0" id="country">
			<c:forEach items="${mapCountries}" var="country">
				<option value="${country.value}" <c:if test='${customer.country eq country.value}'>
		                                            selected='selected'</c:if>>${country.key}</option>
			</c:forEach>
		</select> 
		<label for="country">Country</label>
	</div>
</div>
<div class="d-flex justify-content-between">
	<div class="form-floating flex-fill">
		<input type="password" name="password" class="form-control border-top-0 border-end-0 border-start-0" id="password" value="${customer.password}" placeholder="Password" required> <label
			for="password">Password</label>
	</div>
	<div class="form-floating ms-1 flex-fill">
		<input type="password" name="confirmPassword" class="form-control border-top-0 border-end-0 border-start-0" id="confirmPassword" value="${customer.password}" placeholder="Confirm Password" required>
		<label for="confirmPassword">Confirm password</label>
	</div>
</div>
