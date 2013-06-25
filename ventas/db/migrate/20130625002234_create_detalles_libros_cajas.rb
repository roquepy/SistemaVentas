class CreateDetallesLibrosCajas < ActiveRecord::Migration
  def change
    create_table :detalles_libros_cajas do |t|
      t.integer :id_libro_caja
      t.integer :id_funcionario
      t.integer :id_tipo_documento
      t.integer :nro_asiento
      t.string :fecha
      t.string :descripcion
      t.integer :ingreso
      t.integer :egreso
      t.integer :nro_documento

      t.timestamps
    end
  end
end
