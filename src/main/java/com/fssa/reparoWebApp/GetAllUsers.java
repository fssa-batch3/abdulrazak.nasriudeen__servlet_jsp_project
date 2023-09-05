package com.fssa.reparoWebApp;

import java.io.IOException;
import java.io.PrintWriter;
import java.io.Serial;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.fssa.reparo.dto.user.UserResponseDto;
import org.json.JSONArray;
import org.json.JSONObject;

import com.fssa.reparo.exception.ServiceException;
import com.fssa.reparo.service.UserServices;

/**
 * Servlet implementation class GetAllUsers
 */
@WebServlet("/GetAllUsers")
public class GetAllUsers extends HttpServlet {
	@Serial
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public GetAllUsers() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		UserServices getUsers = new UserServices();
		try {
			List<UserResponseDto> arr =  getUsers.getAllUsers();
			JSONArray userJSonArray = new JSONArray(arr);
			JSONObject obj  =  new JSONObject(arr.get(0));
			PrintWriter out = response.getWriter();
			out.println(userJSonArray.toString());
			out.println(obj.toString());

		} catch (ServiceException e) {
			System.out.println(e.getMessage());
		}
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
