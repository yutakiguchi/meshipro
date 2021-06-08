Rails.application.routes.draw do
  get 'homes/top'
  get 'homes/about'
  devise_for :cocks,controllers:{
    sessions:'cocks/sessions',
    regstractions:'cocks/registractions'
  }

  scope module: :cock do
    root to: 'homes#top'
    get 'about'=>'homes#about'
    resources :recipes
    resources :cocks
    resources :restaurants
  end
end
