package com.fssa.reparoWebApp;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.JSONObject;

import com.fssa.reparo.dto.service.ServiceListResponseDto;
import com.fssa.reparo.exception.ServiceException;
import com.fssa.reparo.service.BookingServices;
import com.fssa.reparo.service.ServiceListServices;

/**
 * Servlet implementation class WorkshopBookingAcceptServlet
 */
@WebServlet("/WorkshopBookingAcceptServlet")
public class WorkshopBookingAcceptServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession ses = request.getSession(false);
		ServiceListServices workshopServiceList = new ServiceListServices();

		BookingServices bookingServices =  new BookingServices();
		if(ses!=null) {
			String obj =  ses.getAttribute("workshop").toString() ;
			JSONObject workshop =  new JSONObject(obj);
			int bookingId = Integer.parseInt(request.getParameter("bookingId"));
			try {
				bookingServices.updateAcceptStatus(true, workshop.getInt("workshopId"), bookingId);
				workshopServiceList.createServiceList(bookingId);
				ServiceListResponseDto serviceList = workshopServiceList.getServiceByBookingId(bookingId);
				JSONObject serviceObj = new JSONObject(serviceList);
				request.setAttribute("serviceList", serviceObj);
				RequestDispatcher disp = request.getRequestDispatcher("workshopServiceList.jsp");
				disp.forward(request, response);
	
				
			}  catch (ServiceException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			
		}
		// TODO Auto-generated method stub
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
