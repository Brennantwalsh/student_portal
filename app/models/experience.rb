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

  # def self.all 
  #   collection = [{"id" => "1", "start_date" => " 12-31-45", "end_date" => "", "job_title" => "Chief", "company_name" => "Cubs", "details" => "I did stuff and it was awesome"}]
  #   collection
  # end

ef self.all 
    collection = []
    Unirest.get("#{ENV["api_domain_name"]}/experience.json", headers: {
      "Accept" => "application/json"
      }).body_each do |experience_hash|
      collection << Experience.new(experience_hash)
    end
    collection
  end

  def self.find(params_id)
    Experience.new(Unirest.get("#{ENV["api_domain_name"]}/experience/#{params[:id]}).json", headers: {
      "Accept" => "application/json"
      }).body
  end

  def self.edit
    @experience = Unirest.patch("#{ ENV["api_domain_name"]}/experience/#{params[:id]}.json", headers: {
      "Accept" => "application/json"
      }).body
  end



end
