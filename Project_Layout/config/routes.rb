Rails.application.routes.draw do

  # get 'registrations/create'

  
  get 'checkout/index'

  root to: 'page#home'

  # friendly URLs pagintion
  concern :paginatable do
    get '(page/:page)', action: :index, on: :collection, as: ''
  end

  get 'page/home'

  get 'page/about'

  get 'page/contact'

  
  devise_for :users, class_name: "FormUser", :controllers => { omniauth_callbacks: 'omniauth_callbacks' , registrations: 'registrations' }

             

  resources :products , concerns: :paginatable do
    member do
      put "like", to: "products#upvote"
      put "dislike", to: "products#downvote"
    end

  end


  resources :line_items do
     put 'decrease', on: :member
      put 'increase', on: :member
      put 'remove', on: :member
  end
  resources :carts
  resources :categories


  


  resources :orders, :new => { express: 'express'}
  
   
  resources :cart, only: [:add, :destroy, :clearCart]
 
  get 'auth/failure', to: redirect('/')

  get 'signout', to: 'sessions#destroy', as: 'signout'

 # get 'cart/show'
 # get '/cart' => "cart#index"
 # get '/cart/clear' => "cart#clearCart"
 # get '/cart/:id' => "cart#add"
 #  get '/destroy/:id' => "cart#remove"


  

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
 
end
