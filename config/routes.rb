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
    resources :users
    resources :recipes
  end
end
