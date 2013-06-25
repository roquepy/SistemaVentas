class CreateStock < ActiveRecord::Migration
  def change
    create_table :stock do |t|
      t.integer :id_deposito
      t.integer :id_producto
      t.integer :cantidad

      t.timestamps
    end
  end
end
