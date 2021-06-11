package com.bookstore.service;

import java.util.Locale;
import java.util.Map;
import java.util.TreeMap;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class CommonUtility {

	public static void generateCountryList(HttpServletRequest request) {
		String[] countryCodes=Locale.getISOCountries();
		Map<String, String> mapCountries=new TreeMap<String, String>();
		
		for (String countryCode : countryCodes) {
			Locale locale = new Locale("",countryCode);
			String code=locale.getCountry();
			String name=locale.getDisplayCountry();
			
			mapCountries.put(name,code);
		}
		
		request.setAttribute("mapCountries", mapCountries);
	}
	
	public static void forwardToPage(String page, String message,
			HttpServletRequest request, HttpServletResponse response) 
					throws ServletException, IOException {
		request.setAttribute("message", message);
		request.getRequestDispatcher(page).forward(request, response);		
	}
	
	public static void showMessageFrontend(String message, 
			HttpServletRequest request, HttpServletResponse response) 
					throws ServletException, IOException {
		forwardToPage("frontend/message.jsp", message, request, response);
	}
	
	public static void showMessageBackend(String message, 
			HttpServletRequest request, HttpServletResponse response) 
					throws ServletException, IOException {
		forwardToPage("message.jsp", message, request, response);
	}

	public static void forwardToPage(String page,
			HttpServletRequest request, HttpServletResponse response) 
					throws ServletException, IOException {
		request.getRequestDispatcher(page).forward(request, response);		
	}	

}
