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
#   inflect.uncountable %w( fish sheep )
end
#
# These inflection rules are supported but not enabled by default:
# ActiveSupport::Inflector.inflections do |inflect|
#   inflect.acronym 'RESTful'
# end