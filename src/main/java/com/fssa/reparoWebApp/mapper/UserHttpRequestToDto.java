package com.fssa.reparoWebApp.mapper;
import javax.servlet.http.HttpServletRequest;

import com.fssa.reparo.dto.booking.BookingRequestDto;
import com.fssa.reparo.dto.user.UserRequestDto;
import com.fssa.reparo.dto.vehicle.VehicleRequestDto;

public class UserHttpRequestToDto {

	public UserRequestDto convertHttpRequestToUserDTO(HttpServletRequest request) throws MappingConversionException {
			String name  = request.getParameter("name");
			if(name.trim().isEmpty())throw new MappingConversionException("Name can't be empty ");
			String num = request.getParameter("number");
			if(num.trim().isEmpty()) throw new MappingConversionException("Number cant be empty ");
			long number =  Long.parseLong(num);
			String password = request.getParameter("password");
		String confirmPassword = request.getParameter("ConfirmPassword");
			if(password.trim().isEmpty()) throw new MappingConversionException("password cant be empty ");
		if(!password.equals(confirmPassword)) throw new MappingConversionException("Confirm password Not matching");

		return new UserRequestDto(name,number,password);
	}
	public UserRequestDto convertHttpRequestToUserLoginDto(HttpServletRequest request) throws MappingConversionException {
		String num = request.getParameter("number");
		if(num.trim().isEmpty()) throw new MappingConversionException("Number cant be empty ");
		long number =  Long.parseLong(num);
		String password = request.getParameter("password");
		if(password.trim().isEmpty()) throw new MappingConversionException("Number cant be empty ");
        return new UserRequestDto("",number,password);
	}
	
	
	
	
	
	public VehicleRequestDto convertHttpRequestToVehicleRequestDto(HttpServletRequest request) throws MappingConversionException {
		
		String company = request.getParameter("company");
		if(company.trim().isEmpty())throw new MappingConversionException("companyName can't be empty ");

		String model = request.getParameter("model");
		if(model.trim().isEmpty())throw new MappingConversionException("modelName can't be empty ");

		String vehicleNumber = request.getParameter("vehicleNumber");
		if(vehicleNumber.trim().isEmpty()) throw new MappingConversionException("vehicleNumber cant be empty ");


		String typeStr = request.getParameter("type");
		if(typeStr.trim().isEmpty())throw new MappingConversionException("type can't be empty ");

		String yearStr = request.getParameter("year");
		if(yearStr.trim().isEmpty())throw new MappingConversionException("year can't be empty ");

		return new VehicleRequestDto(company,model,vehicleNumber,Integer.parseInt(typeStr),Integer.parseInt(yearStr));

	}
	
	
	public BookingRequestDto convertHttpRequestToBookingRequestDto(HttpServletRequest request) throws MappingConversionException {
		String problem = request.getParameter("problem");
		if(problem.trim().isEmpty())throw new MappingConversionException("problem can't be empty ");
		
		String bookingAddress = request.getParameter("address");
		if(bookingAddress.trim().isEmpty())throw new MappingConversionException("address can't be empty ");
		
		String bookingCity = request.getParameter("city");
		if(bookingCity.trim().isEmpty())throw new MappingConversionException("city can't be empty ");
		String bookingState = request.getParameter("state");
		if(bookingState.trim().isEmpty())throw new MappingConversionException("state can't be empty ");
		
		BookingRequestDto req =  new BookingRequestDto();
		req.setProblem(problem);
		req.setBookingAddress(bookingAddress);
		req.setBookingCity(bookingCity);
		req.setBookingState(bookingState);
		
		return req;
		
		
		
	
	
		
		
	}

}
