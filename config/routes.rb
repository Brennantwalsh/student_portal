Rails.application.routes.draw do


get '/signup' => 'users#new'
post '/users' => 'users#create'
  
get '/login' => 'sessions#new'
post '/login' => 'sessions#create'
delete '/logout' => 'sessions#destroy'

get '/experiences' => 'experiences#index'
get '/experiences/new' => 'experiences#new'
post '/experiences' => 'experiences#create'
get '/experiences/:id/edit' => 'experirences#edit'
patch '/experiences/:id' => 'experiences#update'
get '/experiences/:id' => 'experiences#show'
delete '/experiences/:id' => 'experiences#destrory'

end
