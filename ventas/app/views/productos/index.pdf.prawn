pdf.move_down(10) 

require 'rubygems'
 require 'prawn'

pdf.move_down(10) 

logo = @logo
  initial_y = pdf.cursor
  initialmove_y = 5
  address_x = 35
  invoice_header_x = 325
  lineheight_y = 12
  font_size = 9

  pdf.move_down initialmove_y

  # Add the font style and size
  pdf.font "Helvetica"
  pdf.font_size font_size

  #start with EON Media Group
  pdf.text_box "LISTADO DE PRODUCTOS", :size => 15, :style => :bold_italic, :at => [address_x,  pdf.cursor]
  pdf.move_down lineheight_y
  pdf.move_down(5) 
  pdf.stroke_horizontal_rule
  pdf.move_down(5) 
  pdf.text_box @nombreempresa, :size => 12, :style => :bold_italic, :at => [address_x,  pdf.cursor]
  pdf.move_down lineheight_y
  pdf.text_box @direccion, :at => [address_x,  pdf.cursor]
  pdf.move_down lineheight_y
  pdf.text_box "Tel: "+@telefono, :at => [address_x,  pdf.cursor]
  pdf.move_down lineheight_y

  last_measured_y = pdf.cursor
  pdf.move_cursor_to pdf.bounds.height

  pdf.image logo, :width => 165, :heigth => 100, :position => :right

  pdf.move_cursor_to last_measured_y

  # client address
  pdf.move_down 65
  last_measured_y = pdf.cursor

  pdf.move_down 45

  invoice_services_data = [ 
    ["Código", "Descripción", "(%) IVA", "Unidad Básica", "Precio Unitario (Gs)"]
  ]
  invoice_services_data += @productos.map do |item|  
    [  
        item.codigo,  
        item.descripcion,
        item.porcentaje,
        "Unidad",
        item.precio_unitario
    ] 

end  

  pdf.table(invoice_services_data, :width => pdf.bounds.width) do
    style(row(1..-1).columns(0..-1), :padding => [4, 5, 4, 5], :borders => [:bottom], :border_color => 'dddddd')
    style(row(0), :background_color => 'e9e9e9', :border_color => 'dddddd', :font_style => :bold)
    style(row(0).columns(0..-1), :borders => [:top, :bottom])
    style(row(0).columns(0), :borders => [:top, :left, :bottom])
    style(row(0).columns(-1), :borders => [:top, :left, :bottom])
    style(row(-1), :border_width => 2)
    style(column(2..-1), :align => :center)
    style(columns(0), :width => 90)
    style(columns(1), :width => 260)
    style(columns(2), :width => 50)
    style(columns(3), :width => 70)
    style(columns(4), :width => 70)

  end

  pdf.move_down 1
