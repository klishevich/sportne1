Sportne1::Application.routes.draw do

  match '/recent_videos', to: 'videos#recent_videos', via: 'get'

  match '/popular_videos', to: 'videos#popular_videos', via: 'get'

  authenticated :user do
    root :to => 'home#index'
  end
  root :to => "home#index"
  devise_for :users
  
  resources :users do 
    resources :videos
  end

end