/// This is a manifest file that'll be compiled into application.js, which will include all the files
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
//= require jsapi
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

function load_change_event(path){
  path_general = path;
  $('input[type=radio],#from,#to').on('change', function(){
    reload_interface(path);
  });
}

/*
 * TThis function reload the web page  with current data of each filter
 */
function reload_interface(){
  var range = $("input[name='radio']:checked").attr('id');
  var lower_limit = $("#from").val();
  var upper_limit = $("#to").val();
  $.ajax({
    url: path_general,
    data: { "select_range": range,"lower_limit": lower_limit,"upper_limit": upper_limit},
    async: true,
    dataType: 'script'
   });
}

function change_data_by_filters(path){
  $('input[type=radio],#from,#to').on("change", function() {
    var _from = $("#from").val();
    var _to = $("#to").val();
    var range = $("input[name='radio']:checked").attr('id');
    $.ajax({
      url: path,
      data: { "from": _from, "to": _to, "select_range": range },
      async: true,
      dataType: 'script'
    });
    return false;
  });
}

function rangeDate() {
    $("#from").datepicker({
      changeMonth: true,
      changeYear: true,
      onSelect: function(dateText, inst) {}
    });
    $("#to").datepicker({
      changeMonth: true,
      changeYear: true,
      onSelect: function(dateText, inst) {}
    });
  }
  function validarCampoVacioCliente(campo) {
   if(campo.value=="") { //comprueba que no esté vacío   
        $("#cliente_error").show();        
        return false; //devolvemos el foco
   }else{
    $("#cliente_error").hide(); 
   }
 }

 

 function validarCampoVacioProducto(campo) {
   if(campo.value=='') { //comprueba que no esté vacío
        $("#producto_error").show();        
          $('#guardar_o_actualizar').attr('disabled','-1'); 
        return false; //devolvemos el foco
   }else{
    $("#producto_error").hide();
      $('#guardar_o_actualizar').attr('disabled',false); 
   }
 }

 function validarCampoCantidad(campo) {
   
    if (CampoVacioCantidad(campo)==true||esNumeroCantidad(campo)==true||comparar_stock(campo)==true) {
        $('#guardar_o_actualizar').attr('disabled','-1'); 
        return true;
    }
    else {
       $('#guardar_o_actualizar').attr('disabled',false); 
        return false;
    }
     
   
 }

  function validarCampoCantidadMS(campo) {
    if(CantidadMinima(campo)==true||CantidadOptima(campo)==true||CampoVacioCantidad(campo)==true||esNumeroCantidad(campo)==true){
      $('#guardar_o_actualizar').attr('disabled','-1'); 
        return true;
    }else{
      $('#guardar_o_actualizar').attr('disabled',false); 
      return true;
    }
    
   
   
 }

 function validarCampoDescuento(campo) {
   
   if (CampoVacioDescuento(campo)==true){
    return true;
   }
     if (esNumeroDescuento(campo)==true){
      return true;
     }
    if( rango_descuento(campo)==true){
        return true;
    } 
 }
 function CampoVacioCantidad(campo) {
   if(campo.value=='') { //comprueba que no esté vacío  
        $("#cantidad_error").show();        
        return true; //devolvemos el foco
   }else{
    $("#cantidad_error").hide();
    return false;
   }
 }
 function CantidadMinima(campo) {
   var cantidad_minima= document.getElementById('cantidad_minima').value;
   var cantidad_stock= document.getElementById('cantidad_stock').value;
   if(parseInt(campo.value) + parseInt(cantidad_stock) < parseInt(cantidad_minima)) { //comprueba que no esté vacío  
        $("#cantidad_minima_error").show();        
        return true; //devolvemos el foco
   }else{
    $("#cantidad_minima_error").hide();
    return false;
   }
 }
 function CantidadOptima(campo) {
   var cantidad_optima= document.getElementById('cantidad_optima').value;
   var cantidad_stock= document.getElementById('cantidad_stock').value;
   if(parseInt(campo.value) + parseInt(cantidad_stock)> parseInt(cantidad_optima)) { //comprueba que no esté vacío  
        $("#cantidad_optima_error").show();        
        return true; //devolvemos el foco
   }else{
    $("#cantidad_optima_error").hide();
    return false;
   }
 }

  function esNumeroCantidad(campo) {
   var RegExPattern = /^\d{1,3}$/;
   if ((campo.value.match(RegExPattern))) {
       $("#numero_error").hide(); 
       return false;
   }else {
        $("#numero_error").show(); 
        return true;
   } 
}

function comparar_stock(campo) {
   var cantidad_stock= document.getElementById('cantidad_stock').value;
   if (parseInt(campo.value) > parseInt(cantidad_stock)) {
       $("#stock_cantidad_error").show(); 
       return true;
   }else {
        $("#stock_cantidad_error").hide(); 
        return false;
   } 
}

   function CampoVacioDescuento(campo) {
   if(campo.value=="") { //comprueba que no esté vacío  
        $("#descuento_error").show();        
        return true; //devolvemos el foco
   }else{
    $("#descuento_error").hide();
    return false;
   }
 }

  function esNumeroDescuento(campo) {
   var RegExPattern = /^\d{1,3}$/;
   if ((campo.value.match(RegExPattern)) && (campo.value!='')) {
       $("#numero_descuento_error").hide(); 
       return false;
   }else {
        $("#numero_descuento_error").show(); 
        return true;
   } 
}

function rango_descuento(campo) {
   
   if (campo.value>=0&&campo.value<=100) {
       $("#rango_descuento_error").hide();
       return false;
   }else {
        $("#rango_descuento_error").show(); 
        return true;
   } 
}

function cancelar() {
   $("#producto").hide();
   $("#descripcion").val("");
   $("#cantidad").val("");
   $("#descuento").val("");
    $("#rango_descuento_error").hide();
    $("#numero_descuento_error").hide();
     $("#descuento_error").hide();
     $("#numero_error").hide();
     $("#stock_cantidad_error").hide();
      $("#cantidad_error").hide();
    $("#producto_error").hide();
}

function solo_Letras(val){
  if (val.match(/^[a-zA-Z]+$/)){
    $("#solo_letras_error").hide();
      return true;
  }else{
    $("#solo_letras_error").show();
  return false;
  } 
}
function validarCampoProducto(campo){
 if (validarCampoVacioProducto(campo)==true){
    return true;
   }
     if (solo_Letras(campo)==true){
      return true;
     }
 }
 function validarCampoCliente(campo){
 if (validarCampoVacioCliente(campo)==true){
    return true;
   }
     if (solo_Letras(campo)==true){
      return true;
     }
 }

