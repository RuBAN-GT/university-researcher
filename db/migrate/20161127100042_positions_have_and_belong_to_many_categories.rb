class PositionsHaveAndBelongToManyCategories < ActiveRecord::Migration[5.0]
  def self.up
    create_table :positions_categories, :id => false do |t|
      t.references :position
      t.references :category
    end

    execute "ALTER TABLE positions_categories ADD PRIMARY KEY (position_id, category_id);"
  end

  def self.down
    drop_table :positions_categories
  end
end
