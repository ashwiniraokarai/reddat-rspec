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

# api and v1 are just namespaces so the route can be structured like this: http://localhost:3000/api/v1/links
# which matches the folder structure where the index method mapping to the endpoint lives:
# controllers/api/v1/links_controller
  namespace :api do
    namespace :v1 do
      resources :links, only: [:index, :create]
    end
  end

end
