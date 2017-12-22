Rails.application.routes.draw do
  devise_for :users
   root 'groups#index'
<<<<<<< HEAD
   resources:users, only:[:index, :edit, :update]
   resources:members
   resources:groups, only: [:index,:new, :edit, :update, :create]do
   resources:messages, only: [:index,:new, :edit, :update, :create]
=======
   resources :users
   resources :members
   resources :groups, only: [:index,:new, :edit, :update, :create]do
   resources :messages, only: [:index,:new, :edit, :update, :create]
>>>>>>> origin/ajax
 end
  get 'search' => 'users#search'
end
