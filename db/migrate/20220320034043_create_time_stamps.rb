class CreateTimeStamps < ActiveRecord::Migration[6.1]
  def change
    create_table :time_stamps do |t|
      t.integer :user_id
      t.integer :target_id
      #年月日
      t.date :date
      #開始時間
      t.datetime :start_time
      #終了時間
      t.datetime :end_time, null: true
      t.timestamps
    end
    #DB上で[user_id,target_id,date]が同じ値の場合,レコードは追加されないようにする
    add_index :time_stamps, [:user_id,:target_id, :date], unique: true
  end
end
