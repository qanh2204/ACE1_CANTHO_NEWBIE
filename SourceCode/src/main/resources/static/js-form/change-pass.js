
function changePassword(){
	var oldPass = document.getElementById("txtPassOld").value;
	var newPass = document.getElementById("txtPassNew").value;
	var confirmPass = document.getElementById("txtPassConfirm").value;
	
	if(!checkPasswordOld(oldPass)){}
	else if(!checkPasswordNew(newPass)){}
	else if(!checkPasswordConfirm(confirmPass)){}
	else{
		if(newPass != confirmPass){
			alert("Password was wrong");
		}else{
			document.getElementById("frmChangePassword").submit();
		}
	}
}

function checkPasswordOld(pass){
	var regex = /^[\w]{6,18}$/g;
	if(pass == "" || pass == null){
		alert("old password must not be empty");
		return false;
	}
	else if(!regex.exec(pass)){
		alert("old password must be unsigned digit and between 6 and 18 characters");
		return false;
	}else return true;
}

function checkPasswordNew(pass){
	var regex = /^[\w]{6,18}$/g;
	if(pass == "" || pass == null){
		alert("new password must not be empty");
		return false;
	}
	else if(!regex.exec(pass)){
		alert("new password must be unsigned digit and between 6 and 18 characters");
		return false;
	}else return true;
}

function checkPasswordConfirm(pass){
	var regex = /^[\w]{6,18}$/g;
	if(pass == "" || pass == null){
		alert("Confirmed password must not be empty");
		return false;
	}
	else if(!regex.exec(pass)){
		alert("Confirmed password must be unsigned digit and between 6 and 18 characters");
		return false;
	}else return true;
}