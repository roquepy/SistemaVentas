class CreateDepartamentos < ActiveRecord::Migration
  def change
    create_table :departamentos do |t|
      t.string :nombre, :null => false
    end
  end
end
