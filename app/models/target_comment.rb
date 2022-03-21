class TargetComment < ApplicationRecord
  belongs_to :user
  belongs_to :target

  validates :comment, presence: true
end
