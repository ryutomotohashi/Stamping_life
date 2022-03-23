class Target < ApplicationRecord
  belongs_to :user

  has_many :target_comments, dependent: :destroy
  has_many :favorites, dependent: :destroy

  with_options presence: true do
    validates :title, length: {maximum: 20}
    validates :description, length: {maximum: 150}
  end

  def favorited_by?(user)
    favorites.exists?(user_id: user.id)
  end
end
