class CreateConfiguracions < ActiveRecord::Migration
  def change
    create_table :configuracions do |t|
      t.binary :logo, :null => false
    end
  end
end
