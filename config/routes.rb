Rails.application.routes.draw do
  get 'top' => 'homes#top'
  root "blogs#index"
  resources :blogs
end
