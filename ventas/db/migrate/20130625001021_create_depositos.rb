class CreateDepositos < ActiveRecord::Migration
  def change
    create_table :depositos do |t|
      t.string :nombre

      t.timestamps
    end
  end
end
