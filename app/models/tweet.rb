class Tweet < ApplicationRecord

  belongs_to :user
  has_one_attached :image
  has_many :comments

  def self.search(search)
    if search != ""
      Tweet.where('title LIKE(?)', "%#{search}%")
    else
      Tweet.all
    end
  end

  with_options presence: true do
    validates :title
    validates :text
    validates :image
  end
end
