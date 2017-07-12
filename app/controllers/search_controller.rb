class SearchController < ApplicationController
  def index
    # search = Search.get_info

    conn = Faraday.new :url => "https://api.propublica.org/congress/v1/members/house/CO/current.json", :headers => {"X-API-Key" => ENV["propublica_api_key"]}
    response = conn.get do |req|
      req.headers['X-API-Key'] = "#{ENV["propublica_api_key"]}"
    end
    @result = JSON.parse(response.body, symbolize_names: true)[:results]
  end
end
