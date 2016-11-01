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
      "Accept" => "application/json"
      }).body_each do |experience_hash|
      collection << Experience.new(experience_hash)
    end
    collection
  end

  def self.find(params_id)
    Experience.new(Unirest.get("#{ENV["api_domain_name"]}/companies/#{params[:id]}).json").body
  end

  def self.edit
    @experience = Unirest.patch("#{ ENV["api_domain_name"]}/experience/#{params[:id]}.json").body
  end

   def self.show
 +    "Student id: #{@student_id},
 +    Start Date: #{@start_date}
 +    Stop Date: #{@stop_date}
 +    Job Title: #{@job_title}
 +    Company Name: #{@company_name}
 +    Details: #{@details}"

  end

end
