class CapstonesController < ApplicationController
	def index
		@capstones = Capstone.all
	end

	def show
		@capstone = Capstone.find(params[:id])
	end

	def edit
		@capstone = Unirest.get("#{ ENV["api_domain_name"] }/capstones/#{params[:id]}.json").body
	end

	def update
		@capstone = Unirest.patch("#{ ENV["api_domain_name"] }/capstones/#{params[:id]}.json", 
                        headers:{ "Accept" => "application/json" }, 
                        parameters: { 
                        	:name => params[:name], 
                        	:description => params[:description], 
                        	:url => params[:url], 
                        	:screenshot => params[:screenshot], 
                        	}).body

		redirect_to "/capstones/#{@capstone["id"]}"
	end
end
