Rails.application.routes.draw do
  get 'pages/home'
  devise_for :users
  root to: "pages#home"

  resources :fidelity_programs do
    resources :rewards
    resources :inscriptions do
      resources :participations
    end
  end

  # resources :inscriptions do
  #   resources :participations
  # end

  get "/customers", to: "fidelity_programs#show_clients", as: :customers
  get "/fidelity_programs/:fidelity_program_id/inscriptions/:id/status", to: "inscriptions#status", as: :status_profile

end
