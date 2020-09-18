Rails.application.routes.draw do
  # get '/blogs', to: 'blogs#index'
  # get '/stocks', to: 'stocks#index'
  resources :blogs do
    collection do
      post :confirm
    end
  end
end
