
function submitForm(){
    var name = document.myForm.myName;
    var my_age = document.myForm.myAge;
    let password = document.myForm.myPwd;
    let my_email = document.myForm.myEmail;
    let my_number = document.myForm.myPhone;

    if(name.value == "" ) {
        alert( "Please provide your name!!!" )
        return false;
    }

    if(name.value.length < 3 ) {
        alert( "The name length should be minimum 3 characters!!!" )
        return false;
    }

    if(my_age.value === ''){
        alert('Please Enter Your Age...')
        return false;
    }
     
    if (my_age.value > 100 || my_age.value < 18){
        alert('The age limit was in between 18 to 65years!!!')
        return false;
    }
    
    if(my_number.value.toString().length != 10){
        alert("Please Enter Valid Phone Number!!!")
        return false;
    }

    if (password.value.length < 8) {
        alert("Password length must be at least 8 characters")
        return false;
    }

    if(password.length > 15) {  
        alert("**Password length must not exceed 15 characters");  
        return false;  
    }

    let pwd_upper = (/[A-Z]/.test(password.value));
    if (pwd_upper == false){
        alert("Password must contain at least 1 Uppercase letter!!!");
        return false;
    }

    let pwd_lower = (/[a-z]/.test(password.value));
    if(pwd_lower == false){
        alert("Password must contain at least 1 Lowercase letter!!!");
        return false;
    }

    let pwd_number = (/\d/.test(password.value));
    if(pwd_number == false){
        alert("Password must contain at least one Number!!!");
        return false;
    }
    
    var format = /(?=.*?[#?!@$%^&*-])/;
    var pwd_spc_char = format.test(password.value);
    if( pwd_spc_char == false){
        alert("Password must contain at least 1 special Character!!!");
       return false;
    }

    alert("Welcome Your Acoount was Created, Now click on Login button...");
    return true;
}


