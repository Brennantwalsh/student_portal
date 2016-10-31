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


end
