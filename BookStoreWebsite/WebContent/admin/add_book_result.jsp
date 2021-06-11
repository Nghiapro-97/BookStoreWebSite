<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Add Book To Order</title>
<!-- bootstrap -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/css/bootstrap.min.css" rel="stylesheet">
<link rel="stylesheet" href="../css/admin.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.12.0-2/css/all.min.css">
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.5.1/jquery.min.js" charset="utf-8"></script>
</head>
<body>
	<div class="container">
		<div class="alert alert-success" role="alert">
            <h4 class="alert-heading">Well done!</h4>
            <p>The book <i>${book.title}</i> has been added to the order ID: <b>${order.orderId}</b>!</p>
            <hr>
            <div class="d-grid gap-2 d-md-flex justify-content-md-end">
                <input type="button" class="btn btn-lg btn-success" value="Close" onclick="javascript: self.close();"/>
            </div>
        </div>
	</div>
	<script type="text/javascript">
		window.onunload = function() {
			window.opener.location.reload();
		}
	</script>
</body>
</html>