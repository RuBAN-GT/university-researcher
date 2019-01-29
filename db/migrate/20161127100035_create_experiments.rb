class CreateExperiments < ActiveRecord::Migration[5.0]
  def change
    create_table :experiments do |t|
      t.string :sequence, :null => false
      t.string :genbank_id, :index => true

      t.timestamps

      t.references :position, :null => false, :index => true
    end
  end
end
