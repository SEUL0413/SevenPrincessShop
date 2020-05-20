
	function selectQ(obj) {
      //클릭한 행의 qboardList_idx 
      let idx = $(obj).attr("id");
      
      var f = document.getElementById("flag"+idx);   // 토글 스위치
      var s = document.getElementById("show"+idx);   // 쇼 엘리멘트
      
      
      if(f.value==0){
         f.setAttribute("value","1");   // 토글스위치끄기
         s.setAttribute("style","");      //스타일 초기화
      }
      
      else{
         f.setAttribute("value","0");   //토글스위치 끄기
         s.setAttribute("style","display: none"); //화면끄기
      }
      
   
      
      
   }
   