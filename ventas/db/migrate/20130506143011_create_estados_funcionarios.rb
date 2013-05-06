class CreateEstadosFuncionarios < ActiveRecord::Migration
  def change
    create_table :estados_funcionarios do |t|
      t.string :descripcion, :null => false
    end
  end
end
