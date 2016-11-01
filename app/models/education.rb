class Education
  attr_accessor :start_date, :end_date, :degree, :university_name, :details
  attr_reader :id, :student_id

  def initialize(hash)
    @id = hash["id"]
    @start_date = hash["start_date"]
    @end_date = hash["end_date"]
    @degree = hash["degree"]
    @university_name = hash["university_name"]
    @details = hash["details"]
    @student_id = hash["student_id"]
  end

  def self.all 
    collection = []
      Unirest.get("#{ENV['API_DOMAIN_NAME']}/educations.json", 
        headers: {"Accept" => "applications/json"}).body.each do |educations_hash|
        collection << Education.new(educations_hash)
      end
    collection
  end

  def self.find(params_id)
    Education.new(Unirest.get("#{ENV['API_DOMAIN_NAME']}/educations/#{params_id}.json",
      headers: {"Accept" => "applications/json"}).body)
  end

  def update(hash)
    Unirest.patch("#{ENV['API_DOMAIN_NAME']}/educations/#{id}",
                              headers: {"Accept" => "applications/json",
                              },
                              parameters: {
                                start_date: hash[:start_date],
                                end_date: hash[:end_date],
                                degree: hash[:degree],
                                university_name: hash[:university_name],
                                details: hash[:hash]
                              })
  end

end
