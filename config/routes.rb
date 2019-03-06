Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resources :patients do
    resources :prescriptions do
      resources :drug_reminders
    end
  end

  root to: "patients#index"
end
