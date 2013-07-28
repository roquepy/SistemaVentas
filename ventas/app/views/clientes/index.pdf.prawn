 require 'rubygems'
 require 'prawn'
pdf.text_box @fecha, :size => 10, :style => :italic, :at => [10, pdf.cursor]
pdf.move_down(20) 

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
  pdf.text_box "LISTADO DE CLIENTES", :size => 15, :style => :bold_italic, :at => [address_x,  pdf.cursor]
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
  pdf.move_down 30
  pdf.text_box "Cantidad de clientes registrados: ", :size => 10, :style => :bold, :at => [address_x,  pdf.cursor]
  pdf.text_box "#{@clientes.size}", :at => [address_x+180,  pdf.cursor]

  # client address
  pdf.move_down 20
  last_measured_y = pdf.cursor

  pdf.move_down 45

  invoice_services_data = [ 
    ["N°", "Nombre(s)", "Apellido(s)", "RUC/N° CI", "Dirección", "Localidad", "Telefóno"]
  ]
  invoice_services_data += @clientes.each_with_index.map do |item, i|  
    [  
          i+1,
          item.nombre,  
          item.apellido,
          item.num_identidad,
          item.direccion,
          item.localidad.nombre,
          item.telefono
    ] 

end  

  pdf.table(invoice_services_data, :width => pdf.bounds.width, :header => true) do
    style(row(1..-1).columns(0..-1), :padding => [4, 5, 3, 5], :borders => [:bottom], :border_color => 'dddddd')
    style(row(0), :background_color => 'e9e9e9', :border_color => 'dddddd', :font_style => :bold)
    style(row(0).columns(0..-1), :borders => [:top, :bottom])
    style(row(0).columns(0), :borders => [:top, :left, :bottom])
    style(row(0).columns(-1), :borders => [:top, :left, :bottom])
    style(row(-1), :border_width => 2)
    style(column(2..-1), :align => :left)
    style(columns(0), :width => 30)
    style(columns(1), :width => 80)
    style(columns(2), :width => 80)
    style(columns(3), :width => 65)
    style(columns(4), :width => 155)
    style(columns(5), :width => 65)
    style(columns(6), :width => 65)

  end

pdf.page_count.times do |i| 
  pdf.go_to_page(i+1) 
  pdf.move_cursor_to last_measured_y
  pdf.move_down 578.5
  pdf.text_box "Pagina #{(i+1)} de #{pdf.page_count}", :at => [address_x+210,  pdf.cursor] 
end
