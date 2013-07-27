class CreateMovimientosStocks < ActiveRecord::Migration
  def change
    create_table :movimientos_stocks do |t|
       t.date :fecha,  :null => false
       t.integer :id_tipo_movimiento,  :null => false
       t.string :descripcion,:limite=>25
       t.integer :id_funcionario,  :null => false
    end
  end
end
