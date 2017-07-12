class SearchController < ApplicationController
  def index
    conn = Faraday.new :url => "https://api.propublica.org/congress/v1/members/house/CO/current.json", :headers => {"X-API-Key" => ENV["propublica_api_key"]}
    response = conn.get
    @result = JSON.parse(response.body, symbolize_names: true)[:results]
    # binding.pry
  end
end
