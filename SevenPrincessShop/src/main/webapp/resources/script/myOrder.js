	

	function content(obj){
	 	location.href="orderContentView?idx="+$(obj).attr("id");
	}
	
	function orderCheck(idx){
		if(confirm("주문을 취소하시겠습니까?")){
			location.href="updateCxl?idx="+idx;
		}
	}