class CreateTipoValorPagos < ActiveRecord::Migration
  def change
    create_table :tipo_valor_pagos do |t|
     t.string :descripcion,  :null => false
    end
  end
end
