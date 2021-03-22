class Map < ApplicationRecord
  has_many :user_maps
  has_many :users, through: :user_maps
  geocoded_by :address # addressカラムを基準に緯度経度を算出する。
  after_validation :geocode # 住所変更時に緯度経度も変更する。
end
