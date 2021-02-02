class Article < ApplicationRecord
  belongs_to :user
  has_one_attached :image, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :likes, -> { order(created_at: :desc) }, dependent: :destroy

  validates :image, presence: true
  validates :title, presence: true
  validates :memo, presence: true
  validates :place, presence: true
  validates :date, presence: true

  def iine_by(user)
    Iine.find_by(user_id: user.id, article_id:id)
  end

end
