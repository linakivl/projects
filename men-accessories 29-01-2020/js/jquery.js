$(".col-form-acount-buttons-box").click(function(){
    $(".col-form-acount-buttons-box").toggleClass("color-buttons");
});
// show the form log in
$("#btnLog").click(function(){
    $(".form").slideDown(600);
});

// hide the form log in when click the window
$(window).click(function(event){
    var target = $(event.target);
    if(target.is(".form-acount")){
        $(".form").slideUp(600);
    }
});

//show the navigation side bar 
$("#barsLink").mouseenter(function(){
    $("#myNav").animate({
        width: "toggle"
    });
});
//hide the navigation side bar
$(".closebtn").click(function(){
    $("#myNav").animate({
        width: "toggle"
    });
});