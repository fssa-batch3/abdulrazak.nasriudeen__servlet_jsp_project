package com.fssa.reparoWebApp;
import java.io.IOException;
import java.io.PrintWriter;
import java.io.Serial;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import com.fssa.reparo.service.UserServices;
import com.fssa.reparo.exception.ServiceException;
import com.fssa.reparoWebApp.mapper.*;
import com.fssa.reparo.dto.user.UserRequestDto;

@WebServlet("/UserRegistrationServlet")
public class UserRegistrationServlet extends HttpServlet {
	@Serial
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		UserHttpRequestToDto req = new UserHttpRequestToDto();

		UserServices service = new UserServices();

		try {
			UserRequestDto user = req.convertHttpRequestToUserDTO(request);
			service.registerUser(user);
			response.sendRedirect("./login.jsp?success=Your account created Successfully");
		} 
		catch (ServiceException | MappingConversionException e) {
			String msg = e.getMessage();
			String[] arr = msg.split(":");
			response.sendRedirect("./signUp.jsp?error=" + arr[1]);

		}

	}

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		PrintWriter out = resp.getWriter();
		out.print("ckeck");
		

	}

}
