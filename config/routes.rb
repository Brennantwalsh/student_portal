Rails.application.routes.draw do

get '/signup' => 'users#new'
post '/users' => 'users#create'
  
get '/login' => 'sessions#new'
post '/login' => 'sessions#create'
delete '/logout' => 'sessions#destroy'

get '/educations' => 'educations#index'
get '/educations/:id' => 'educations#show'
get '/educations/:id/edit' => 'educations#edit'
patch '/educations/:id' => 'educations#update' 

get '/students' => 'students#index'
get '/students/:id' => 'students#show'
get '/students/:id/edit' => 'students#edit'
patch '/students/:id' => 'students#update'

get '/experiences' => 'experiences#index'
get '/experiences/new' => 'experiences#new'
post '/experiences' => 'experiences#create'
get '/experiences/:id/edit' => 'experiences#edit'
patch '/experiences/:id' => 'experiences#update'
get '/experiences/:id' => 'experiences#show'
delete '/experiences/:id' => 'experiences#destrory'


get '/skills' => 'skills#index'
get '/skills/new' => 'skills#new'
post '/skills' => 'skills#create'
get '/skills/:id/edit' => 'skills#edit'
patch '/skills/:id' => 'skills#update'
get '/skills/:id' => 'skills#show'
delete '/skills/:id' => 'skills#destrory'



end
