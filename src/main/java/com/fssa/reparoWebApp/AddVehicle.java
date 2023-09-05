package com.fssa.reparoWebApp;

import java.io.IOException;
import java.io.Serial;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.fssa.reparo.dto.vehicle.VehicleRequestDto;
import com.fssa.reparo.dto.vehicle.VehicleResponseDto;
import com.fssa.reparo.exception.ServiceException;
import com.fssa.reparo.service.VehicleService;
import com.fssa.reparoWebApp.mapper.MappingConversionException;
import com.fssa.reparoWebApp.mapper.UserHttpRequestToDto;

/**
 * Servlet implementation class AddVehicle
 */
@WebServlet("/AddVehicle")
public class AddVehicle extends HttpServlet {
	@Serial
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		UserHttpRequestToDto map = new UserHttpRequestToDto();
		VehicleService vehicleService = new VehicleService();
		HttpSession session =  request.getSession(false);
		int userId = 0 ;
		try {
			if(session!=null) {
				userId = (int)session.getAttribute("userId");
				
			}
			
			VehicleRequestDto vehicleRequestDto = map.convertHttpRequestToVehicleRequestDto(request);
			vehicleRequestDto.setUserId(userId);
			vehicleService.addVehicle(vehicleRequestDto);
			VehicleResponseDto resp = vehicleService.getVehicleByUserId(userId);
			session.setAttribute("vehicleId", resp.getVehicleId());
			RequestDispatcher dispatcher = request.getRequestDispatcher("./customerBooking.jsp");
			dispatcher.forward(request, response);
		} catch (MappingConversionException | ServiceException e) {
			String[] err =  e.getMessage().split(":");
			response.sendRedirect("./customer.jsp?error="+err[err.length-1]);
		}

	}

}
