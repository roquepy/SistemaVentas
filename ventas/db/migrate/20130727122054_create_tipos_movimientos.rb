class CreateTiposMovimientos < ActiveRecord::Migration
  def change
    create_table :tipos_movimientos do |t|
     t.string :descripcion,:limite=>10,:null=>false
    end
  end
end
