document.getElementById("btnSubmit").addEventListener("click",function(){
	var username = document.getElementById("txtUsername").value;
	var password = document.getElementById("txtPassword").value;
	if(!checkUsername(username)){}
	else if(!checkPassword(password)){}
	else document.getElementById("frmLogin").submit();
})

function checkUsername(name){
	var regex = /^[\w]{6,18}$/g;
	if(name == "" || name == null){
		alert("Account must not be empty");
		return false;
	}
	else if(!regex.exec(name)){
		alert("Account must be unsigned digit and between 6 and 18 characters");
		return false;
	}else return true;
}

function checkPassword(pass){
	var regex = /^[\w]{6,18}$/g;
	if(pass == "" || pass == null){
		alert("Password must not be empty");
		return false;
	}
	else if(!regex.exec(pass)){
		alert("Password must be unsigned digit and between 6 and 18 characters");
		return false;
	}else return true;
}
