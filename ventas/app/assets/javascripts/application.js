// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// the compiled file.
//
// WARNING: THE FIRST BLANK LINE MARKS THE END OF WHAT'S TO BE PROCESSED, ANY BLANK LINE SHOULD
// GO AFTER THE REQUIRES BELOW.
//
//= require jquery
//= require jquery_ujs
//= require bootstrap-modal
//= require bootstrap-dropdown
//= require calendar
//= require jquery-ui.min
//= require autocomplete-rails
//= require_tree .

$('#new_client input').hover(function()
{
	$(this).popover('show')
});


// Función para validar Nº Enteros:
function validar(obj) {
txt = obj.value;
if(parseInt(txt) != parseFloat(txt)) {
alert('El campo de datos sólo permite almacenar números enteros');
obj.focus();
}
}

function muestra_oculta(id){
	if (document.getElementById){ //se obtiene el id
		var el = document.getElementById(id); //se define la variable "el" igual a nuestro div
		el.style.display = (el.style.display == 'none') ? 'block' : 'none'; //damos un atributo display:none que oculta el div
	}
}
