class ActiveTime < ApplicationRecord

  belongs_to :user
  belongs_to :target

  #1日1回の打刻のため、user_id,target_id,dateが同じものは重複しないバリデーション
  validates :user_id, uniqueness: { scope: [:target_id, :date] }

end
