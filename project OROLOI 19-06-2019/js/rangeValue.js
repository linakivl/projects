var slide = document.getElementById("myRange");
var output  = document.getElementById("rangevalue");
output.innerHTML = slide.value;

slide.oninput = function() {
    output.innerHTML = this.value;
}