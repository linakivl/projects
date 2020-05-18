//αρχικοποιούμε τα ποσα τετραγωνα ειναι, γίνεται αλλαγη τετραγώνων μόνο όταν γίνεται κλικ στα κουμπια
let squareTotal = 6;
//λιστα απο χρώματα με τα τετραγωνα που αναλογουν
let colors = [];
let colorPicker;
//επιλέγω όλα τα div που θέλουμε να έχουν μέσα τους καποιο χρώμα απο την λίστα
let squares = document.querySelectorAll(".square");
let messageDisplay = document.getElementById("messageDisplay");
let rgbColor = document.getElementById("colorDisplay");
//δηλώνουμε σε μεταβλητη το h1 για να μπορεσουμε να το αλλάξουμε στη function changeColor
let h1 = document.getElementsByTagName("h1")[0];
var resetButton = document.getElementsByClassName("reset")[0];
var modeButtons = document.querySelectorAll(".modebuttons");


 init();

 function init(){
     //mode buttons
     setUpmodeButtons();
     setUpSquares();
     //anoigei h selida kai epanaprosdiorizei ta xrwmata
     reset();
 }
 function setUpmodeButtons(){
    for(let i = 0; i < modeButtons.length; i++){
        modeButtons[i].addEventListener("click",function(){
            modeButtons[0].classList.remove("selected");
            modeButtons[1].classList.remove("selected");
            this.classList.add("selected");
            if(this.textContent === "Easy"){
                squareTotal = 3;
            }
            else{
                squareTotal = 6;
            }
            reset();
        });
    }
 };
 function setUpSquares(){
        //δημιουργω την λουπα squares
     for(i=0; i < squares.length; i++){
        //
        squares[i].addEventListener("click", function(){
            //αποθηκεύω σε μια μεταβλητή το χρώμα του κάθε div που αποδώθηκε παραπάνω
            let theSquare =  this.style.backgroundColor;
            if(theSquare === colorPicker){
                messageDisplay.textContent = "Correct!";
                messageDisplay.style.color = "rgb(50, 255, 12)";
                //Η function λειτουργεί αν είναι το σωστό χρώμα
                changeColor(theSquare);
                rgbColor.style.color = colorPicker;
                resetButton.textContent = "Play Again!";
            }else{
                messageDisplay.textContent = "Try Again!";
                //αν είναι λάθος το κουτι να εξαφανιζεται
                this.style.backgroundColor = "#232323";
                messageDisplay.style.color = "rgb(255, 0, 0)";
            }
        });
    }
  };

 function  reset(){
    //generate new colors
    colors = generateRandomColor(squareTotal);
    //διαλέγω νεο τυχαιο χρώμα
    colorPicker = randomColor();
    //αλλάζουμε τον κωδικο rgb που εμφανίζεται στο h1 αναλογως το τυχαιο χρώμα
    rgbColor.textContent = colorPicker;
    //αλλάζει το χρώμα του κειμένου rgb στο λευκό (βαζουμε δίαιση και έδω και στη css)
    rgbColor.style.color = "#fff";
    h1.classList.add("headerH1");
     //μόλις πατηθεί το reset κουμπί επανέρχεται το όνομα του κουμπιού
    resetButton.textContent = "New Colors";
    //αλλάζουμε τα χρώματα στα div
    for(let i=0; i<squares.length; i++){
        //ποσα χρώματα έχει μέσα η μεταβλητη colors αναλόγως με τα squareTotal 
        if(colors[i]){
            squares[i].style.display = "block";
            squares[i].style.backgroundColor = colors[i];
        }else{
            squares[i].style.display = "none";
        }
    }
    //το χρωμα του φόντου στο h1 επανερχεται στο αρχικό 
    h1.style.backgroundColor = "#232323";
    messageDisplay.textContent = "Guess!!!";
    messageDisplay.style.color = "#000";
 }

    resetButton.addEventListener("click", function(){
        reset();
    });

   
    //οταν βρεθει το σωστο χρωμα να αλλαξουν όλα τα div στο ιδιο χρωμα(δημιουργω μια function για να είναι ο κωδικας πιο οργανωμένος )
 function changeColor(color){
     //ξανα κάνω την ίδια δομή επανάληψης για να μπει το χρώμα theSquare του σωστού χρώματος σε όλα τα div
     for(i=0; i < squares.length; i++){
          squares[i].style.backgroundColor = color;
       
     }
 }
 //επιλογή ενός χρώματος απο τον πίνακα
 function randomColor(){
     let randomNum = Math.floor(Math.random() * colors.length);
     return colors[randomNum];
 }
 //δημιουργια πίνακα χρωμάτων
 function generateRandomColor(num){
     //δημιουργώ έναν πίνακα που θα μπουν τα τυχαία χρώματα που θα δημιουργήσουμε σε αλλη function
     let colorArray = [];
     //θέλουμε μια λούπα για να βγάλει οσα num(παραμετρος) χρώματα χρειάζεται
     for(let i=0; i < num; i++){
         //push into array
         colorArray.push(creatColor());
     }
     //επιστροφη του πίνακα 
     return colorArray;
 }
 //δημιουργια χρωμάτων
 function creatColor(){
     let r = Math.floor(Math.random() * 256);
     let g = Math.floor(Math.random() * 256);
     let b = Math.floor(Math.random() * 256);
     //βάζουμε κενά στο κομμα γιατι η css απο default τη μορφη του rgb το αποδιδει ως rgb(255, 255, 255)
     return  "rgb(" + r + ", " + g + ", " + b +")";
 }

    