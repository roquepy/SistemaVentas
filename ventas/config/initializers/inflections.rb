# Be sure to restart your server when you modify this file.

# Add new inflection rules using the following format
# (all these examples are active by default):
 ActiveSupport::Inflector.inflections do |inflect|
#   inflect.plural /^(ox)$/i, '\1en'
#   inflect.singular /^(ox)en/i, '\1'
  inflect.irregular 'facturacabecera_facturadetalle', 'facturacabecera_facturadetalle'
  inflect.irregular 'stock', 'stock'
  inflect.irregular 'deposito', 'depositos'
  inflect.irregular 'libro_caja', 'libros_cajas'
  inflect.irregular 'detalle_libro_caja', 'detalles_libros_cajas'
  inflect.irregular 'tipo_documento', 'tipos_documentos'
  inflect.irregular 'detalle_factura_venta_aux', 'detalles_facturas_ventas_auxs'
  inflect.irregular 'movimiento_stock', 'movimientos_stocks'
  inflect.irregular 'detalle_movimiento_stock', 'detalles_movimientos_stocks'
  inflect.irregular 'detalle_movimiento_stock_aux', 'detalles_movimientos_stocks_auxs'
  inflect.irregular 'tipo_movimiento', 'tipos_movimientos'
  inflect.irregular 'rol', 'roles'
  inflect.irregular 'rol_usuario', 'roles_usuarios'
#   inflect.uncountable %w( fish sheep )
end
#
# These inflection rules are supported but not enabled by default:
# ActiveSupport::Inflector.inflections do |inflect|
#   inflect.acronym 'RESTful'
# end