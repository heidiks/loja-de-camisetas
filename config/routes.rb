Rails.application.routes.draw do
  resources :departments
  resources :products, only: [:new, :create, :destroy, :edit, :update]
  get "/products/search" => "products#search", as: :search_product
  root "products#index"
end
