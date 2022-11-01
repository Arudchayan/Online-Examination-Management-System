function userNameValidation(thisform){
    with(thisform){
        if(firstNameValidation(userName) == false){
            userName.focus();
            return false;
        }

        if(passwordValidation(passwd) == false){
            passwd.focus();
            return false;
        }
    }
}

        function firstNameValidation(userName){
            var errormeg = document.getElementById("errormes");

            with(document.loginVal){
                if(userName.value == ""){
                    errormeg.innerHTML = "User name can not be empty";
                    return false;
                }
                else
                    if((userName.value).length < 6){
                        errormeg.innerHTML = "User name length should be 6";
                        return false;
                    }
                    else
                        if(isNaN(parseInt(userName.value))){
                            errormeg.innerHTML = "User name should be numaric value";
                            return false;
                        }
                        else
                            return true;
            }
        }

        function passwordValidation(passwd){
            var errormeg = document.getElementById("errormes");

            with(document.loginVal){
                if(passwd.value == ""){
                    errormeg.innerHTML = "Password can not be empty";
                    return false;
                }
                else
                    return true;
            }
        }

       