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

  # post "tims_stamps/stampstart" => "time_stamps#stampstart", as: "stampstart"
  get "time_stamps/stamps/:id" => "time_stamps#stamps", as: "stamps"
  patch "time_stamps/stamp" =>"time_stamps#endstamp", as: "endstamp"
  # post "tims_stamps/stamps" => "time_stamps#start_time_stamp", as: "start_time_stamp"
  # patch "tims_stamps/stamps" => "time_stamps#end_time_stamp", as: "end_time_stamp"
  resources :time_stamps, only:[:new,:create,:show,:edit,:update,:index]
end
