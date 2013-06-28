$(function() {
	var detalles=[];
	var AUTOID=0;
	function Detalle_Factura_Venta(id,producto,cantidad, descuento) { 
		this.id = id;
		this.producto = producto;
		this.cantidad = cantidad;
		this.descuento = descuento;
	} 
	function updateTips( t ) {
		var tips = $("div#divErrores");
		tips
		.text( t )
		.addClass( "ui-state-highlight" );
		setTimeout(function() {
			tips.removeClass( "ui-state-highlight", 1500 );
		 }, 500 );
	}
    function checkLength( o, n, min, max ) { console.log(o); console.log(n);
		if ( o.val().length > max || o.val().length < min ) {
			o.addClass( "ui-state-error" );
			updateTips( "Length of " + n + " must be between " +
			min + " and " + max + "." );
			return false;
		} else {
			o.removeClass("ui-state-error" );
				return true;
		}
	}

	function checkRegexp( o, regexp, n ) {
		if ( !( regexp.test( o.val() ) ) ) {
			o.addClass( "ui-state-error" );
			updateTips( n );
			return false;
		} else {
			return true;
		}
	}
	function crear() {
		var id = $( "#id" );
		var producto = $( "#txt_producto" );
		var cantidad = $( "#txt_cantidad" );
		var descuento = $( "#txt_descuento" );
		var detalle= new Empleado( AUTOID+=1, producto.val(), cantidad.val(), descuento.val() );
		detalles.push(detalle);
		$( "#objTable tbody" ).append( "<tr>" +
			"<td>" + detalle.id + "</td>" +
			"<td>" + producto.val() + "</td>" +
			"<td>" + cantidad.val() + "</td>" +
			"<td>" + descuento.val() + "</td>" + 
			"<td><input type='button' class='editar' id='editar' value='Editar' did='"+ detalle.id  +"' /><input class='borrar' type='button' value='Borrar' did='"+ detalle.id  +"' /></td>" +
			"</tr>" );
            $(".borrar").button().click(function(){ 
            	var detalleId = $(this).attr("did");
				$(this).parents("tr").remove();
						delete detalles[detalleId];
				});
			$(".editar").button().click(function(){ 
				var detalleId = $(this).attr("did");
				var empl = obtenerEmpleado(empId);
				$( "#id" ).val(empId);
				$( "#producto" ).val("");
				$( "#cantidad" ).val("");
				$( "#descuento" ).val("");
				
				});
				resetearForm()
							
	}
	$( "#create-empl" ).button().click(function() {
			$("#id").val(AUTOID + 1);
	});
	E_Editar();
	E_Borrar();
	function obtenerDetalle(){
		$( "#btnEdit" ).button().click(function(){
			for(i=0; i < detalles.length; i++){
			if (detalles[i] == eid){ 
			}
			}
			});
			}
		
		function E_Editar(){
		$( "#btnEdit" ).button().click(function(){
			//for(i=0; i < empleados.length; i++){
			//if (empleados[i] == eid){ 
			//}
			//}
		 console.log(this.id);
			});
			}
	
		function E_Borrar(){
			$("#btnDelete").button().click(function(){
				console.log(this.id);
				
			});
		}
		
		function resetearForm(){
			with (document.frm) {
			reset();
			}
		}
}		
