/*************Έλεγχος Φόρμας**************/
const signInForm = document.getElementById('signInForm');
const signInEmail = document.getElementById('signInEmail');
const signInPass = document.getElementById('signInPass');


function checkform(form){
    let signPass = checkRequired([signInPass]);
    let signMail =  checkEmail(signInEmail);
    if(signPass === false || signMail === false){
        return false; 
        reset();
    }
    else {
        return true;
    }
   
  }




//Δείχνει τα λάθη 
function showErrors(input, message){    
    
        let formControl = input.parentElement;
        formControl.className = 'email-box error';
        let small = formControl.querySelector("small");
        small.innerText = message;
        small.className = "small-wrong";

}



function checkRequired(arrayOfInputs){

    arrayOfInputs.forEach(function(input){
        if(input.value.trim() === ''){
            showErrors(input, `${getFieldName(input)} απαιτείται`);
        }
        else{
            return true;
        }
    }
    )};

function checkEmail(email){

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
    
    function getFieldName(input){

        return  input.placeholder.charAt(0).toUpperCase() + input.placeholder.slice(1);

    }

    //Δείχνει οτι είναι σωστά
// function showSuccess(input){
//     const formControl = input.parentElement;
//     formControl.className = 'email-box success'; 
//     const small = formControl.querySelector("small");
//     small.innerText = '';
//     small.classList.remove = "small-wrong";
// }
