class CreateConfiguracions < ActiveRecord::Migration
  def change
    create_table :configuracions do |t|
    	t.string :nombre_logo
    end
  end
end
