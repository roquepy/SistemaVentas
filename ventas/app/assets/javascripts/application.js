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
//= require rails.validations
//= require simple_pagination
//= require_tree .


function muestra_oculta(id){
	if (document.getElementById){ //se obtiene el id
		var el = document.getElementById(id); //se define la variable "el" igual a nuestro div
		el.style.display = (el.style.display == 'none') ? 'block' : 'none'; //damos un atributo display:none que oculta el div
	}
}


function test(pageNumber)
{
  $('.selection').hide();
  for(var i=0; i<10; i++){
    var page=".page-"+(pageNumber+i);
    $(page).show();
  }
}
