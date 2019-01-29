class CreatePositionPhotos < ActiveRecord::Migration[5.0]
  def change
    create_table :position_photos do |t|
      t.integer :priority, :null => false, :default => 0

      t.string :photo, :null => false

      t.references :position, :index => true

      t.timestamps
    end
  end
end
