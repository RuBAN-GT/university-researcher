class PositionsHaveAndBelongToManyPrimers < ActiveRecord::Migration[5.0]
  def self.up
    create_table :positions_primers, :id => false do |t|
      t.references :position
      t.references :primer
    end

    execute "ALTER TABLE positions_primers ADD PRIMARY KEY (position_id, primer_id);"
  end

  def self.down
    drop_table :positions_primers
  end
end
