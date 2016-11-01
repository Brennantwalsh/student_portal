class CapstonesController < ApplicationController
	def index
		@capstones = Capstone.all
	end

	def show
		@capstone = Capstone.find(params[:id])
	end

	def edit
		@capstone = Unirest.get("#{ ENV["API_DOMAIN_NAME"] }/capstones/#{params[:id]}.json").body
	end

	def update
		@capstone = Unirest.patch("#{ ENV["API_DOMAIN_NAME"] }/capstones/#{params[:id]}.json", 
                        headers:{ "Accept" => "application/json" }, 
                        parameters: {
                        	:name => params[:name], 
                        	:description => params[:description], 
                        	:url => params[:url], 
                        	:screenshot => params[:screenshot],
                        	:student_id => params[:student_id], 
                        	}).body

		redirect_to "/capstones/#{@capstone["id"]}"
	end
end
