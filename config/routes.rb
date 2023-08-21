Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  # get '/lists' to: 'lists#index'

  # Create new list
  # get '/lists/new', to: 'lists#new', as: :new_list
  # post 'lists/:id', to: 'lists#create'

  resources :lists, except: [:edit, :update] do
    resources :bookmarks, except: [:edit, :update, :show]
  end

  resources :bookmarks, only: :destroy
end
