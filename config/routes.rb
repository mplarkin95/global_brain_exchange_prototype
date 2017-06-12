Rails.application.routes.draw do
  devise_for :users , controllers: {registrations: 'users/registrations'}
  root to: 'home#index'
  resources :recruiters
  resources :students
  get 'search/students', to: "search#student_search"
  get 'search/recruiters', to: "search#recruiter_search"
  resources :search
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
