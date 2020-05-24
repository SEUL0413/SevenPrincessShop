package com.sps.mail;

import java.util.Random;

//인증코드를 만들기위한 클래스
public class FindUtil {
	
	//인증코드를 랜덤으로 생성하는 메소드
	public static String createKey() throws Exception {
	    StringBuffer key = new StringBuffer();
	    Random rnd = new Random();

	    for (int i = 0; i < 10; i++) {
	    	int index = rnd.nextInt(3);
	        switch (index) {
	            case 0:
	                key.append((char) ((int) (rnd.nextInt(26)) + 97));
	                break;
	            case 1:
	                key.append((char) ((int) (rnd.nextInt(26)) + 65));
	                break;
	            case 2:
	                key.append((rnd.nextInt(10)));
	                break;
	        }
	    }
	    return key.toString();
	}
	
	
	//특수문자도 포함할수 있는 인증코드를 생성하는 메소드 (메서드를 만들어 놓았지만 구현하지는 않았다.)
	public static String getNewPwd() throws Exception {
	    char[] charSet = { '0', '1', '2', '3', '4', '5', '6', '7', '8', '9', 
	                      'A', 'B', 'C', 'D', 'E', 'F', 'G', 'H', 'I', 'J', 'K', 
	                      'L', 'M', 'N', 'O', 'P', 'Q', 'R', 'S', 'T', 'U', 'V', 
	                      'W', 'X', 'Y', 'Z', 
	                      '!', '@', '#', '$', '%', '^', '&', '+', '=', '.'}; 
	         
	    StringBuffer newKey = new StringBuffer(); 
	        
	    for (int i = 0; i < 10; i++) { 
	        int idx = (int) (charSet.length * Math.random());
	        newKey.append(charSet[idx]); 
	    } 
	        
	    return newKey.toString();
	}

}
