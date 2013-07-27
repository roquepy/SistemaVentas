class CreateDetallesMovimientosStocks < ActiveRecord::Migration
  def change
    create_table :detalles_movimientos_stocks do |t|
      t.integer :id_movimiento_stock,:null=>false
      t.integer :id_stock,:null=>false
      t.integer :cantidad,:null=>false
    end
  end
end
