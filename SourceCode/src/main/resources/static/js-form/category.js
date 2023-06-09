document.getElementById("btnSubmit").addEventListener("click",function(){
	var name  = document.getElementById("txtName").value;
	if(name == null || name == ""){
		alert("Please enter your Category");
	}
	else if(name.length<3){
		alert("Category must be 3 characters or more");
	}else document.getElementById("frmCategory").submit();
})