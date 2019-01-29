class AddUsefulTypeToPositions < ActiveRecord::Migration[5.0]
  def change
    add_reference :positions, :useful_type, :index => true, :default => nil
  end
end
