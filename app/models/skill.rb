class Skill

  def initialize(hash)
    @student_id = hash["student_id"]
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
    Skill.new(Unirest.get("#{ENV["api_domain_name"]}/skills/#{params_id}).json", headers: {
      "Accept" => "application/json"
      }).body
  end

  def self.update
    Unirest.patch("#{ ENV["api_domain_name"]}/skills/#{params_id}.json", headers: {
      "Accept" => "application/json"
      }, parameters: {
        skills: hash[:skills]
        }).body
  end

 
end
