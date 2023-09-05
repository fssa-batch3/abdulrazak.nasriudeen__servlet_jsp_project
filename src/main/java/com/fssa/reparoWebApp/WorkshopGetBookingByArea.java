package com.fssa.reparoWebApp;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.JSONArray;
import org.json.JSONObject;

import com.fssa.reparo.dto.booking.BookingResponseExclAcceptDto;
import com.fssa.reparo.dto.workshop.WorkShopResponseDto;
import com.fssa.reparo.exception.ServiceException;
import com.fssa.reparo.service.BookingServices;
import com.fssa.reparo.service.WorkShopService;

/**
 * Servlet implementation class WorkshopGetBookingByArea
 */
@WebServlet("/WorkshopGetBookingByArea")
public class WorkshopGetBookingByArea extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public WorkshopGetBookingByArea() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession ses = request.getSession(false);
		BookingServices bookingServices =  new BookingServices();
		if(ses!=null) {
			String obj =  ses.getAttribute("workshop").toString() ;
			JSONObject workshop =  new JSONObject(obj);
			try {
				RequestDispatcher dispatcher =  request.getRequestDispatcher("./workshopBooking.jsp");
				List<Integer> bookings = bookingServices.findBookingByArea(workshop.getString("city"));
				List<BookingResponseExclAcceptDto> nearBooking = new ArrayList<>();
				for(int i : bookings) {
					BookingResponseExclAcceptDto book = bookingServices.getUnAcceptedLiveBookingById(i);
					nearBooking.add(book);
					}
				JSONArray workshopArr =  new JSONArray(nearBooking);
				request.setAttribute("nearBooking", workshopArr);
				ses.setAttribute("nearBooking", workshopArr);
				dispatcher.forward(request, response);	
			}
			 catch (ServiceException e) {
				 String [] err = e.getMessage().split(":");
					RequestDispatcher dispatcher =  request.getRequestDispatcher("./workshopHome.jsp?error="+err[err.length-1]);
					dispatcher.forward(request, response);
				
			}
			
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
