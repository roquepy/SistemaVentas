class CreateFuncionarios < ActiveRecord::Migration
  def change
    create_table :funcionarios do |t|
     t.string :num_identidad
     t.string :nombres,  :null => false
     t.string :apellidos, :null => false
     t.string :direccion, :null => true
     t.string :telefono, :null => false
     t.string :estado_civil, :null => false
     t.timestamps :fecha
     t.string :sexo, :null => false
     t.integer :id_localidad, :null => false
     t.timestamps :fecha
     t.integer :id_estado_funcionario, :null => false
     t.integer :id_funcion, :null => false
    end
  end
end
