Rails.application.routes.draw do
  root to: 'pages#home'
  devise_for :users, controllers: { registrations: 'users/registrations' }
  resources :users do 
    # use the singular of profile because the user only has one profile 
    # use plural if the user has many of the object (eg. images)
    resource :profile
  end
  get 'about', to: 'pages#about'
  resources:contacts, only: :create
  get 'contact-us', to: 'contacts#new', as: 'new_contact'
  
end
