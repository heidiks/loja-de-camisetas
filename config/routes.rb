Rails.application.routes.draw do
  root "products#index"
  resources :products, only: [:new, :create, :destroy]
  get "/products/search" => "products#search", as: :search_product
end
