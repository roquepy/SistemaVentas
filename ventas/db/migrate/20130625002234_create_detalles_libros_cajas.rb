class CreateDetallesLibrosCajas < ActiveRecord::Migration
  def change
    create_table :detalles_libros_cajas do |t|
      t.integer :id_libro_caja,:null=>false
      t.integer :id_funcionario,:null=>false
      t.integer :id_tipo_documento,:null=>false
      t.integer :nro_asiento,:null=>false,:identity
      t.string :fecha,:null=>false
      t.string :descripcion,:null=>false
      t.integer :ingreso,:null=>false
      t.integer :egreso,:null=>false
      t.integer :nro_documento,:null=>false
      t.timestamps
    end
  end
end
