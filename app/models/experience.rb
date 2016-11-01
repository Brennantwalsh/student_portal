class Experience 
  attr_accessor :start_date, :end_date, :job_title, :job_title, :company_name, :details


  def initialize(hash)
    @student_id = hash["id"]
    @start_date = hash["start_date"]
    @stop_date = hash["stop_date"]
    @job_title = hash["job_title"]
    @company_name = hash["company_name"]
    @details = hash["details"]

  end

  def self.all 
    collection = []
    Unirest.get("#{ENV["API_DOMAIN_NAME"]}/experiences.json", headers: {
      "Accept" => "application/json"
      }).body.each do |experience_hash|
      collection << Experience.new(experience_hash)
    end
    collection
  end



  def self.edit
    @experience = Unirest.patch("#{ ENV["API_DOMAIN_NAME"]}/experiences/#{params[:id]}.json", headers: {
      "Accept" => "application/json"
      }).body
  end



end