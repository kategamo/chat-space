Rails.application.routes.draw do
  devise_for :users
   root 'messages#index'
   resources:users do
   patch 'messages/:id' =>'messages#update'
   get 'messages/:id/edit' =>'messages#edit'
 end
   resources:groups, only: [:new, :edit, :update, :create]do
   resources:message, only: [:index]
 end
end
