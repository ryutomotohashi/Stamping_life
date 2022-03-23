class TimeStamp < ApplicationRecord

  belongs_to :user

  #1日1回の打刻のため、target_id,dateが同じものは重複しないバリデーション
  validates :user_id, uniqueness: { scope: :date }

  #1日の合計を出すメソッド
  def day_total_time
    (end_time-start_time)/3600.to_i
  end
end
