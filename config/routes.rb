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

  resources :targets, only:[:new,:create,:show,:edit,:update,:index]

end
