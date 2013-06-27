class AddForeignKeyStock < ActiveRecord::Migration
  def change
  	  	add_foreign_key(:detalle_factura_venta, :factura_venta, column: 'id_factura_venta')
  		add_foreign_key(:detalle_factura_venta, :productos, column: 'id_producto')
  		add_foreign_key(:stock, :productos, column: 'id_producto')
  end
end
