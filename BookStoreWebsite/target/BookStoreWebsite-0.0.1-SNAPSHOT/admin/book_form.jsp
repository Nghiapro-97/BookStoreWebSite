<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<link rel="icon" href="../images/favicon.ico">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/css/bootstrap.min.css" rel="stylesheet">
<link rel="stylesheet" href="../css/admin.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.12.0-2/css/all.min.css">
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.5.1/jquery.min.js" charset="utf-8"></script>
<!-- library rich text -->
<link rel="stylesheet" href="https://netdna.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel="stylesheet" href="../css/richtext.min.css">
<script src="../js/jquery.richtext.min.js"></script>
<!-- library date time picker -->
<link href="https://code.jquery.com/ui/1.10.4/themes/ui-lightness/jquery-ui.css" rel="stylesheet">
<script type="text/javascript" src="../js/jquery.validate.min.js"></script>
<script src="https://code.jquery.com/ui/1.10.4/jquery-ui.js"></script>
</head>
<body>
	<jsp:include page="header.jsp"></jsp:include>
	<div class="container">
		<div class="pt-6">
			<div class="text-center shadow p-3 mb-5 bg-body rounded">
				<c:if test="${book != null}">
					<div class="d-flex justify-content-between mx-1">
						<i class="fas fa-circle pe-3 align-self-center" style="font-size: 15px; color: #6610f2;"></i>
						<h3>Edit Book</h3>
						<i class="fas fa-book fs-4 ps-3 align-self-center" style="color: #6610f2;"></i>
					</div>
				</c:if>
				<c:if test="${book == null}">
					<div class="d-flex justify-content-between mx-1">
						<i class="fas fa-circle pe-3 align-self-center" style="font-size: 15px; color: #6610f2;"></i>
						<h3>Create New Book</h3>
						<i class="fas fa-user fs-4 ps-3 align-self-center" style="color: #6610f2;"></i>
					</div>
				</c:if>
			</div>
			<div class="shadow p-3 mb-5 bg-body rounded">
					<form method="post" id="bookForm" name="bookForm" enctype="multipart/form-data">
						<input type="hidden" name="bookId" value="${book.bookId}" />
						<div class="card mb-3">
							<div class="row g-0">
							   <div class="col-md-4">
							      <img id="thumbnai" alt="image preview" class="img-fluid p-3" src="data:image/jpg;base64,${book.base64Image}">
							   </div>
							   <div class="col-md-8">
							      	<div class="card-body">
										<div class="input-group mb-3">
										  <input type="file" class="form-control" name="bookImage" id="bookImage" <c:if test="${book == null}">required='required'</c:if>>
										</div>
										<div class="form-floating mb-3">
											<select name="category" class="form-select" id="floatingSelect">
												<c:forEach items="${listCategorys}" var="category">
													<option value="${category.categoryId}" <c:if test="${category.categoryId eq book.category.categoryId}">selected='selected'</c:if>>
														${category.name}
													</option>
												</c:forEach>
										  	</select>
										  	<label for="floatingSelect">Category</label>
										</div>
										<div class="form-floating mb-3">
										  <input type="text" class="form-control" maxlength="128" name="title" id="title" value="${book.title}" placeholder="Book title..." required>
										  <label for="title">Title</label>
										</div>
										<div class="form-floating mb-3">
										  <input type="text" class="form-control" maxlength="64" name="author" id="author" value="${book.author}" placeholder="Book author..." required>
										  <label for="author">Author</label>
										</div>
										<div class="form-floating mb-3">
										  <input type="number" class="form-control" min="0" name="isbn" id="isbn" value="${book.isbn}" placeholder="ISBN..." required>
										  <label for="isbn">ISBN</label>
										</div>
										<div class="form-floating mb-3">
										  <input type="text" class="form-control" name="publishDate" id="publishDate" value="<fmt:formatDate pattern="MM/dd/yyyy" value='${book.publishDate}' />" placeholder="Public date..." required>
										  <label for="publishDate">Public Date</label>
										</div>
										<div class="form-floating">
										  <input type="number" class="form-control" step="0.01" min="0" name="price" id="price" value="${book.price}" placeholder="Price book..." required>
										  <label for="publishDate">Price</label>
										</div>
									</div>
							   	</div>
							</div>
						</div> 
						<div class="input-group">
							<span class="input-group-text">Description</span>
							<textarea class="form-control" name="description" maxlength="16777215" id="description" cols="70" rows="10" required="required">${book.description}</textarea>
						</div>
						<div class="d-grid gap-2 d-md-flex">
							<button class="btn btn-lg btn-outline-success flex-fill" type="button" id="cancel">Cancel</button>
							<button class="btn btn-lg btn-success flex-fill" type="submit" id="submit" onclick="return fun()">Save</button>
						</div>
					</form>
			</div>
		</div>
	</div>
	<script type="text/javascript">
		function fun() {
			if (${book != null}) { 
				document.bookForm.action = "update_book";
			}else {
				document.bookForm.action = "create_book";
			}
		};
	
        $('#description').richText({
        	maxlength: 16777215,
        });	
        	
		$(document).ready(function(){
			$("#publishDate").datepicker();
			
			$("#bookImage").change(function() {
				showImageThumbnai(this);
			});
			
			$("#cancel").click(function(){
				history.go(-1);
			});
								
			function showImageThumbnai(fileInput) {
				var file=fileInput.files[0];
				var reader=new FileReader();
				
				reader.onload = function (e) {
					$("#thumbnai").attr('src', e.target.result);
				};
				
				reader.readAsDataURL(file);
			};
		});
	
	</script>
</body>
</html>