Rails.application.routes.draw do
  devise_for :users
  scope :api, defaults: { format: :json } do
    devise_for :users, controllers: {
      registrations: 'registrations'
    }, skip: [:sessions, :password]
    resources :tweets
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
