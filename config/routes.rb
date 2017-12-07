Rails.application.routes.draw do
  devise_for :users
   root 'messages#index'
   resources:users
   patch 'messages/:id' =>'messages#update'
   get 'messages/:id/edit' =>'messages#edit'

end
