class AllowNilPositionMarker < ActiveRecord::Migration[5.0]
  def change
    change_column_null :positions, :genetic_marker_id, true
  end
end
