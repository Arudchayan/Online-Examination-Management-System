function editFormValidation(thisform){
    with(thisform){
        if(firstNameValidation(fName) == false){
            fName.focus();
            return false;
        }

        if(lastNameValidation(lName) == false){
            lName.focus();
            return false;
        }

        if(passwordValidation(passwd) == false){
            passwd.focus();
            return false;
        }

        if(rePasswordValidation(repass) == false){
            repass.focus();
            return false;
        }

        if(ageValidation(age) == false){
            age.focus();
            return false;
        }

        if(emailValidation(email) == false){
            email.focus();
            return false;
        }

        if(phoneNumberValidation(pNum) == false){
            pNumber.focus();
            return false;
        }
    }
}

        function firstNameValidation(fName){
            var errormeg = document.getElementById("errormes");

            with(document.editValidation){
                if(fName.value == ""){
                    errormeg.innerHTML = "First name can not be empty";
                    return false;
                }
                else
                    return true;
            }
        }

        function lastNameValidation(lName){
            var errormeg = document.getElementById("errormes");

            with(document.editValidation){
                if(lName.value == ""){
                    errormeg.innerHTML = "Last name can not be empty";
                    return false;
                }
                else
                    return true;
            }
        }

        function passwordValidation(passwd){
            var errormeg = document.getElementById("errormes");

            with(document.editValidation){
                if(passwd.value == ""){
                    errormeg.innerHTML = "Password can not be empty";
                    return false;
                }
                else
                    if((passwd.value).length < 10){
                        errormeg.innerHTML = "Minimum password length is 10";
                        return false;
                    }
                    else
                        return true;
            }
        }

        function rePasswordValidation(repass){
            var errormeg = document.getElementById("errormes");

            with(document.editValidation){
                if(repass.value == ""){
                    errormeg.innerHTML = "Re-Password can not be empty";
                    return false;
                }
                else
                    if(passwd.value != repass.value){
                        errormeg.innerHTML = "Password and re-password missmatched";
                        return false;
                    }
                    else
                        return true;
            }
        }

        function ageValidation(age){
            var errormeg = document.getElementById("errormes");

            with(document.editValidation){

                if(age.value == ""){
                    errormeg.innerHTML = "Age can not be empty";
                    return false;
                }
                else
                    if(isNaN(parseInt(age.value))){
                        errormeg.innerHTML = "Age should be numaric value";
                        return false;
                    }
                    else
                        if((age.value > 100) || (age.value < 0)){
                            errormeg.innerHTML = "age should be between 0 to 100";
                            return false;
                        }
                        else
                            return true;
            }
        }

        function emailValidation(email){
            var errormeg = document.getElementById("errormes");

            with(document.editValidation){
                if(email.value == ""){
                    errormeg.innerHTML = "Email can not be empty";
                    return false;
                }
                else
                    return true;
            }
        }

        function phoneNumberValidation(pNum)    {
            var errormeg = document.getElementById("errormes");

            with(document.editValidation){
                if(pNum.value == ""){
                    errormeg.innerHTML = "phone number can not be empty";
                    return false;
                }
                else
                    if(isNaN(parseInt(pNumber.value))){
                        errormeg.innerHTML = "Phone number should be numaric value";
                        return false;
                    }
                    else
                        if((pNumber.value).length < 9){
                            errormeg.innerHTML = "Phone number length should be 9 digits";
                            return false;
                        }
                        else
                            return true;
            }
        }
