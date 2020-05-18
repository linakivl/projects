
var photos = document.querySelectorAll(".image-container div");
var photo_buttons = document.querySelectorAll(".buttons-menu-box div");

function changeImage(num) {
	
	for(var i = 0; i < photos.length; i++) {
		photos[i].style.display = "none";
		photo_buttons[i].className = "";
	}
	
	photos[num].style.display = "block";
	photo_buttons[num].className = "active";
}

changeImage(0);

