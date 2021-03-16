class CreateUserMaps < ActiveRecord::Migration[6.0]
  def change
    create_table :user_maps do |t|
      t.references :map, foreign_key: true
      t.references :user, foreign_key: true
      t.timestamps
    end
  end
end
