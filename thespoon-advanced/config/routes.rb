Rails.application.routes.draw do
  get 'reviews/new'
  get 'reviews/create'
  resources :restaurants do
    collection do                       # collection => no restaurant id in URL
      get 'top', to: 'restaurants#top'                         # RestaurantsController#top
    end
    member do                             # member => restaurant id in URL
      get 'chef'                          # RestaurantsController#chef
    end
    resources :reviews, only: [ :new, :create ]
  end
end
