package com.koreait.db;

import java.io.File;
import com.koreait.product.*;

public class FileService {
	private productDAO productDAO = null;
	public static String SAVE_PATH = "D:/beak/ZEUS/src/main/webapp/uploads";  // 원하는 위치 파일 경로 넣어주기

	public FileService() {
		productDAO = new productDAO();		
	}
	
	public boolean dataUpload(String name,String price,String state,String delcharge, String deallocation,int category,String content,int memidx,String tag,String priceConsult, 
			String exchange, int quantity, File file) {
		productDTO product = new productDTO();
		
		product.setName(name);
		product.setPrice(price);
		product.setState(state);
		product.setDelcharge(delcharge);		
		product.setDeallocation(deallocation);
		product.setCategory(category);		
		product.setContent(content);
		product.setMemidx(memidx);
		product.setTag(tag);
		product.setPriceConsult(priceConsult);
		product.setExchange(exchange);
		product.setQuantity(quantity);
		
		
		
		product.setPicturepath(file.getPath());

		
		// 파일이 "null"이 들어가는 에러 방지
		if(!file.getName().endsWith("null")) {
			product.setPicture(file.getName());
			
		}
		else {
			product.setPicture(null); // 비워둬라
		}
		
		if(productDAO.insertData(product) == 1 ) {
			return true;
		}else {
			return false;
		}

		
	}
	

	
	
	
	
	
	

}
