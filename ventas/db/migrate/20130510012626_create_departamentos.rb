class CreateDepartamentos < ActiveRecord::Migration
  def change
    create_table :departamentos do |t|
    t.string :nombre, :limit => 35, :null => false
    end
  end
end
