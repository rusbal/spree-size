Spree::Core::Engine.add_routes do
  namespace :admin do
    resources :sizes
  end
end