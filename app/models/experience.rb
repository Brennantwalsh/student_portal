class Experience < ApplicationRecord
  belongs_to :user
  attr_accessor :start_date, :end_date, :job_title, :job_title, :company_name, :details


  def initialize(hash)
    @student_id = hash["student_id"]
    @start_date = hash["start_date"]
    @stop_date = hash["stop_date"]
    @job_title = hash["job_title"]
    @company_name = hash["company_name"]
    @details = hash["details"]

  end

  def self.all 
    collection = []
    Unirest.get("#{ENV["api_domain_name"]}/experiences.json", headers: {
      "Accept" => "application/json",
      "X-User-Email" => ENV['USER_EMAIL'],
      "Authorization" => "Token token=#{ENV['API_TOKEN']}"
      }).body_each do |experience_hash|
      collection << Experience.new(experience_hash)
    end
    collection
  end

  def self.find(params_id)
    Experience.new(Unirest.get("#{ENV["api_domain_name"]}/companies/#{params[:id]}).json").body

end
