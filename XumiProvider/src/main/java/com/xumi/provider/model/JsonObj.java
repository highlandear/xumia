package com.xumi.provider.model;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;

public class JsonObj {
	
	private static ObjectMapper objectMapper = new ObjectMapper();
	
	static public String toJson(Object obj)
	{
		try {
			return objectMapper.writerWithDefaultPrettyPrinter().writeValueAsString(obj);
		} catch (JsonProcessingException e) {
			e.printStackTrace();
			return "";
		}
	}
	 
	static public Object fromJson(String json, Class<?> clazz) {
		
		try {
			return objectMapper.readValue(json, clazz);
			
		} catch (JsonProcessingException e) {
			e.printStackTrace();
			return null;
		}
	}
}
