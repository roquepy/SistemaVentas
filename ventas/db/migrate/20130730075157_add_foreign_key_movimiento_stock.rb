class AddForeignKeyMovimientoStock < ActiveRecord::Migration
  def change
  	  	add_foreign_key(:detalles_movimientos_stocks, :movimientos_stocks, column: 'id_movimiento_stock')
  		add_foreign_key(:detalles_movimientos_stocks, :stock, column: 'id_stock')
  		add_foreign_key(:movimientos_stocks, :tipos_movimientos, column: 'id_tipo_movimiento')
  		add_foreign_key(:movimientos_stocks, :funcionarios, column: 'id_funcionario')
  		add_foreign_key(:roles_usuarios, :roles, column: 'id_rol')
  		add_foreign_key(:roles_usuarios, :users, column: 'id_usuario')
  end
end
