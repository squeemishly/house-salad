class Search < ApplicationRecord
  def get_info
    Faraday.new :url => "https://api.propublica.org/congress/v1/members/house/CO/current.json", :headers => {"X-API-Key" => ENV["propublica_api_key"]}
  end
end
