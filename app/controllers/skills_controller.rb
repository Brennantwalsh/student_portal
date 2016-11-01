class SkillsController < ApplicationController

  def index
    @skills = Skill.all
  end

  def show
    @skill = Skill.find(params[:id])
  end

  def edit
    @skill = Skill.find(params[:id])
  end

  def update
    @id =params[:id]
    @skill = Skill.find(params[:id])
    @skill.update({skill_name: params[:skill_name]})
    redirect_to "/skills/#{@id }"
  end
end
