Rails.application.routes.draw do
  get 'pages/home'
  devise_for :users, :controllers => { :registrations => "users/registrations" }
  root to: "pages#home"

  resources :fidelity_programs do
    resources :rewards
    resources :inscriptions do
      resources :participations
    end
  end

  # --------------Route Fidelty Programme-----------------
  get "/customers", to: "fidelity_programs#show_clients", as: :customers
  get "/subscribe", to: "inscriptions#new", as: :subscribe
  get "/fidelity_programs/:fidelity_program_id/inscriptions/:id/status", to: "inscriptions#status", as: :status_profile
  get "/etablissement", to: "pages#etablissement", as: "etablissement"
  get "/validations", to: "pages#validations", as: "validations"
  get "/settings", to: "pages#settings", as: "settings"
  get "/landing", to: "pages#landing", as: "landing"

  # --------------Route Customers-----------------

  get "/fidelity_programs/:fidelity_program_id/inscriptions/:id/customers_scans", to: "pages#customers_scans", as: :customers_scans
  get "/customers_etablissement", to: "pages#customers_etablissement"

  # --------------Route Participation-----------------
  get "/fidelity_programs/:fidelity_program_id/inscriptions/:id/customers_rewards", to: "pages#customers_rewards", as: :customers_rewards
  get "/customers_etablissement", to: "pages#customers_etablissement"

  # --------------Route Participations-----------------
  post "/fidelity_programs/:fidelity_program_id/inscriptions/:id/customers_rewards", to: "participations#redeem", as: :redeem_points
  get "/fidelity_programs/:fidelity_program_id/inscriptions/:id/history", to: "inscriptions#history", as: :history
end
