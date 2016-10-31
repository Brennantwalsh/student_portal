Rails.application.routes.draw do
	get '/signup' => 'users#new'
	post '/users' => 'users#create'
	  
	get '/login' => 'sessions#new'
	post '/login' => 'sessions#create'
	delete '/logout' => 'sessions#destroy'

	get '/students' => 'students#index'
    get '/students/new' => 'students#new'
    post '/students' => 'students#create'
    get '/students/:id' => 'students#show'
    get '/students/:id/edit' => 'students#edit'
    patch '/students/:id' => 'students#update'
    delete '/students/:id' => 'students#destroy'
end
