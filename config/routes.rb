Rails.application.routes.draw do
  resources :employees do
    member do
      get :print_hierarchy
    end
    collection do
      get :top_employees
      get :resigned_employees
    end
  end


  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
