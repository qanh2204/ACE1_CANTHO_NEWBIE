document.getElementById("btnSubmit").addEventListener("click",function(){
	var name = document.getElementById("txtName").value;
	var price = document.getElementById("txtPrice").value;
	var amount = document.getElementById("txtAmount").value;
	var category = document.getElementById("txtCategory").value;
	var manufacturer = document.getElementById("txtManufacturer").value;
	if(!checkName(name)){}
	else if(!checkPrice(price)){}
	else if(!checkAmount(amount)){}
	else if(!checkCategory(category)){}
	else if(!checkManufacturer(manufacturer)){}
	else document.getElementById("frmProduct").submit();

})

function checkName(name){
	const regex = /[<|>|/|"|'|-|_|!|~|`|@|#|$|%|^|&|*|?|+|=]/;
	if(name == "" || name == null){
		alert("Please enter the product name");
		return false;
	}else if(regex.exec(name)){
		alert("Product name must not have special characters");
		return false;
	}else if(name.length<6 || name.length >50){
		alert("Product name must be between 6 and 50 characters");
	}
	 else return true
}

function checkPrice(price){
	var regex = /^[1-9][\d]{1,}$/g;
	if(price == "" || price == null){
		alert("Please enter product price");
		return false;
	}else if (!regex.exec(price)){
		alert("The product price must be a number and the starting character must be from 1-9. Value from 10$ or more");
		return false;
	}else return true;
}

function checkAmount(amount){
	var regex = /^[\d]{1,}$/g;
	if(amount == "" || amount == null){
		alert("Please enter Amount");
		return false;
	}else if (!regex.exec(amount)){
		alert("Amount must be number");
		return false;
	}else return true;
}

function checkCategory(category){
	var regex = /^[\d]{1,}$/g;
	if(category == 0){
		alert("Please select Category");
		return false;
	}else if(!regex.exec(category)){
		alert("Are you trying to fix the code of a Category? The code of the Category must be a number");
		return false;
	}else return true;
}

function checkManufacturer(manufacturer){
	var regex = /^[\d]{1,}$/g;
	if(manufacturer == 0){
		alert("Please select Manufacturer");
		return false;
	}else if(!regex.exec(manufacturer)){
		alert("Are you trying to fix the Manufacturer's code? Manufacturer code must be number");
		return false;
	}else return true;
}