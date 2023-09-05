package com.fssa.reparoWebApp;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.fssa.reparo.dto.booking.*;
import com.fssa.reparo.dto.vehicle.VehicleResponseDto;
import com.fssa.reparo.exception.ServiceException;
import com.fssa.reparo.service.BookingServices;
import com.fssa.reparo.service.VehicleService;

/**
 * Servlet implementation class CustomerWorkShopPageServlet
 */
@WebServlet("/CustomerWorkShopPageServlet")
public class CustomerWorkShopPageServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
 
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession ses = request.getSession(false);
		int userId = (int)ses.getAttribute("userId");
		response.getWriter().print(userId);
		VehicleService vehicleService =  new VehicleService();
		BookingServices bookingService =  new BookingServices();
	    try {
			VehicleResponseDto vehicleResp = vehicleService.getVehicleByUserId(userId);
			BookingResponseDto bookingResp = bookingService.getBookingByVehicleId(vehicleResp.getVehicleId());
			if(bookingResp.getBookingInfo().isAcceptStatus()) {
				BookingResponseInclAcceptDto bookingInfo = bookingService.getAcceptedLiveBookingById(bookingResp.getBookingId());
				
				ses.setAttribute("bookingInfo", bookingInfo);
				request.setAttribute("bookingInfo", bookingInfo);
				response.getWriter().print(bookingInfo);
			}else {
				BookingResponseExclAcceptDto bookingInfo = bookingService.getUnAcceptedLiveBookingById(bookingResp.getBookingId());
				ses.setAttribute("bookingInfo", bookingInfo);
				request.setAttribute("bookingInfo", bookingInfo);
				response.getWriter().print(bookingInfo);

			}
			RequestDispatcher disp = request.getRequestDispatcher("./customerWorkshop.jsp");
			disp.forward(request, response);
			
		} catch (ServiceException e) {
			response.getWriter().print(e.getMessage());
			// TODO Auto-generated catch block
		}
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
