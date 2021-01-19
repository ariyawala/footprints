class Article < ApplicationRecord
  belongs_to :user
  has_one_attached :image

  validates :image, presence: true
  validates :title, presence: true
  validates :memo, presence: true
  validates :place, presence: true
  validates :date, presence: true

end
