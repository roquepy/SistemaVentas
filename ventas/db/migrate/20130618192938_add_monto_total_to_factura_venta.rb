class AddMontoTotalToFacturaVenta < ActiveRecord::Migration
  def change
    add_column :factura_venta, :monto_total, :decimal

  end
end