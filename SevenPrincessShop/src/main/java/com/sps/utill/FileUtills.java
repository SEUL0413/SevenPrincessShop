package com.sps.utill;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import org.springframework.http.MediaType;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.multipart.MultipartFile;


public class FileUtills {
	private static Map<String, MediaType> mediaMap;
	static {
		mediaMap = new HashMap<String, MediaType>();
		//이미지 확장자가 추가되면 여기다 추카하면된다.
		//jpg가 들어오면 MediaType.IMAGE_JPEG를 받는다는 의미이다.
		mediaMap.put("JPG", MediaType.IMAGE_JPEG);
		mediaMap.put("JPEG", MediaType.IMAGE_JPEG);
		mediaMap.put("GIF", MediaType.IMAGE_JPEG);
		mediaMap.put("PNG", MediaType.IMAGE_JPEG);
	
	}
	
	public static MediaType getMediaType(String ext) {
		return mediaMap.get(ext.toUpperCase());
	}
	
	public static String uploadFile(MultipartFile file,String uploadPath, int goodIdx) throws IOException {
		String media = file.getOriginalFilename();
		System.out.println(goodIdx);
		String filename = (goodIdx+1)+media.substring(media.lastIndexOf("."));
		
		File target = new File(uploadPath, filename);
		
		FileCopyUtils.copy(file.getBytes(), target);
		
		return filename;
	}
	
	//확장자명 따오는 메소드
	private static String getFileExtension(String filename) {
		return filename.substring(filename.lastIndexOf(".")+1);
	}

	   public static ArrayList<String> uploadFile_sub(ArrayList<MultipartFile> sub_file, String uploadPath_sub, int goodIdx) throws IOException {
		      ArrayList<String> media_sub = new ArrayList<String>();
		      int i=1;
		      for(MultipartFile file : sub_file) {
		         String a = file.getOriginalFilename();
		         String filename =a.substring(a.lastIndexOf("."));
		         filename = (goodIdx+1)+"_"+ (i++)+ filename;
		         media_sub.add(filename);
		         File target = new File(uploadPath_sub,filename);
		         FileCopyUtils.copy(file.getBytes(), target);
		      }
		      
		      return media_sub;
		   }

}
