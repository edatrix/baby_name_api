class StateFetcher < ActiveRecord::Base

  def self.connection
    Faraday.new("http://localhost:3000/api/v1/states") do |faraday|
      faraday.request :url_encoded
      faraday.response :logger
      faraday.adapter Faraday.default_adapter
    end
  end

  def self.find(id)
    response = connection.get "#{id}.json"
    State.new(JSON.parse(response.body))
  end

end
