class RemoveCityFromMaps < ActiveRecord::Migration[6.0]
  def change
    remove_column :maps, :city, :string
  end
end
