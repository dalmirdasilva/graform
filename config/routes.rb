Graform::Application.routes.draw do

  resources :form_types
  resources :question_types
  resources :users
  resources :sessions

  match 'forms/:form_id/questions/type/:type_id/new' => 'questions#new_from_type', via: [:get]
  match 'forms/:form_id/questions/:id/show_preview' => 'questions#show_preview', via: [:get]
  match 'forms/:form_id/questions/:id/next_question' => 'questions#next_question', via: [:get]
  match 'forms/:form_id/replies/new_of_type' => 'replies#new_of_type', via: [:get]
  match 'forms/:form_id/questions/:question_id/options/new_from_type' => 'options#new_from_type', via: [:get]
  match 'forms/:form_id/questions/:question_id/rules/new_by_question' => 'rules#new_by_question', via: [:get]
  match 'forms/:form_id/questions/:question_id/rules/:id/save_next_question' => 'rules#save_next_question', via: [:put]
  
  match 'logout' => 'sessions#destroy', as: :logout, via: [:get, :delete]
  get 'login' => 'sessions#new', as: :login
  get 'signup' => 'users#new', as: :signup
  
  resources :forms do
    
    get :editor
    get :report
    get :copy
  
    resources :replies do
      resources :answers
    end
    
    resources :questions do
      
      resources :rules
      resources :options
    end
  end

  root 'sessions#new', as: :root
  
end
