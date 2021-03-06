class CreateCategories < ActiveRecord::Migration[5.0]
  def change
    create_table :categories do |t|
      t.string :main_type,
        :null => false,
        :index => true,
        :default => 'class'

      t.string :original_name, :index => true
      t.string :name, :index => true

      t.references :parent, :index => true

      t.timestamps
    end
  end
end
