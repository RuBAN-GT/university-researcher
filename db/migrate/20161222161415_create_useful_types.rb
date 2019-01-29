class CreateUsefulTypes < ActiveRecord::Migration[5.0]
  def change
    create_table :useful_types do |t|
      t.string :name

      t.references :parent, :index => true

      t.timestamps
    end
  end
end
