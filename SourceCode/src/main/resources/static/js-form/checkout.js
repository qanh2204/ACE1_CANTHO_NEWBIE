function clickCheckForm(){
	var phone = document.getElementById("txtPhone").value;
	var address = document.getElementById("txtAddress").value;
	var payment = document.getElementById("selPayments").value;
	if(!checkPhone(phone)){}
	else if(!checkAddress(address)){}
	else if(!checkPayment(payment)){}
	else {
		document.getElementById("frmCheckOut").submit();
	}
}

function checkPhone(phone){
	var regex = /^[0|+84][\d]{9}$/g;
	if(phone == "" || phone == null){
		alert("Phone must not be empty");
		return false;
	}
	else if(!regex.exec(phone)){
		alert("Phone starting with 0 or +84 and followed by 9 numeric characters");
		return false;
	}else return true;
}

function checkAddress(address){
	const regex = /[<|>|/|"|'|-|_|!|~|`|@|#|$|%|^|&|*|?|+|=]/;
	if(address.trim().length<1){
		alert("Please enter the address");
		return false;
	}else if(address.trim().length<6){
		alert("Address must be 6 characters or more");
		return false;
	}else if(regex.test(address)){
		alert("No special characters allowed");
		return false;
	}else return true;
}

function checkPayment(payment){
	var regex = /^[\d]{1,}$/g;
	if(payment < 1){
		alert("Please select payment method");
		return false;
	}else if(!regex.test(payment)){
		alert("Payment method code must be number");
		return false;
	}else return true;
}