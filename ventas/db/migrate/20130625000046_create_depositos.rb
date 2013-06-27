class CreateDepositos < ActiveRecord::Migration
  def change
    create_table :depositos do |t|
      t.string :nombre,:limit => 15, :null => false
    end
  end
end
