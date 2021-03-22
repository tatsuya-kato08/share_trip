class RemoveNumberFromMaps < ActiveRecord::Migration[6.0]
  def change
    remove_column :maps, :number, :string
  end
end
