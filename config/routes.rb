Rails.application.routes.draw do
  resources :boards do
    resources :comments, only: [:create, :edit, :destroy, :update]
  end

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
