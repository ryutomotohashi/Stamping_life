Rails.application.routes.draw do

  devise_for :users
  root to: "homes#top"
  get "/about" => "homes#about", as: "about"
  #user関連
  resources :users, only:[:show,:edit,:update] do
    resource :relationships, only:[:create, :destroy]
    get "followings" => "relationships#followings", as: "followings"
    get "followers" => "relationships#followers", as: "followers"
  end

  resources :targets, only:[:new,:create,:show,:edit,:update,:index] do
    resources :target_comments, only:[:create,:destroy]
    resource :favorites, only:[:create,:destroy]
  end

  #打刻画面
  get "time_stamps" => "time_stamps#time_stamps", as: "time_stamps"
  #打刻開始
  post "time_stamps" => "time_stamps#start_stamp", as: "start_stamp"
  #打刻終了
  patch "time_stamps/:id" => "time_stamps#end_stamp", as: "end_stamp"
  #打刻一覧画面
  get "stamplists" => "time_stamps#stamp_lists", as: "stamp_lists"
  get "stamplists/:id" => "time_stamps#show", as: "stamp_list"
  patch "stamplists/:id" => "time_stamps#update"
  #打刻詳細画面とデータ更新
end
