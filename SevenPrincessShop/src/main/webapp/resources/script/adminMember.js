
   //체크박스 전체 클릭시 모든 박스 check하기 
   function allChk(bool){
      $(".chk").prop("checked",bool);
      //품절인 상품은 주문할수 없도록 체크박스 해제
      $("input[name=chk]:disabled").prop("checked",false);
   }
   
  
   
   function chkCount(value){
      let chks = document.getElementsByName("chk");
      let chkNums = "";
      
      if($("input[name=chk]:checked").length==0){
         alert("한개 이상 체크해주세요!!");
      }else{
         for(let i =0;i<chks.length;i++){
            if(chks[i].checked){  //체크된 항목인지 확인하는 조건문
            	chkNums+=(chks[i].value+"_");
            }      
         }
      }
      let url ="adminMember?chkNums="+chkNums+"&value="+value;
      location.href = url;
   }
   
  
   
   
   