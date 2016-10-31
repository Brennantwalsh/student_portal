class Education
  attr_reader :id, :start_date, :end_date, :degree, :university_name, :details

  def initialize(hash)
    @id = hash["id"]
    @start_date = hash["start_date"]
    @end_date = hash["end_date"]
    @degree = hash["degree"]
    @university_name = hash["university_name"]
    @details = hash["details"]
  end

  def self.all 
    collection = [{"id" => "1", "start_date" => "11-10-19", "end_date" => "11-10-16", "degree" => "Acting", "university_name" => "point park", "details" => "welp" }]
    collection
  end

  def self.find(params_id)
    Education.new(Unirest.get("#{ENV['API_DOMAIN_NAME']}/api/v1/educations/#{params_id}.json",
      headers: {"Accept" => "applications/json",
        }).body)
  end

  def self.update
    Unirest.patch("#{ENV['API_DOMAIN_NAME']}/api/v1/star_wars/#{id}",
                              headers: {"Accept" => "applications/json",
                              },
                              parameters: {
                                start_date: hash[:start_date],
                                end_date: hash[:end_date],
                                quote: hash[:quote]
                              })
  end

end
