class AddForeignKeyTables < ActiveRecord::Migration
  def change
  	add_foreign_key(:clientes, :localidads, column: 'id_localidad')
  	add_foreign_key(:localidads, :departamentos, column: 'id_departamento')
  	add_foreign_key(:funcionarios, :localidads, column: 'id_localidad')
  	add_foreign_key(:funcionarios, :estados_funcionarios, column: 'id_estado_funcionario')
  	add_foreign_key(:funcionarios, :funcions, column: 'id_funcion')
  	add_foreign_key(:users, :funcionarios, column: 'id_funcionario')
  	add_foreign_key(:factura_venta, :clientes, column: 'id_cliente')
  	add_foreign_key(:factura_venta, :condicion_de_pagos, column: 'id_condicion_pago')
  	add_foreign_key(:factura_venta, :tipo_valor_pagos, column: 'id_tipo_valor')
  	add_foreign_key(:factura_venta, :funcionarios, column: 'id_funcionario')
    
  end
end
