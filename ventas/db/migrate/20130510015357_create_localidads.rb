class CreateLocalidads < ActiveRecord::Migration
  def change
    create_table :localidads do |t|
    t.string :nombre, :limit => 35,:null => false
    t.integer :id_departamento,:null => false
    end
  end
end


