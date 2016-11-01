class Skill
  attr_accessor :skill_name
  attr_reader :id, :student_id

  def initialize(hash)
    @student_id = hash["student_id"]
    @skill = hash["skill_name"]
  end

  def self.find(params_id)
    Skill.new(Unirest.get("#{ ENV['API_DOMAIN_NAME'] }/skills/#{params_id}.json",
      headers: {"Accept" => "applications/json"}).body)
  end

  def self.all 
    collection = []
      Unirest.get("#{ENV["API_DOMAIN_NAME"]}/skills.json", 
        headers: {"Accept" => "application/json"}).body.each do |skills_hash|
        collection << Skill.new(skills_hash)
      end
    collection
  end


  def update(hash)
    Unirest.patch("#{ ENV['API_DOMAIN_NAME']}/skills/#{params_id}.json", headers: {
      "Accept" => "application/json"
      }, 
      parameters: {
        skill_name: hash[:skill_name]
        })
  end

 
end
