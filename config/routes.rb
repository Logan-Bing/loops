Rails.application.routes.draw do
  get 'pages/home'
  devise_for :users
  root to: "pages#home"

  resources :fidelity_programs do
    resources :rewards
  end
end
