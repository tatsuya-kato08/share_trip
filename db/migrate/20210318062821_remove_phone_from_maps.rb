class RemovePhoneFromMaps < ActiveRecord::Migration[6.0]
  def change
    remove_column :maps, :phone, :string
  end
end
