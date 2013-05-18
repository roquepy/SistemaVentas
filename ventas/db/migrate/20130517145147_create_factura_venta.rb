class CreateFacturaVenta < ActiveRecord::Migration
  def change
    create_table :factura_venta do |t|
        t.date :fecha,  :null => false
       t.integer :id_cliente,  :null => false
       t.integer :id_condicion_pago,  :null => false
       t.integer :id_tipo_valor,  :null => false
       t.integer :id_funcionario,  :null => false
       t.string :anulado,  :null => false
       t.integer :nro_factura,  :null => false
       t.decimal :total_descuento,  :null => false
       t.decimal :total_iva5,  :null => false
       t.decimal :total_iva10,  :null => false
       t.decimal :total_iva,  :null => false
    end
  end
end
