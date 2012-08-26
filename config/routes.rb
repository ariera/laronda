Laronda::Application.routes.draw do

  resources :tweets do
    get 'deleted', :on => :collection
    get 'refresh', :on => :collection
    get 'undelete', :on => :member
  end

  authenticated :user do
    root :to => 'home#index'
  end
  root :to => "tweets#index"
  devise_for :users
  resources :users, :only => [:show, :index]
end
