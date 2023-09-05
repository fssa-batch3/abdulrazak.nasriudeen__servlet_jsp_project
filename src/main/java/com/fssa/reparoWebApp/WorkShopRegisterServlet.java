package com.fssa.reparoWebApp;

import java.io.IOException;
import java.io.Serial;


import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.fssa.reparo.dto.workshop.WorkShopRequestDto;
import com.fssa.reparo.exception.ServiceException;
import com.fssa.reparo.service.WorkShopService;
import com.fssa.reparoWebApp.mapper.*;
import com.fssa.reparoWebApp.mapper.WorkShopHttpRequestToDto;

/**
 * Servlet implementation class WorkShopRegisterServlet
 */
@WebServlet("/WorkShopRegisterServlet")
public class WorkShopRegisterServlet extends HttpServlet {
	@Serial
	private static final long serialVersionUID = 1L;

	public WorkShopRegisterServlet() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		WorkShopHttpRequestToDto requestMap =  new WorkShopHttpRequestToDto();
		WorkShopService workShopService = new WorkShopService();
			try {
				WorkShopRequestDto requestDto = requestMap.convertHttpRequestToWorkshopDto(request);
				workShopService.registerWorkShop(requestDto);
				response.sendRedirect("workshopLogin.jsp?success= Workshop Account Created Successfully");

			} catch (ServiceException | MappingConversionException e) {
				String [] arr =  e.getMessage().split(":");
				response.sendRedirect("./workShopSignUp.jsp?error="+e.getMessage());

			}
		}
		

		
		
	}


