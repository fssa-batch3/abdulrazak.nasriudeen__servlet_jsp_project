package com.fssa.reparoWebApp.mapper;

import java.io.Serial;

public class MappingConversionException extends Exception {
	/**
	 * 
	 */
	@Serial
	private static final long serialVersionUID = -7623458574804436056L;

	public  MappingConversionException(String msg) {
		super(msg);
		
	}
	public  MappingConversionException(Throwable e) {
		super(e);
		
	}
	
	

}

