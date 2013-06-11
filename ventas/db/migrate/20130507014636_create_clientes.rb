class CreateClientes < ActiveRecord::Migration
  def change
    create_table :clientes do |t|
    t.string :nombre, :limit => 50,:null => false
    t.string :apellido,:limit => 50,:null => false
    t.string :num_identidad,:limit => 15,:null => false
    t.integer :id_localidad,:null => false
    t.string :direccion,:limit => 50,:null => false
    t.string :telefono,:limit => 15,:null => false
    t.string :sexo,:limit => 1,:null => false
    end
  end
end
