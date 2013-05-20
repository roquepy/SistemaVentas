class CreateDetalleFacturaVenta < ActiveRecord::Migration
  def change
    create_table :detalle_factura_venta do |t|
      t.integer :id_factura_venta,  :null => false
      t.integer :id_producto,  :null => false
      t.integer :cantidad,  :null => false
      t.integer :descuento,  :null => true
    end
  end
end
