Rails.application.routes.draw do
  post 'image/upload'
  get 'image/index'
  root to: 'image#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
