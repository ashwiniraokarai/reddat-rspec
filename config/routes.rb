Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'links#index'

  resources :links, only: [:new, :show, :create] do
    #nested resources upvote and downvote have their routes (obviously) and their own controller but not models (and therefore no dedicated tables)
    #note that the "create" actions are hooked up to the Link model's upvote and downvote action
    #upvote and downvote are attributes of Link model (and therefore stored in the links table)
    resource :upvote, only: [:create]
    resource :downvote, only: [:create]
  end
end
