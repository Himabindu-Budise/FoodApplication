package com.food.secure;

public class EncryptData 
{
public static String encrypt(String name) {
		
		StringBuffer sb=new StringBuffer();
		for(int i=0;i<name.length();i++) {
		
			sb.append((char)(name.charAt(i)+2));
		
		}
		return sb.toString();
		
	}
}
