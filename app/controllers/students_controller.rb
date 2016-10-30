class StudentsController < ApplicationController
		def index
			@students = Student.all
		end

		def show
			@student = Student.find(params[:id])
		end

		def new
			
		end

		def create
			@student = Unirest.post("#{ ENV["api_domain_name"] }/students/#{params[:id]}.json", 
	                        headers:{ "Accept" => "application/json" }, 
	                        parameters: { 
	                        	:first_name => params[:first_name], 
	                        	:last_name => params[:last_name], 
	                        	:email => params[:email], 
	                        	:phone => params[:phone], 
	                        	:short_bio => params[:short_bio],
	                        	:linkedin => params[:linkedin],
	                        	:twitter => params[:twitter],
	                        	:blog => params[:blog],
	                        	:online_resume => params[:online_resume],
	                        	:github => params[:github],
	                        	:photo => params[:photo],
	                        }).body

			redirect_to "/students/#{@student["id"]}"
		end

		def edit
			@student = Unirest.get("#{ ENV["api_domain_name"] }/student/#{params[:id]}.json").body
		end

		def update
			@student = Unirest.patch("#{ ENV["api_domain_name"] }/student/#{params[:id]}.json", 
	                        headers:{ "Accept" => "application/json" }, 
	                        parameters: { 
	                        	:first_name => params[:first_name], 
	                        	:last_name => params[:last_name], 
	                        	:email => params[:email], 
	                        	:phone => params[:phone], 
	                        	:short_bio => params[:short_bio],
	                        	:linkedin => params[:linkedin],
	                        	:twitter => params[:twitter],
	                        	:blog => params[:blog],
	                        	:online_resume => params[:online_resume],
	                        	:github => params[:github],
	                        	:photo => params[:photo],
	                        	}).body

			redirect_to "/students/#{@student["id"]}"
		end

		def destroy
			@student = Unirest.delete("#{ ENV["api_domain_name"] }/students/#{params[:id]}.json", 
			                        headers:{ "Accept" => "application/json" }).body

			flash[:success] = response["message"]
			redirect_to "/students"
		end
end
