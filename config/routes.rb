Rails.application.routes.draw do
  # Set up devise.
  devise_for :users

  # Require user to be logged in to access any portion of site.
  authenticated :user do
    # Set up nested courses and assignments.
    resources :courses do
      resources :assignments
    end

    root to: 'courses#index', as: :authenticated_root
  end
  root to: redirect('/users/sign_in')
  match '*path' => redirect('/users/sign_in'), via: :get

end
