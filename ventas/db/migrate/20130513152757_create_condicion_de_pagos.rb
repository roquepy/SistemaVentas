class CreateCondicionDePagos < ActiveRecord::Migration
  def change
    create_table :condicion_de_pagos do |t|
      t.string :nombre_condicion_de_pago,:limit => 15,  :null => false
    end
  end
end
