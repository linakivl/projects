//δημιουργω ενα obj

const userKey = "something";

let person = {
    //η παυλα επιτρέπεται μόνο αν γίνει χρήση εισαγωγικών
    "first-name": "Lina", //properties
    age: 28,
    [userKey]: "user input", //εχουμε προσβαση: person[userKey]
    greet: () => 
    {console.log("hello");}, //method
    //μπορεί να μπει αριθμός για το όνομα του κλειδιού δεν συνιθίζεται πολλές φορες βέβαια(εκτος απο αρνητικο,μονο 0>=)
    1.5: "height"
}

person.greet();
//προσθέτω κατι σε ένα obj
person.colorHair = "black";
//διαγράφω κάτι σε ένα obj
delete person.name;
//αποκτούμε πρόσβαση σε μια ιδιότητα που έχει οριστεί με διαφορετικο τρόπο απο τον επιτρεπτό με αγκύλες και εισαγωγικά 
//η προσβαση σε κλειδί με αριθμό μπορεί να γίνει και με τους δύο τρόπους
console.log(person["first-name",1.5]);
/*ακομα και στο να ορίσουμε κατι στην css μεσω js.
    πχ: document.body.style.backgroundColor = "pink";
        μπορει να γραφτεί με τον παρακάτω τρόπο:
        document.body.style["background-color"] = "pink";
*/
//ΙΕΡΑΡΧΙΚΑ: Σε ένα τέτοιο obj εμφανίζονται με την σειρά που τα βαζουμε, έαν τα ονόματα είναι μόνο αριθμοί εμφανίζονται με
//την ιεραρχία των μαθηματικών

const dynamicStore = "first-name"; //αποθηκεύουμε δυναμίκα σε μεταβλήτη το κλειδί 
console.log(person[dynamicStore]);  //με αυτον τον τροπο μπορούμε να έχουμε πρόσβαση 

//SPREAD OPERATOR(αντιγράφει μέχρι ένα επίπεδο key-value ζευγάρια, εάν θελουμε να αντιγράψουμε σε ενα βαθυτερο επιπεδο που μεσα σε ενα οbj εχουμε 
//πίνακες και αλλα obj το κάνουμε με τον παρακάτω τροπο)
//αντιγραφη obj μέσα σε obj
const person = { info: {name: "Lina", age: 28}, gender: female};
const personNew = {...person, info: {...person.info}};
//αντιγραφη array μεσα σε obj
const fruits = { kind: ["orange", "apple", "banana"], kilo: 2.5};
const fruitsNew = {...fruits, kind: [...fruits.kind]};

//FACTORY FUNCTION 
//Οταν θέλουμε να δημιουργήσουμε πολλα obj με ιδια prop ή methods αλλα και να αλλάζουμε διαφορα prop
function createCircle(radius) {
    return {
        radius,
        info() {
            return this.radius ;
        }
    };
}
const circle1 = createCircle(1);
for('radius' in circle1){
    console.log(radius);
}
console.log(circle1);

//CONSTRUCTOR FUNCTION
function Circle(radius){
    this.radius = radius;  //το this αναφέρεται στο νεο obj
    this.info = function(){
        return this.radius;
    }
}
const circle2 = new Circle(2); //δημιουργεί νεο obj, πρεπει πάντα να βάζουμε το new
console.log(circle2.info()); //θα γυρίσει το radius που ορίσαμε
const allKeyCircle = Object.keys(circle2); //Πρόκειται για μία μέθοδο που γυρνάει τα κλειδιά του obj 
for(const key in circle2){
    // console.log(key, circle2[key]); //Εκτυπώνει τα κλειδιά του obj, Εκτυπώνει τις τιμές απο τα κλειδιά του obj 
    if(typeof circle2[key] !=='function'){ //Εαν η τιμή είναι διάφορο του function εμφανισε όλα τα properties
        console.log(key);
    }
}

if('radius' in circle2){
    console.log("we have radius");  //Ελεγχουμε εάν έχουμε καποιο κλειδί με το όνομα radius
}