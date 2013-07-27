class CreateRoles < ActiveRecord::Migration
  def change
    create_table :roles do |t|
    	t.string :rol, :limit => 20,  :null => false
    end
  end
end
