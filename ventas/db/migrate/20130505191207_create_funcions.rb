class CreateFuncions < ActiveRecord::Migration
  def change
    create_table :funcions do |t|
      t.string :nombre, :limit => 30, :null => false
    end
  end
end
