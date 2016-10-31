class ExperiencesController < ApplicationController

  def index
    @experiences = Experiences.all
  end

  def show
    @experience = Experience.find(params :id)
  end

  def new
  end

  def create
    @experience = Unirest.post("#{ ENV["api_domain_name"] }experience/#{params[:id]}.json", 
                          headers:{ "Accept" => "application/json" }, 
                          parameters: { 
                            :student_id => params[:student_id],
                            :start_date => params[:start_date],
                            :end_date => params[:end_date],
                            :job_title => params[:job_title],
                            :company_name => params[:company_name],
                            :details => params[:details]
                            }).body


    redirect_to   "student/#{@experience['id']}"
  end

  def edit
    @experience = Unirest.get("#{ ENV["api_domain_name"] }/experience/#{params[:id]}.json").body
  end

  def destroy
    @experience = Unirest.delete("#{ ENV["api_domain_name"] }/experience/#{params[:id]}.json", 
                            headers:{ "Accept" => "application/json" }).body

    flash[:success] = response["message"]
    redirect_to "/experiences/#{@experience["id"]}"
  end

end
