pdf.text "Listado de Clientes", :size => 20, :style => :bold, :align => :center
pdf.stroke_horizontal_rule
pdf.move_down(10)
pdf.text "Autoservicio Virgen del Rosario", :size => 10, :style => :bold, :align => :center
pdf.text "Calle Virgen del Rosario esquina Paraná | Gral. Artigas, Itapúa, Paraguay.", :size => 9, :style => :italic, :align => :center
pdf.text "Teléfono: 0743 20164", :size => 9, :style => :italic, :align => :center
pdf.move_down(60) 
pdf.text "Cantidad de Clientes Activos: #{@clientes.size}", :size => 10, :style => :italic
pdf.move_down(20)  
items = [ ["<b>Nombre</b>", "<b>Apellido</b>", "<b>RUC/Nro CI</b>", "<b>Dirección</b>", "<b>Localidad</b>", "<b>Telefóno</b>"]  ]
items += @clientes.map do |item|  
  [  
        item.nombre,  
        item.apellido,
        item.num_identidad,
        item.direccion,
        item.localidad.nombre,
        item.telefono
  ]  
end  

pdf.table(items, 
          :header => true,         
          :row_colors => ["F0F0F0"],
          :cell_style => { :inline_format => true, :font => "Times-Roman", :font_style => :italic })
  
  
pdf.move_down(10) 