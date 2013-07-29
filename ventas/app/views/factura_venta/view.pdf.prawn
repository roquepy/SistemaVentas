  require 'rubygems'
  require 'prawn'

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
  pdf.text_box @nombreempresa, :size => 12, :style => :bold_italic, :at => [address_x,  pdf.cursor]
  pdf.move_down lineheight_y
  pdf.text_box "RUC #{@ruc}" , :at => [address_x,  pdf.cursor]
  pdf.move_down lineheight_y
  pdf.text_box "Timbrado #{@timbrado}. Valido hasta: #{@vencimiento}" , :at => [address_x,  pdf.cursor]
  pdf.move_down lineheight_y
  pdf.text_box @direccion, :at => [address_x,  pdf.cursor]
  pdf.move_down lineheight_y
  pdf.text_box @telefono, :at => [address_x,  pdf.cursor]
  pdf.move_down lineheight_y

  last_measured_y = pdf.cursor
  pdf.move_cursor_to pdf.bounds.height

  pdf.image logo, :width => 165, :height => 80, :position => :right

  pdf.move_cursor_to last_measured_y

  # client address
  pdf.move_down 65
  last_measured_y = pdf.cursor

  pdf.text_box "Razon Social: #{@cliente.nombre} #{@cliente.apellido}", :at => [address_x,  pdf.cursor]
  pdf.move_down lineheight_y
   pdf.text_box "N° Documento: #{@cliente.num_identidad}", :at => [address_x,  pdf.cursor]
  pdf.move_down lineheight_y
   pdf.text_box "Direccion: #{@cliente.direccion}", :at => [address_x,  pdf.cursor]
  pdf.move_down lineheight_y
 pdf.text_box "Telefono: #{@cliente.telefono}", :at => [address_x,  pdf.cursor]

  pdf.move_cursor_to last_measured_y

  invoice_header_data = [ 
    ["Factura #", @factura_venta.nro_factura],
    ["Fecha: ", @factura_venta.fecha],
    ["Total (Gs): ", @factura_venta.monto_total]
  ]

  pdf.table(invoice_header_data, :position => invoice_header_x, :width => 215) do
    style(row(0..1).columns(0..1), :padding => [1, 5, 1, 5], :borders => [])
    style(row(2), :background_color => 'e9e9e9', :border_color => 'dddddd', :font_style => :bold)
    style(column(1), :align => :right)
    style(row(2).columns(0), :borders => [:top, :left, :bottom])
    style(row(2).columns(1), :borders => [:top, :right, :bottom])
  end

  pdf.move_down 45

  invoice_services_data = [ 
    ["Codigo", "Descripcion", "Precio Unitario", "Cantidad", "Descuento", "Total Parcial"],
  ]
invoice_services_data +=  @detalles_factura_venta.map do |item|  
    [ 
      item.producto.codigo,
      item.producto.descripcion,
      item.producto.precio_unitario,
      item.cantidad,
      item.cantidad*item.producto.precio_unitario*item.descuento/100,
      (item.cantidad*item.producto.precio_unitario)-(item.cantidad*item.producto.precio_unitario*item.descuento/100)
   ] 

end  

  pdf.table(invoice_services_data, :width => pdf.bounds.width) do
    style(row(1..-1).columns(0..-1), :padding => [4, 5, 4, 5], :borders => [:bottom], :border_color => 'dddddd')
    style(row(0), :background_color => 'e9e9e9', :border_color => 'dddddd', :font_style => :bold)
    style(row(0).columns(0..-1), :borders => [:top, :bottom])
    style(row(0).columns(0), :borders => [:top, :left, :bottom])
    style(row(0).columns(-1), :borders => [:top, :right, :bottom])
    style(row(-1), :border_width => 2)
    style(column(2..-1), :align => :right)
    style(columns(0), :width => 60)
    style(columns(1), :width => 210)
    style(columns(2), :width => 50)
    style(columns(3), :width => 70)
    style(columns(4), :width => 70)
    style(columns(5), :width => 80)
  end

  pdf.move_down 1

  invoice_services_totals_data = [ 
   ["Total IVA (Gs)",@factura_venta.total_iva],
    ["Total Descuento (Gs)", @factura_venta.total_descuento],
     ["Total (Gs)", @factura_venta.monto_total]
  ]

  pdf.table(invoice_services_totals_data, :position => invoice_header_x, :width => 215) do
    style(row(0..1).columns(0..1), :padding => [1, 5, 1, 5], :borders => [])
    style(row(0), :font_style => :bold)
    style(row(2), :background_color => 'e9e9e9', :border_color => 'dddddd', :font_style => :bold)
    style(column(1), :align => :right)
    style(row(2).columns(0), :borders => [:top, :left, :bottom])
    style(row(2).columns(1), :borders => [:top, :right, :bottom])
  end

  pdf.move_down 25


  invoice_notes_data = [ 
    ["Gracias por su Preferencia."]
  ]

  pdf.table(invoice_notes_data, :width => 275) do
    style(row(0..-1).columns(0..-1), :padding => [1, 0, 1, 0], :borders => [])
    style(row(0).columns(0), :font_style => :bold)
  end
