Rails.application.routes.draw do
  devise_for :users
   root 'groups#index'
   resources:users
   resources:members
   resources:groups, only: [:index,:new, :edit, :update, :create]do
   resources:messages, only: [:index,:new, :edit, :update, :create]
 end
end
