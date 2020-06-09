/*******************Μεταβλητες Εγγραφης Φορμας*********************/
const registerName = document.getElementById("registerName");
const registerLastName = document.getElementById("registerLastName");
const registerUpName = document.getElementById("registerName");
const registerEmail = document.getElementById("registerEmail");
const registerPass = document.getElementById("registerPassword");
const registerConfirmPass = document.getElementById("registerConfirmPassword");
const registerSubmit = document.getElementById("signUpSubmit");

function checkFormSignUp(form){
    let checkName = checkLength(registerName);
    let checkLastName = checkLength(registerLastName);
    let checkEmail = checkRegisterEmail(registerEmail);
    let checkPassMatch = checkPasswordsMatch(registerPass, registerConfirmPass);
   
    if( !checkName ){
        return false;
        }if(!checkLastName){
            return false;
            }if(!checkEmail){
                return false;
            }if(!checkPassMatch){
                return false;
            }
            else{
                return true;
            }
}

function checkLength(input){
    
    if(input.value.length < 3 || input.value.length > 20){
        showErrors(input, `Στο πεδίο ${getFieldName(input)} επιτρέπεται εως 3-20 χαρακτήρες`)
        return false;
    }else{
        showSuccess(input);
        return true;
    }
}


function checkRegisterEmail(email){

    const preMatch = /^(([^<>()\[\]\\.,;:\s@"]+(\.[^<>()\[\]\\.,;:\s@"]+)*)|(".+"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$/;
    if(email.value.trim() === ""){
        showErrors(email, `${getFieldName(email)} απαιτείται`);
        return false;
    }
    else if(!preMatch.test(email.value.trim())){ //Test() ελεγχει αν υπαρχει το μοτιβο
        showErrors(email, `${getFieldName(email)} δεν είναι έγκυρο`);
        return false;
        
    }else{
        showSuccess(email);
        return true;

    }
}
function checkPasswordsMatch(pass,passConfirm){
    if(pass.value.trim() == "" || passConfirm.value.trim ==""){
      
        showErrors(pass, `Στο πεδίο ${getFieldName(pass)} επιτρέπεται εως 3-20 χαρακτήρες`);
        showErrors(passConfirm, `Στο πεδίο ${getFieldName(passConfirm)} επιτρέπεται εως 3-20 χαρακτήρες`);
        return false;
    }
    else if(pass.value !== passConfirm.value){
        
        showErrors(passConfirm, `Η επαλήθευση κωδικού δεν είναι σωστή`);
        return false;
    }
    else{
        showSuccess(pass);
        showSuccess(passConfirm);
        return true;
    }
}

function showErrors(input, message){    
    
    let formControl = input.parentElement;
    // formControl.className = 'error';
    let small = formControl.querySelector("small");
    small.innerText = message;
    small.className = "small-wrong";
}
function showSuccess(input){
    let formControl = input.parentElement;
    let small = formControl.querySelector("small");
    small.innerText = "";
}
function getFieldName(input){

    return  input.placeholder.charAt(0).toUpperCase() + input.placeholder.slice(1);

}