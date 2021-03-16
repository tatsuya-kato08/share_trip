class CreateMaps < ActiveRecord::Migration[6.0]
  def change
    create_table :maps do |t|

      t.string :place_name, null: false
      t.string :code,       null: false
      t.integer :area_id,   null: false
      t.string :city,       null: false
      t.string :number,     null: false
      t.string :phone,      null: false
      t.references :user,   foreign_key: true
      t.timestamps
    end
  end
end

