class CreatePrimers < ActiveRecord::Migration[5.0]
  def change
    create_table :primers do |t|
      t.string :code, :null => false, :index => true, :unique => true
      t.string :sequence, :null => false
      t.string :direction, :null => false, :default => :forward

      t.timestamps
    end
  end
end
