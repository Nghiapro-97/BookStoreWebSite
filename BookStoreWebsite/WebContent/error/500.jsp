<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Page Not Found Error</title>
<link rel="icon" href="../images/favicon.ico">
<!-- bootstrap -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/css/bootstrap.min.css" rel="stylesheet">
<link rel="stylesheet" href="../css/styles.css">
<!-- google font -->
<link href="https://fonts.googleapis.com/css2?family=Montserrat:wght@100;300;400;500;900&family=Ubuntu:wght@300;400;700&display=swap" rel="stylesheet">
<!-- font Awesome -->
<script src="https://kit.fontawesome.com/c65095b9a1.js"></script>
</head>
<body>
	<div class="container py">
		<div class="d-flex flex-column align-items-center">
			 <h1 class="display-1 my-5">500. Internal Server Error</h1>
			 <span class="text-muted mb-5">Sorry, the server has encountered an error while fulfilling your request! We suggest that you return to home page.</span>
			 <button onclick="goBack()" class="btn btn-lg btn-dark w-15">Go back</button>
		</div>
	</div> 
	<script type="text/javascript">
		function goBack() {
			  window.history.back();
		}
	</script>
</body>
</html>