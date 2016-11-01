class Capstone
	attr_reader :id
	attr_accessor :name, :description, :url, :screenshot,

	def initialize(hash)
		@name = hash["name"]
		@description = hash["description"]
		@url = hash["url"]
		@screenshot = hash["screenshot"]
	end

	def self.find(params_id)
		Capstone.new(Unirest.get("#{ ENV["api_domain_name"] }/capstones/#{params_id}.json").body)
	end

	def show_format
		"Capstone Name: #{@name}
		Description: #{@description}
		URL: #{@url}, '/capstones/#{@id}'
		<img src=#{@screenshot}>"
	end

	def self.all
		collection = []
		Unirest.get("#{ ENV["api_domain_name"] }/capstones.json").body.each do |capstone_hash|
			collection << Capstone.new(capstone_hash)
		end
		collection
	end
end
