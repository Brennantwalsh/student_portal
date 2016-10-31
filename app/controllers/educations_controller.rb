class EducationsController < ApplicationController
  def index
    @educations = Education.all
  end

  def show
    @education = Education.find(params[:id])
  end

  def edit
    @education = Education.find(params[:id])
  end

  def update
    @id = params[:id]
    @education = Education.find(params[:id])
    @education.update({start_date: params[:start_date],
                       end_date: params[:end_date],
                       degree: params[:degree],
                       university_name: params[:university_name],
                       details: params[:details]
      })
    redirect_to "/educations/#{@id}"
  end
end
