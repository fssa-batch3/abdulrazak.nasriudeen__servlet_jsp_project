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

import org.json.JSONObject;

import com.fssa.reparo.dto.workshop.WorkShopRequestDto;
import com.fssa.reparo.dto.workshop.WorkShopResponseDto;
import com.fssa.reparo.exception.ServiceException;
import com.fssa.reparo.service.WorkShopService;
import com.fssa.reparoWebApp.mapper.MappingConversionException;
import com.fssa.reparoWebApp.mapper.WorkShopHttpRequestToDto;

/**
 * Servlet implementation class WorkshopLoginServlet
 */
@WebServlet("/WorkshopLoginServlet")
public class WorkshopLoginServlet extends HttpServlet {
	@Serial
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public WorkshopLoginServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		WorkShopService workshopServices =  new WorkShopService();
		WorkShopHttpRequestToDto requestMap = new WorkShopHttpRequestToDto();

		try {
			WorkShopRequestDto req =  requestMap.convertHttpRequestToWorkshopLoginDto(request);
			int id =  workshopServices.loginWorkShop(req.getWorkshopNumber(),req.getWorkshopPassword());
			HttpSession session = request.getSession();
			WorkShopResponseDto workshop =  workshopServices.getWorkShopById(id);
			JSONObject json = new JSONObject(workshop);
			session.setAttribute("workshop", json);
			request.setAttribute("Workshop", json);
			RequestDispatcher dispatcher = request.getRequestDispatcher("./workshopHome.jsp");
			dispatcher.forward(request, response);
		}catch(ServiceException | MappingConversionException e) {
               String [] arr = e.getMessage().split(":");
               response.sendRedirect("./workshopLogin.jsp?error="+arr[arr.length-1]);
		}
		
		

	
	}

}
