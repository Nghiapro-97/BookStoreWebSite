package com.bookstore.service;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.bookstore.dao.CustomerDAO;
import com.bookstore.dao.HashGenerator;
import com.bookstore.dao.OrderDAO;
import com.bookstore.dao.ReviewDAO;
import com.bookstore.entity.Customer;

public class CustomerServices {
	private CustomerDAO customerDAO;
	private HttpServletRequest request;
	private HttpServletResponse response;
	
	public CustomerServices(HttpServletRequest request, HttpServletResponse response) {
		super();
		this.request=request;
		this.response=response;
		customerDAO=new CustomerDAO();
	}
	
	public void listCustomer(String message) throws ServletException, IOException {
		List<Customer> listCustomers = customerDAO.listAll();
		request.setAttribute("listCustomers", listCustomers);
		
		if (message != null) {
			request.setAttribute("message", message);
		}
		
		CommonUtility.forwardToPage("customer_list.jsp", request, response);
	}

	public void listCustomer() throws ServletException, IOException {
		listCustomer(null);
	}

	public void createCustomer() throws ServletException, IOException {
		String email=request.getParameter("email");
		Customer existcustomer=customerDAO.findByEmail(email);
		
		if (existcustomer != null) {
			String message="Could not create custormer: the email " + email + "is already registered by another customer!";
			listCustomer(message);
		}else {
			Customer newCustomer=new Customer();
			updateCustomerFieldsFromForm(newCustomer);
			customerDAO.create(newCustomer);
			
			String message="Create customer successfully!!!";
			listCustomer(message);
			
		}
	}

	public void updateCustomer() throws ServletException, IOException {
		Integer customerId=Integer.parseInt(request.getParameter("customerId"));
		String email=request.getParameter("email");
		String message=null;
		Customer customerByEmail=customerDAO.findByEmail(email);

		if (customerByEmail != null && customerByEmail.getCustomerId() != customerId) {
			message="Cound not update customerId " + customerId + " because there's an existing customer having same email!";
			listCustomer(message);
			return;
		}else {
			Customer customerById=customerDAO.get(customerId);
			updateCustomerFieldsFromForm(customerById);

			customerDAO.update(customerById);
			message="the customer has been updated successfully!";
		}
		
		listCustomer(message);
	}

	public void editCustomer() throws ServletException, IOException {
		Integer customerId=Integer.parseInt(request.getParameter("id"));
		Customer customer=customerDAO.get(customerId);
		
		if (customer == null) {
			String message = "Could not find customer with ID " + customerId;
			CommonUtility.showMessageBackend(message, request, response);
		} else {
			customer.setPassword(null);
			request.setAttribute("customer", customer);		
			CommonUtility.generateCountryList(request);
			CommonUtility.forwardToPage("customer_form.jsp", request, response);			
		}
		
	}

	public void deleteCustomer() throws ServletException, IOException {
		Integer customerId=Integer.parseInt(request.getParameter("id"));
		Customer customer = customerDAO.get(customerId);
		
		if (customer != null) {
			
			ReviewDAO reviewDAO = new ReviewDAO();
			long reviewCount = reviewDAO.countByCustomer(customerId);
			
			if (reviewCount > 0) {
				
				String message = "Could not delete customer with ID " + customerId
						+ " because he/she posted reviews for books.";
				CommonUtility.showMessageBackend(message, request, response);
				
			} else {
				
				OrderDAO orderDAO = new OrderDAO();
				long orderCount = orderDAO.countByCustomer(customerId);
				
				if (orderCount > 0) {
					
					String message = "Could not delete customer with ID " + customerId 
							+ " because he/she placed orders.";
					CommonUtility.showMessageBackend(message, request, response);
					
				} else {
					
					customerDAO.delete(customerId);			
					String message = "The customer has been deleted successfully.";
					listCustomer(message);
				}
			}	
		} else {
			String message = "Could not find customer with ID " + customerId + ", "
					+ "or it has been deleted by another admin";
			CommonUtility.showMessageBackend(message, request, response);
		}
	}
	
	private void updateCustomerFieldsFromForm(Customer customer) {
		
		String email=request.getParameter("email");
		String firstName=request.getParameter("firstName");
		String lastName=request.getParameter("lastName");
		String password=request.getParameter("password");
		String phone=request.getParameter("phone");
		String addressLine1=request.getParameter("address1");
		String addressLine2=request.getParameter("address2");
		String city=request.getParameter("city");
		String state=request.getParameter("state");
		String zipcode=request.getParameter("zipcode");
		String country=request.getParameter("country");
		
		if (email != null && !email.equals("")) {			
			customer.setEmail(email);
		}
		
		customer.setFirstname(firstName);
		customer.setLastname(lastName);
		
		if (password != null && !password.equals("")) {
			
			String encryptedPassword = HashGenerator.generateMD5(password);
			customer.setPassword(encryptedPassword);
			
		}
		
		customer.setPhone(phone);
		customer.setAddressLine1(addressLine1);
		customer.setAddressLine2(addressLine2);
		customer.setCity(city);
		customer.setState(state);
		customer.setZipcode(zipcode);
		customer.setCountry(country);
	}

	public void registerCustomer() throws ServletException, IOException {
		
		String email=request.getParameter("email");
		String message="";
		Customer existcustomer=customerDAO.findByEmail(email);
		
		if (existcustomer != null) {
			
			message="Could not register: the email " + email + "is already registered by another customer!";
			
		}else {
			
			Customer newCustomer=new Customer();
			updateCustomerFieldsFromForm(newCustomer);
			customerDAO.create(newCustomer);
			message="You have registered successfully! Thank you.<br/>" + "<a href='login'>Click here </a> to login.";
			
		}
		
		request.setAttribute("existcustomer", existcustomer);
		CommonUtility.forwardToPage("frontend/message.jsp", message, request, response);
	}

	public void showLogin() throws ServletException, IOException {
		
		CommonUtility.forwardToPage("frontend/login.jsp", request, response);
		
	}

	public void doLogin() throws ServletException, IOException {
		String email=request.getParameter("email");
		String password=request.getParameter("password");
		Customer customer=customerDAO.checkLogin(email, password);
		
		if (customer == null) {
			
			String message="Login fail! please check your email or password.";
			request.setAttribute("message", message);
			showLogin();
			
		}else {
			
			HttpSession session=request.getSession();
			session.setAttribute("loggedCustomer", customer);
			
			Object objRedirecURL=session.getAttribute("redirecURL");
			
			if (objRedirecURL != null) {
				
				String redirecURL=(String)objRedirecURL;
				session.removeAttribute("redirecURL");
				response.sendRedirect(redirecURL);
				
			}else {
				
				showCustomerProfile();
			}
		}
	}
	
	public void showCustomerProfile() throws ServletException, IOException {
		
		CommonUtility.forwardToPage("frontend/customer_profile.jsp", request, response);
		
	}

	public void showCustomerProfileEditForm() throws ServletException, IOException {
		
		CommonUtility.generateCountryList(request);
		CommonUtility.forwardToPage("frontend/edit_profile.jsp", request, response);
		
	}

	public void updateCustomerProfile() throws ServletException, IOException {
		
		Customer customer=(Customer) request.getSession().getAttribute("loggedCustomer");
		updateCustomerFieldsFromForm(customer);
		customerDAO.update(customer);
		
		showCustomerProfile();
	}

	public void newCustomer() throws ServletException, IOException {
		
		CommonUtility.generateCountryList(request);
		CommonUtility.forwardToPage("customer_form.jsp", request, response);

	}

	public void showCustomerRegistrationForm() throws ServletException, IOException {
		
		CommonUtility.generateCountryList(request);
		CommonUtility.forwardToPage("frontend/register_form.jsp", request, response);
		
	}

}
