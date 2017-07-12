class SearchController < ApplicationController
  def index
    # conn = Search.get_info
    # binding.pry
    response = Search.get_info(params["state"])
    # conn = Faraday.new :url => "https://api.propublica.org/congress/v1/members/house/#{params["state"]}/current.json", :headers => {"X-API-Key" => ENV["propublica_api_key"]}
    # response = conn.get do |req|
    #   req.headers['X-API-Key'] = "#{ENV["propublica_api_key"]}"
    # end
    # binding.pry
    @result = JSON.parse(response.body, symbolize_names: true)[:results]
  end
end
