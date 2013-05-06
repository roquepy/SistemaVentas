class CreateFuncions < ActiveRecord::Migration
  def change
    create_table :funcions do |t|
      t.string :nombre,  :null => false
    end
  end
end
