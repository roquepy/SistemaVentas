class CreateDetallesMovimientosStocksAuxs < ActiveRecord::Migration
  def change
    create_table :detalles_movimientos_stocks_auxs do |t|
    	t.integer :id_stock,:null=>false
        t.integer :cantidad,:null=>false
    end
  end
end
