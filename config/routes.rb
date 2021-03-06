Rails.application.routes.draw do
 
  post '/rate' => 'rater#create', :as => 'rate'
  resources :ratings
  root "start#search"
  
  
  get "/firstpage", to: "pages#firstpage"
  
  get "/search", to: "search#index"
  
  resources :favorite_books do
    member do
      get 'to_list'
    end
  end
  get "/search", to: "books#search"

  resources :users do
    collection do 
      get   'sign_up'
      post  'login'
      patch 'toggle_public'
    end
  end

  get "/login", to: "start#login"
  
  resources :comments, only: [:create, :destroy]
  
  
  post "/users/log_out", to: "users#log_out"
  
  get "/admin/stat", to: "admin#stat"

  get '/book_lists/public', to: 'book_lists#public'
  
  resources :book_lists do
    post   'add_book',       on: :collection 
    delete 'detach_book',    on: :member
  end

  get '/:id' => "shortener/shortened_urls#show"

  get '/admin/users', to: "admin#users"
  patch '/admin/toggle_ban/', to: "admin#toggle_ban"
  get '/admin/book_lists', to: "admin#book_lists"

  get '/admin/favorite_books_report', to: "admin#favorite_books_report"

 
  
  
  #get "/users_accounts", to: "users_accounts"#show

  
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
