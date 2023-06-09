document.getElementById("btnSubmit").addEventListener("click",function(){
	var name  = document.getElementById("txtName").value;
	if(name == null || name == ""){
		alert("Please enter your payment method");
	}
	else if(name.length<3){
		alert("Payment method must be 3 characters or more");
	}else document.getElementById("frmPayment").submit();
})