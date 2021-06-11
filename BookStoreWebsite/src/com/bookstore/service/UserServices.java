package com.bookstore.service;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.bookstore.dao.HashGenerator;
import com.bookstore.dao.UserDAO;
import com.bookstore.entity.Users;

public class UserServices {
	private UserDAO userDAO;
	private HttpServletRequest request;
	private HttpServletResponse response;

	public UserServices(HttpServletRequest request, HttpServletResponse response) {
		this.request=request;
		this.response=response;
		userDAO=new UserDAO();
	}
	
	public void listUser() throws ServletException, IOException {
		listUser(null);
	}
	
	public void listUser(String message) throws ServletException, IOException {
		List<Users> listUsers=userDAO.listAll();
		
		request.setAttribute("listUsers", listUsers);
		
		if (message != null) {
			request.setAttribute("message", message);
		}
		
		CommonUtility.forwardToPage("user_list.jsp", request, response);
	}
	
	public void CreateUser() throws ServletException, IOException {
		String email=request.getParameter("email");
		String fullName=request.getParameter("fullName");
		String password=request.getParameter("password");
		
		Users existUser=userDAO.findByEmail(email);
		
		if (existUser != null) {
			
			String message="Could not create user. A user with email " + email + " already exist!";
			CommonUtility.showMessageBackend(message, request, response);
			
		} else {
			Users newUser = new Users(email,fullName,password);
			userDAO.create(newUser);
			listUser("Create new user successfully!!!");
		}
		
	}

	public void editUser() throws ServletException, IOException {
		int userId=Integer.parseInt(request.getParameter("id"));
		Users user=userDAO.get(userId);
		
		String editPage="user_form.jsp";
		
		if (user == null) {
			editPage = "message.jsp";
			String errorMessage="Could not find user with ID " + userId;
			request.setAttribute("message", errorMessage);
		} else {
			user.setPassword(null);
			request.setAttribute("user", user);
		}
		
		CommonUtility.forwardToPage(editPage, request, response);
	}

	public void updateUser() throws ServletException, IOException {
		int userId=Integer.parseInt(request.getParameter("userId"));
		String email=request.getParameter("email");
		String fullName=request.getParameter("fullName");
		String password=request.getParameter("password");
		
		Users userById=userDAO.get(userId);
		Users userByEmail=userDAO.findByEmail(email);
		
		if (userByEmail != null && userByEmail.getUserId() != userById.getUserId()) {
			
			String message="Count not update user. A user with email " + email + " already exist!";
			CommonUtility.showMessageBackend(message, request, response);
			
		} else {
			
			userById.setEmail(email);
			userById.setFullName(fullName);
			
			if (password != null & !password.isEmpty()) {
				String encryptedPassword = HashGenerator.generateMD5(password);
				userById.setPassword(encryptedPassword);				
			}
			
			userDAO.update(userById);
			
			String message="User has been updated successfully!";
			listUser(message);
		}
		
	}

	public void deleteUser() throws ServletException, IOException {
		int userId=Integer.parseInt(request.getParameter("id"));
		Users userDel=userDAO.get(userId);
		
		String message="User has been deleted successfully!!!";
		
		if (userDel == null) {
			
			message = "Could not find user with ID " + userId
					+ ", or it might have been deleted by another admin";
			
			CommonUtility.showMessageBackend(message, request, response);
			
		} else {

			userDAO.delete(userId);
			listUser(message);
		}
		
		if (userId == 1) {
			
			message = "The default admin user account cannot be deleted.";
			CommonUtility.showMessageBackend(message, request, response);
			
			return;
		}
	}

	public void login() throws ServletException, IOException {
		
		String email=request.getParameter("email");
		String password=request.getParameter("password");
		
		boolean loginResult=userDAO.checkLogin(email, password);
		
		if (loginResult) {
			
			String[] parts = email.split("@");
			request.getSession().setAttribute("useremail", parts[0]);
			
			CommonUtility.forwardToPage("/admin/", request, response);
			
		} else {
			
			String message="Login Fail! please check your email or password.";
			CommonUtility.forwardToPage("login.jsp", message, request, response);
		}
	}

}
