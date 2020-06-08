
   //체크박스 전체 클릭시 모든 박스 check하기 
   function allChk(bool){
      $(".chk").prop("checked",bool);
      
      //품절인 상품은 주문할수 없도록 체크박스 해제
      $("input[name=chk]:disabled").prop("checked",false);
   }
   
   //박스 전체에 클릭이 되면 all 버튼 check! 하나라도 클릭 해제되면 all버튼 check 해제하기 
   $(function(){
      let boxs = $("input[name=chk]")
      boxs.click(function(){
         if(boxs.length == $("input[name=chk]:checked").length){
            $("input[name=all]").prop("checked",true);
         }else{
            $("input[name=all]").prop("checked",false);
         }
      });
   });
   
   //check박스 체크된 항목 삭제
   //체크된 항목의 장바구니 idx를 가져와서 컨트롤러의 deleteCart로 넘겨주기 
   function chkCount(){
      let chks = document.getElementsByName("chk");
      
      let cartNums = "";
      
      
      if($("input[name=chk]:checked").length==0){
         alert("한개 이상 체크해주세요!!");
      }else{
         for(let i =0;i<chks.length;i++){
            if(chks[i].checked){  //체크된 항목인지 확인하는 조건문
               //chks[i].value: 삭제할 장바구니 번호
               cartNums+=(chks[i].value+"_");
            }      
         }
      }
      var url = "deleteCart?cartNums="+cartNums;
      
      location.href = url;
   }
   
   //x 버튼 클릭시 해당 내역 삭제
   function boxCxl(value){  //value: 삭제할 장바구니 idx
      
      location.href= "deleteCart?cartNums="+value+"_";
   }
   
   
   //장바구니 모든 내역 삭제
   function deleteAll(){
      $("input[name=chk]").each(function(){
         $(this).prop("checked",true);
      });
      
      chkCount();
   }
   
   //주문 개수를 바꾸기 위해선 orderList_idx(주문번호)와 변경할 orderList_stock(주문개수)가 필요!
   //c:forEach 반복문에서 해당 턴의 값을 가져와야 하므로 varStatus 속성을 이용해 value에 세팅한 후 값을 받는다.
   function stockChange(idx){  // idx : 해당 주문 번호
      let temp = document.getElementById(idx);
      let re_stock = temp.options[temp.selectedIndex].value;
      alert("주문 수량이 적용되었습니다!");
      location.href="updateStock?idx="+idx+"&re_stock="+re_stock;
   }
   
   //선택 상품 주문 (주문번호 인덱스,상품 넘겨주기)
   function selectOrder(num){
      let chks = document.getElementsByName("chk");
      let idxs = "";
      if($("input[name=chk]:checked").length==0){
         alert("한개 이상 체크해주세요!!");
      }else{
         for(let i =0;i<chks.length;i++){
            if(chks[i].checked){  //체크된 항목인지 확인하는 조건문
               //chks[i].value: 결제할 장바구니 번호
               idxs+=(chks[i].value+"_");
            }      
         }
         
         if(num==2){   //admin_board.jsp 삭제 버튼 클릭시
            if(confirm("글을 삭제하시겠습니까?")){
               var url = "deleteQ?idxs="+idxs;
               location.href = url;
            }
         }else{      //cartView.jsp 주문 버튼 클릭시
            var url = "updateStatus?idxs="+idxs;
            location.href = url;
         }
      }
   }
   
   
   //장바구니 내역 상품 모두 품절일 경우 all 체크 박스 disabled 설정
   $(function(){
      let count = $("input[name=chk]").length;
      if($("input[name=chk]:disabled").length==count){
         $("input[name=all]").prop("disabled",true);
      }
   });
   
   
  

   
   
   