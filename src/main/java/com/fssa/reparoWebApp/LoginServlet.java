package com.fssa.reparoWebApp;
import java.io.IOException;
import java.io.Serial;
import java.util.List;
import com.fssa.reparo.dto.user.UserRequestDto;
import com.fssa.reparo.dto.user.UserResponseDto;
import com.fssa.reparo.dto.workshop.WorkShopResponseDto;
import com.fssa.reparo.service.*;
import com.fssa.reparo.exception.ServiceException;
import com.fssa.reparoWebApp.mapper.MappingConversionException;
import com.fssa.reparoWebApp.mapper.UserHttpRequestToDto;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/LoginServlet")
public class LoginServlet extends HttpServlet {
	@Serial
	private static final long serialVersionUID = 1L;
	
	
	
	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {		
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		UserHttpRequestToDto requestMap =  new UserHttpRequestToDto();
		UserServices services = new UserServices();
		WorkShopService workshopServices =  new WorkShopService();
		try {
			UserRequestDto req = requestMap.convertHttpRequestToUserLoginDto(request);
			int id =  services.loginUser(req.getNumber(),req.getPassword());
			HttpSession session =  request.getSession();
			session.setAttribute("userId", id);
			request.setAttribute("userId",id);
			RequestDispatcher dispatcher = request.getRequestDispatcher("./customer.jsp");
			dispatcher.forward(request, response);
		   
		}catch(ServiceException | MappingConversionException e) {
               String [] arr = e.getMessage().split(":");
               response.sendRedirect("./login.jsp?error="+arr[1]);
		}
		
		

	
	}

}
