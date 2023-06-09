document.getElementById("btnSubmit").addEventListener("click",function(){
	var name  = document.getElementById("txtName").value;
	if(name == null || name == ""){
		alert("Please enter your Manufacturer");
	}
	else if(name.length<3){
		alert("Manufacturer must be 3 characters or more");
	}else document.getElementById("frmManufacturer").submit();
})