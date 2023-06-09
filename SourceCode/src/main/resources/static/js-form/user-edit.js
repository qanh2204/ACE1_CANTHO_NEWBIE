document.getElementById("btnSubmit").addEventListener("click",function(){
	var name = document.getElementById("txtName").value;
	var email = document.getElementById("txtEmail").value;
	var address = document.getElementById("txtAddress").value;
	var phone = document.getElementById("txtPhone").value;

	if(!checkName(name)){}
	else if(!checkEmail(email)){}
	else if(!checkAddress(address)){}
	else if(!checkPhone(phone)){}
	else document.getElementById("frmUserClientUpdate").submit();
})

function checkName(name){
	var regex = /^[\D]{6,50}$/g;
	if(name == "" || name == null){
		alert("Name must not be empty");
		return false;
	}
	else if(!regex.exec(name)){
		alert("Name must be between 6 and 50 characters");
		return false;
	}else return true;
}

function checkEmail(email){
	var regex = /^[a-zA-Z][\w]{2,}[@][\w]{2,}[.][\w]{2,}$/g;
	if(email == "" || email == null){
		alert("Email must not be empty");
		return false;
	}
	else if(!regex.exec(email)){
		alert("Email: [Letter][Letter Number]{2-* ký tự}[@][Letter Number]{2-* ký tự}[.][Letter Number]{2-* character}");
		return false;
	}else return true;
}

function checkAddress(address){
	var regex = /[<|>|/|"|'|-|_|!|~|`|@|#|$|%|^|&|*|?|+|=]/;
	if(address == "" || address == null){
		alert("Address must not be empty");
		return false;
	}
	else if(address < 6 || address > 50){
		alert("Address must be between 6 and 50 characters");
		return false;
	}
	else if(regex.exec(address)){
		alert("Address do not enter special characters");
		return false;
	}else return true;
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