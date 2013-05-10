class CreateLocalidads < ActiveRecord::Migration
  def change
    create_table :localidads do |t|
    t.string :nombre ,:null => false
    t.integer :id_departamento,:null => false
    end
  end
end
