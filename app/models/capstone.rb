class Capstone
	attr_reader :id
	attr_accessor :name, :description, :url, :screenshot, :student_id

	def initialize(hash)
		@name = hash["name"]
		@description = hash["description"]
		@url = hash["url"]
		@screenshot = hash["screenshot"]
		@student_id = hash["student_id"]
	end

	def self.find(params_id)
		Capstone.new(Unirest.get("#{ ENV["API_DOMAIN_NAME"] }/capstones/#{params_id}.json").body)
	end

	def self.all
		collection = []
		Unirest.get("#{ ENV["API_DOMAIN_NAME"] }/capstones.json").body.each do |capstone_hash|
			collection << Capstone.new(capstone_hash)
		end
		collection
	end
end
