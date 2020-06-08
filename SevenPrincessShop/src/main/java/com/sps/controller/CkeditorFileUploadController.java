package com.sps.controller;

import org.springframework.stereotype.Controller;

@Controller
public class CkeditorFileUploadController {

//    // 이미지 업로드
//    // product_edit페이지에서 맵핑되는 메소드
//    @RequestMapping("/imageUpload")
// 
//    // 이미지를 저장하고, 불러오고, 업로드하기위해 매개변수를 선언
//    public void imageUpload(HttpServletRequest request, HttpServletResponse response, @RequestParam MultipartFile upload)
//    //MultipartFile 타입은 ckedit에서 upload란 이름으로 저장하게 된다
//            throws Exception {
// 
//        // 한글깨짐을 방지하기위해 문자셋 설정
//        response.setCharacterEncoding("utf-8");
// 
//        // 마찬가지로 파라미터로 전달되는 response 객체의 한글 설정
//        response.setContentType("text/html; charset=utf-8");
// 
//        // 업로드한 파일 이름
//        String fileName = upload.getOriginalFilename();
// 
//        // 파일을 바이트 배열로 변환
//        byte[] bytes = upload.getBytes();
// 
//        // 이미지를 업로드할 디렉토리(배포 디렉토리로 설정)
//        String uploadPath = request.getContextPath() + "/resources/images/productImages/";
//
//        
//        OutputStream out = new FileOutputStream(new File(uploadPath + fileName));
// 
//        // 서버로 업로드
//        // write메소드의 매개값으로 파일의 총 바이트를 매개값으로 준다.
//        // 지정된 바이트를 출력 스트립에 쓴다 (출력하기 위해서)
//        out.write(bytes);
// 
//        // 클라이언트에 결과 표시
//        String callback = request.getParameter("CKEditorFuncNum");
// 
//        // 서버=>클라이언트로 텍스트 전송(자바스크립트 실행)
//        PrintWriter printWriter = response.getWriter();
//        String fileUrl = request.getContextPath() + "/resources/images/productImages/" + fileName;
//        printWriter.println("<script>window.parent.CKEDITOR.tools.callFunction(" + callback + ",'" + fileUrl
//                + "','이미지가 업로드되었습니다.')" + "</script>");
//        printWriter.flush();
//    }

}
