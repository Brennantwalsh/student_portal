class Student
	attr_reader :id
	attr_accessor :first_name, :last_name, :email, :phone, :short_bio, :linkedin, :twitter, :blog, :online_resume, :github, :photo

	def initialize(hash)
		@first_name = hash["first_name"]
		@last_name = hash["last_name"]
		@email = hash["email"]
		@phone = hash["phone"]
		@short_bio = hash["short_bio"]
		@linkedin = hash["linkedin"]
		@twitter = hash["twitter"]
		@blog = hash["blog"]
		@online_resume = hash["online_resume"]
		@github = hash["github"]
		@photo = hash["photo"]
	end

	def self.find(params_id)
		Student.new(Unirest.get("#{ ENV["API_DOMAIN_NAME"] }/students/#{params_id}.json").body)
	end

	def self.all
		collection = []
		Unirest.get("#{ ENV["API_DOMAIN_NAME"] }/students.json").body.each do |student_hash|
			collection << Student.new(student_hash)
		end
		collection
	end
end
