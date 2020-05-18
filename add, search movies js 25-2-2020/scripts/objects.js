//Επιλέγουμε τα κουμπιά
const addMoviesBtn = document.getElementById("add-movie-btn");
const searchBtn = document.getElementById("search-btn");
//ο πίνακας που θα εκχωρούνται οι ταινίες
const movies = [];

//αδειάζω τις τιμές αφου εκτελεστεί η λειτουργια addMovieHandler (και εσωτερικά και στην html)
const clearFunc = (t,ex,val) => {
    document.getElementById("title").value = "";
    document.getElementById("extra-name").value = "";
    document.getElementById("extra-value").value = "";
    t = "";
    ex = "";
    val = "";
   console.dir(t,ex,val);
}
//προσθέτουμε ταινία
const addMovieHandler = () => {
    //οι τιμές απο τα input δηλώνονται εδώ γιατι δε θα χρειαστούν κάπου αλλου
    const title = document.getElementById("title").value;
    const extraName = document.getElementById("extra-name").value;
    const extraValue = document.getElementById("extra-value").value;
    //θέλουμε να ελεγξουμε αν είναι κενά τα input και αν είναι να γυρίσουν στην αρχή
    if(
    //αρχικά απαλείφει τα κενά απο τα input και μετα συγκρίνει είναι ίσο με κενό string
        title.trim() === '' || 
        extraName.trim() === '' || 
        extraValue.trim() === '')
    {
        return;
    }
    //ενα obj που κρατάει την νέα ταινία
    const newMovie = {
        info: {
        //εαν το κλειδι και η τιμή είναι ίδια μπορεί να καταχωρηθεί ως παρακατω title: title ισούτε με title
            title,
            [extraName]: extraValue
        },
        id: Math.random(),
        getFormattedTitle: function() {   //ΔΕΝ κανουμε χρηση της arrow
            //το this αναφέρεται σε αυτο που θα καλέσει τη function
            return this.info.title.toUpperCase();
        }
    };
    movies.push(newMovie);
    console.log(movies);
    renderMovies();
    clearFunc(title, extraName, extraValue);
};

//η λειτουργια αυτη εμφανίζει στην σελιδα την λίστα απο τις ταινίες 
//περνάμε ως argument αυτο που θα γραφτει στο search input και έχουμε αρχικοποιήσει το argument σε περιπτωση που μείνει κενο 
const renderMovies = (inputVal = '') => {
    const movieList = document.getElementById("movie-list");
    //για να εμφανίσουμε τα div πρέπει να κάνουμε έλεγχο για το αν ο πίνακας είναι άδειος ή με στοιχεια
    if(movies.length === 0){
        movieList.classList.remove("visible");
    }else{
        movieList.classList.add("visible");
    }
    //για να μην επαναλαμβάνεται και γραφονται διπλότυπα
    movieList.innerHTML = "";
    const filteredMovies = !inputVal ? movies : movies.filter(movie => movie.info.title.includes(inputVal));
    //για καθε στοιχειο του πινακα να δημιουργειται και μια λιστα απο τις πληροφοριες του obj, πινακα.Επανάληψη(στοιχειο του πινακα)
    filteredMovies.forEach(movie =>{
        let extraInfo;
//OBJECT DESTRUCTURING
//μεσα στα σγουράκια βάζουμε ενα κλειδί που ήδη υπάρχει στο obj
        const {info} = movie;
//για να το κάνουμε πιο συγκεκριμένο(και αυτο μπορει να γίνει γιατι το info ειναι obj)
//εαν θέλουμε να αλλάξουμε το όνομα το ονομα του key βάζουμε :
        // const {title : titleMovie} = info;
//αποθηκεύεται σε μεταβλητη που έχει key το obj με όνομα getFormattedTitle(περιέχει μια function)
        let {getFormattedTitle} = movie;
//όταν θα κλειθεί η function getFormattedTitle το this να έχει συνδεθεί με το obj που έχει μπει στην παρένθεση 
        // getFormattedTitle = getFormattedTitle.bind(movie);
            for(const key in info){ 
            if(key !== 'title'){  //το title μπαίνε σε εισαγωγικά γιατι χωρις αυτά η js την βλέπει ως μεταβλητή και όχι ως όνομα απο κλειδί 
                extraInfo = `${key} - ${info[key]}`;  //με το key έχουμε πρόσβαση στο κλειδί και με το movie.info[key] εχουμε πρόσβαση στην τιμη
            }
        }

        const movieEl = document.createElement("li");
//εκτελείται η function που κάνει τα γράμματα κεφαλαία, καλείται απο το obj που έχει μπροστα αν δεν υπήρχε το movie θα χτυπουσα error 
//καθως το this θα αναφερόταν σε όλο το window 
        // const movieTitle = document.createTextNode(movie.getFormattedTitle() + " / ");
        const movieTitle = document.createTextNode(getFormattedTitle.call(movie) + " / ");
        const movieInfo =  document.createTextNode(extraInfo);
        
        movieEl.append(movieTitle, movieInfo);
        movieList.append(movieEl); 
    }); 
};
//παραπεμπει στο φιλτραρισμα του πίνακα αν εμπεριέχεται καποια ταινια στον πίνακα να την  εμφανίσει
const searchMovieHandler = ()  => {
    const filterTerm = document.getElementById("filter-title").value;  //αποθηκευεται  οτι εισερχεται στο input
    renderMovies(filterTerm);
} 
//συνδέουμε την παραπάνω function με το add Movie 
addMoviesBtn.addEventListener("click",addMovieHandler);
searchBtn.addEventListener("click",searchMovieHandler);