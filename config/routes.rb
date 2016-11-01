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

get '/experience' => 'experience#index'
get '/experience/new' => 'experience#new'
post '/experience' => 'experience#create'
get '/experience/:id/edit' => 'experience#edit'
patch '/experience/:id' => 'experience#update'
get '/experience/:id' => 'experience#show'
delete '/experience/:id' => 'experience#destrory'


get '/skills' => 'skills#index'
get '/skills/new' => 'skills#new'
post '/skills' => 'skills#create'
get '/skills/:id/edit' => 'skills#edit'
patch '/skills/:id' => 'skills#update'
get '/skills/:id' => 'skills#show'
delete '/skills/:id' => 'skills#destrory'



end
