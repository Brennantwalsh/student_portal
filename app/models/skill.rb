class Skill < ApplicationRecord

  def initialize(hash)
    @skill = hash["skill"]
  end

  def self.all 
    collection = []
    Unirest.get("#{ENV["api_domain_name"]}/skills.json", headers: {
      "Accept" => "application/json"
      }).body_each do |skill_hash|
      collection << Skill.new(skill_hash)
    end
    collection
  end

  def self.find(params_id)
    Skill.new(Unirest.get("#{ENV["api_domain_name"]}/skills/#{params[:id]}).json").body
  end

  def self.edit
    @skill = Unirest.patch("#{ ENV["api_domain_name"]}/skills/#{params[:id]}.json").body
  end

   def self.show
    @skill = Unirest.get("#{ ENV["api_domain_name"]}/skills/#{params[:id]}.json").body
  end
end
