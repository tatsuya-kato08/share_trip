class RemovePlaceNameFromMaps < ActiveRecord::Migration[6.0]
  def change
    remove_column :maps, :place_name, :string
  end
end
