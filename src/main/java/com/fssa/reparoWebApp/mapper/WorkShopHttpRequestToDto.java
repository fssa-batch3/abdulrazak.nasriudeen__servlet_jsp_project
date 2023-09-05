package com.fssa.reparoWebApp.mapper;

import com.fssa.reparo.dto.workshop.WorkShopRequestDto;

import javax.servlet.http.HttpServletRequest;

public class WorkShopHttpRequestToDto {

    public WorkShopRequestDto convertHttpRequestToWorkshopDto(HttpServletRequest request) throws MappingConversionException {
        String name  = request.getParameter("name");
        if(name.trim().isEmpty())throw new MappingConversionException("Name can't be empty ");
        String num = request.getParameter("number");
        if(num.trim().isEmpty()) throw new MappingConversionException("Number cant be empty ");
        long number =  Long.parseLong(num);
        String password = request.getParameter("password");
        String confirmPassword = request.getParameter("Cpassword");
        if(password.trim().isEmpty()) throw new MappingConversionException("password cant be empty ");
        if(!password.equals(confirmPassword)) throw new MappingConversionException("Confirm password Not matching");

        String type = request.getParameter("workshopType");
        if(type.trim().isEmpty()) throw new MappingConversionException("workshopType cant be empty ");
        String address = request.getParameter("address");
        if(address.trim().isEmpty()) throw new MappingConversionException("address cant be empty ");
        String city = request.getParameter("city");
        if(city.trim().isEmpty()) throw new MappingConversionException("city cant be empty ");
        String state = request.getParameter("state");
        if(state.trim().isEmpty()) throw new MappingConversionException("state cant be empty ");

        return new WorkShopRequestDto(name,number,password,Integer.parseInt(type),address,city,state);
    }
    public WorkShopRequestDto convertHttpRequestToWorkshopLoginDto(HttpServletRequest request) throws MappingConversionException {
        String num = request.getParameter("number");
        if(num.trim().isEmpty()) throw new MappingConversionException("Number cant be empty ");
        long number =  Long.parseLong(num);
        String password = request.getParameter("password");
        if(password.trim().isEmpty()) throw new MappingConversionException("password cant be empty ");
        WorkShopRequestDto requestDto =  new WorkShopRequestDto();
        requestDto.setWorkshopNumber(number);
        requestDto.setWorkshopPassword(password);
        return requestDto;
    }

}
