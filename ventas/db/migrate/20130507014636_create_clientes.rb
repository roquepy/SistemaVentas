class CreateClientes < ActiveRecord::Migration
  def change
    create_table :clientes do |t|
    t.string :nombre, :null => false
    t.string :apellido,:null => false
    t.string :num_identidad,:null => false
    t.integer :id_localidad,:null => false
    t.string :direccion,:null => false
    t.string :telefono,:null => false
    t.string :sexo,:null => false
    end
  end
end
