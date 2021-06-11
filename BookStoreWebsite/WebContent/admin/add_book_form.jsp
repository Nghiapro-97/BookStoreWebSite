<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Add Book To Order</title>
<!-- bootstrap -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/css/bootstrap.min.css" rel="stylesheet">
<link rel="stylesheet" href="../css/admin.css">
<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
</head>
<body>
  <div class="bg-transparent modal fade" id="theModal">
    <div class="modal-dialog modal-dialog-centered">
      <div class="modal-content">
        <div class="modal-header">
          <h5 class="modal-title" id="theModalLabel">Add Book To Order ID: ${order.orderId}</h5>
          <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
        </div>
        <form action="add_book_to_order" method="post">
          <div class="modal-body">
            <div class="form-floating flex-fill">
              <select name="bookId" id="book" class="form-select border-top-0 border-end-0 border-start-0">
                <c:forEach items="${listBooks}" varStatus="status" var="book">
                  <option value="${book.bookId}">${book.title}-${book.author}</option>
                </c:forEach>
              </select> <label for="book">Select A Book</label>
            </div>
            <div class="form-floating flex-fill">
              <input type="number" min="1" name="quantity" value="1" id="quantity"
                class="form-control border-top-0 border-end-0 border-start-0" placeholder="book copies" /> <label
                for="quantity">Number
                Of Copies</label>
            </div>
          </div>
          <div class="modal-footer">
            <button type="button" class="btn btn-secondary" onclick="javascript: self.close();">Close</button>
            <button type="submit" class="btn btn-primary" id="submit1">Save changes</button>
          </div>
        </form>
      </div>
    </div>
  </div>

  <script type="text/javascript">
    $(window).on('load', function () {
      $('#theModal').modal('show');
    });
  </script>
</body>
</html>