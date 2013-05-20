class CreateDepartamentos < ActiveRecord::Migration
  def change
    create_table :departamentos do |t|
    t.string :nombre, :limit => 30, :null => false
    end
  end
end
