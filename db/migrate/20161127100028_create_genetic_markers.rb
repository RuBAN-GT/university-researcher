class CreateGeneticMarkers < ActiveRecord::Migration[5.0]
  def change
    create_table :genetic_markers do |t|
      t.string :marker, :null => false, :index => true, :unique => true

      t.timestamps
    end
  end
end
