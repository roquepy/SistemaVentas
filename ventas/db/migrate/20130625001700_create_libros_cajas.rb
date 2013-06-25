class CreateLibrosCajas < ActiveRecord::Migration
  def change
    create_table :libros_cajas do |t|
      t.integer :nro_libro_caja
      t.string :fecha_inicio
      t.string :fecha_fin
      t.integer :saldo_inicial
      t.integer :saldo_final

      t.timestamps
    end
  end
end
