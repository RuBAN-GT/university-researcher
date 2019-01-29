class CreatePositions < ActiveRecord::Migration[5.0]
  def change
    create_table :positions do |t|
       # Название
      t.string :original_name, :index => true
      t.string :name, :index => true

      # Морфологическое описание
      t.text :description

      # Хозяйственная значимость
      t.text :importance

      # Карта рестрикции гена
      t.text :restriction_map

      # Выровненная последовательность
      t.string :aligned_sequence

      # Временные метки
      t.timestamps

      # Генетический маркер
      t.references :genetic_marker,
        :null => false,
        :index => true
    end
  end
end
