Rails.application.routes.draw do
  devise_for :users,controllers:{
    sessions:'users/sessions',
    passwords:'users/passwords',
    registrations:'users/registrations'
  }

  devise_for :cocks,controllers:{
    sessions:'cocks/sessions',
    passwords:'cock/passwords',
    registrations:'cocks/registrations'
  }

  scope module: :cock do
    root to: 'homes#top'
    get 'about'=>'homes#about'
    resources :recipes
    resources :cocks
    resources :restaurants
  end

  namespace :public do
    root to: 'homes#top'
    resources :users do
      get :my_recipes, on: :collection
      get :my_restaurants, on: :collection
    end
    resources :recipes do
    resources :recipe_comments,only:[:create,:destroy]
    resource :my_recipes,only:[:create,:destroy]
  end
    resources :restaurants do
    resources :restaurant_comments,only: [:create,:destroy]
    resource :my_restaurants,only:[:create,:destroy]
  end
  end
end
