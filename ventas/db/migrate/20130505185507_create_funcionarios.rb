class CreateFuncionarios < ActiveRecord::Migration
  def change
    create_table :funcionarios do |t|
     t.string :num_identidad,:limit => 15,:null => false
     t.string :nombres, :limit => 25, :null => false
     t.string :apellidos,:limit => 25, :null => false
     t.string :direccion, :limit => 35,:null => false
     t.string :telefono, :limit => 15, :null => true
     t.string :estado_civil, :limit => 8,:null => false
     t.timestamps :fecha
     t.string :sexo, :limit =>1,:null => false
     t.integer :id_localidad, :null => false
     t.timestamps :fecha
     t.integer :id_estado_funcionario, :null => false
     t.integer :id_funcion, :null => false
    end
  end
end
