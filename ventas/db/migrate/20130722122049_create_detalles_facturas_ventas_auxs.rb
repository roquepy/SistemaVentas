class CreateDetallesFacturasVentasAuxs < ActiveRecord::Migration
  def change
    create_table :detalles_facturas_ventas_auxs do |t|
      t.integer :id_producto,  :null => false
      t.integer :cantidad,  :null => false
      t.integer :descuento,  :null => true
    end
  end
end
