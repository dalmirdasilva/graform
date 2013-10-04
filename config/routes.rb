Graform::Application.routes.draw do

  resources :form_types
  resources :question_types
  resources :users
  resources :sessions
  
  resources :forms do
    
    get :editor
  
    resources :replies do
      resources :answers
    end
    
    resources :questions do
      resources :rules
      resources :options
    end
  end

  match 'logout' => 'sessions#destroy', as: :logout, via: [:get, :delete]
  get 'login' => 'sessions#new', as: :login
  get 'signup' => 'users#new', as: :signup

  root 'sessions#new', as: :root
  
end
