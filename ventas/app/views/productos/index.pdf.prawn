pdf.text "Listado de Productos", :size => 20, :style => :bold, :align => :center
pdf.stroke_horizontal_rule
pdf.move_down(10)
pdf.text "Autoservicio Virgen del Rosario", :size => 10, :style => :bold, :align => :center
pdf.text "Calle Virgen del Rosario esquina Paraná | Gral. Artigas, Itapúa, Paraguay.", :size => 9, :style => :italic, :align => :center
pdf.text "Teléfono: 0743 20164", :size => 9, :style => :italic, :align => :center
pdf.move_down(60) 
pdf.text "Cantidad de Productos: #{@productos.size}", :size => 10, :style => :italic
pdf.move_down(20)  
items = [ ["<b>Código</b>", "<b>Descripción</b>", "<b>IVA</b>", "<b>Precio Unitario</b>"]  ]
items += @productos.map do |item|  
  [  
        item.codigo,  
        item.descripcion,
        item.porcentaje,
        item.precio_unitario
  ]  
end  
pdf.table(items, 
          :header => true,         
          :row_colors => ["F0F0F0"],
          :cell_style => { :inline_format => true, :font => "Times-Roman", :font_style => :italic }
          )

pdf.move_down(10) 