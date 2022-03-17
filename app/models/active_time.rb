class ActiveTime < ApplicationRecord

  belongs_to :target

  #1日1回の打刻のため、target_id,dateが同じものは重複しないバリデーション
  validates :target_id, uniqueness: { scope: :date }

  #打刻開始時の処理
  #打刻終了時の処理

end
