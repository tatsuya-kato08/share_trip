class RemoveCodeFromMaps < ActiveRecord::Migration[6.0]
  def change
    remove_column :maps, :code, :string
  end
end
