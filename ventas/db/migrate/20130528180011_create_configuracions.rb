class CreateConfiguracions < ActiveRecord::Migration
  def change
    create_table :configuracions do |t|
    	t.string :nombre_logo, :limit => 20, :null =>false
    	t.string :logo, :null => false
    	t.string :nombre_empresa,:limit => 30,:null => false
    	t.string :direccion,:limit => 30,:null => false
    	t.string :ruc,:limit =>10, :null => false
    	t.string :timbrado,:limit => 10,:null => false
    	t.string :telefono,:limit => 15,:null => false
    	t.string :telefono_auxiliar,:limit => 15, :null => true
    	t.date :timbrado_vencimiento, :null => false
    end
  end
end
