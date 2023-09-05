package com.fssa.reparoWebApp;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.JSONObject;
import org.json.JSONArray;

import com.fssa.reparo.dto.booking.BookingRequestDto;
import com.fssa.reparo.dto.booking.BookingResponseExclAcceptDto;
import com.fssa.reparo.dto.workshop.WorkShopResponseDto;
import com.fssa.reparo.exception.ServiceException;
import com.fssa.reparo.service.BookingServices;
import com.fssa.reparo.service.WorkShopService;
import com.fssa.reparoWebApp.mapper.MappingConversionException;
import com.fssa.reparoWebApp.mapper.UserHttpRequestToDto;

/**
 * Servlet implementation class CreateBookingServlet
 */
@WebServlet("/CreateBookingServlet")
public class CreateBookingServlet extends HttpServlet {
	
	
	private static final long serialVersionUID = 1L;
       
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		UserHttpRequestToDto map =  new UserHttpRequestToDto();
		HttpSession session =  request.getSession(false);
		BookingServices bookingService =  new BookingServices();
		WorkShopService workshopService = new WorkShopService();

		try {
			if(session!=null){
				BookingRequestDto req =  map.convertHttpRequestToBookingRequestDto(request);
				int vehicleId = (int) session.getAttribute("vehicleId");
				req.setVehicleId(vehicleId);
				int id =  bookingService.createBooking(req);
				BookingResponseExclAcceptDto bookingResp =  bookingService.getUnAcceptedLiveBookingById(id);
				JSONObject obj = new JSONObject(bookingResp);
				List<WorkShopResponseDto> listWorkshop = workshopService.getWorkShopByArea(bookingResp.getBookingInfo().getBookingCity());
				JSONArray arr = new JSONArray(listWorkshop);
				response.getWriter().print(obj);
				request.setAttribute("bookingInfo", obj);
				session.setAttribute("bookingInfo", obj);
				request.setAttribute("nearWorkshops", arr);
				session.setAttribute("nearWorkshops", arr);
				response.getWriter().print(arr);
				RequestDispatcher disp =  request.getRequestDispatcher("./customerWorkshop.jsp");
				disp.forward(request, response);
			}else throw new MappingConversionException("enter vehicle details");




	
		} catch (MappingConversionException | ServiceException e) {
			
			String[] err =  e.getMessage().split(":");
			response.sendRedirect("./customerBooking.jsp?error="+err[err.length-1]);
		}
	
	}

}
