package com.link.admin;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.link.user.model.UserDTO;
import com.link.user.repository.UserDAO;

public class ListUser extends HttpServlet {
		
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		UserDAO dao = new UserDAO();
		
		UserDTO dto = new UserDTO(); 
				
		dao.getUserInfo(dto.getId());
		
		System.out.println(dto);

	}
}