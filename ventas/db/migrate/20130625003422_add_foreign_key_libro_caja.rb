class AddForeignKeyLibroCaja < ActiveRecord::Migration
  def change
  	add_foreign_key(:detalles_libros_cajas, :funcionarios, column: 'id_funcionario')
  	add_foreign_key(:detalles_libros_cajas, :tipos_documentos, column: 'id_tipo_documento')
  	add_foreign_key(:detalles_libros_cajas, :libros_cajas, column: 'id_libro_caja')
  end
end
